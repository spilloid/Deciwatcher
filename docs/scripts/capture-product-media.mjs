#!/usr/bin/env node
// Repeatable product screenshots for the DeciWatcher docs / GitHub Pages site.
//
// It builds the frontend, serves the production bundle with `vite preview`,
// intercepts the dashboard's GET /client/data call with realistic mocked
// sensor + reading data, and captures the live UI to docs/assets/screenshots.
//
// Usage (from repo root):
//   npm install --prefix %TEMP%\deciwatcher-playwright playwright
//   npx --prefix %TEMP%\deciwatcher-playwright playwright install chromium
//   $env:PLAYWRIGHT_NODE_MODULES="$env:TEMP\deciwatcher-playwright\node_modules"
//   node docs/scripts/capture-product-media.mjs
//
// Env overrides:
//   DECIWATCHER_CAPTURE_BASE_URL   point at an already-running server (skips build+serve)
//   PLAYWRIGHT_NODE_MODULES        where to load Playwright from
//   DECIWATCHER_CAPTURE_DEBUG=1    verbose browser/API logging

import { createRequire } from "node:module";
import { spawn } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const require = createRequire(import.meta.url);
const repoRoot = path.resolve(fileURLToPath(new URL("../..", import.meta.url)));
const frontendDir = path.join(repoRoot, "frontend");
const outDir = path.join(repoRoot, "docs", "assets", "screenshots");
const externalBaseUrl = process.env.DECIWATCHER_CAPTURE_BASE_URL || null;
const baseUrl = externalBaseUrl || "http://127.0.0.1:4173";
const debug = process.env.DECIWATCHER_CAPTURE_DEBUG === "1";
const npmCmd = process.platform === "win32" ? "npm.cmd" : "npm";
const useShell = process.platform === "win32";

function quoteShellPart(part) {
  if (/^[A-Za-z0-9_./:=\\-]+$/.test(part)) return part;
  return `"${part.replace(/"/g, '\\"')}"`;
}

function loadPlaywright() {
  const candidates = [
    process.env.PLAYWRIGHT_NODE_MODULES
      ? path.join(process.env.PLAYWRIGHT_NODE_MODULES, "playwright")
      : null,
    path.join(frontendDir, "node_modules", "playwright"),
    "playwright",
  ].filter(Boolean);

  for (const candidate of candidates) {
    try {
      return require(candidate);
    } catch {
      // try the next location
    }
  }

  throw new Error(
    [
      "Playwright is required to capture product media.",
      "Install it in a temp directory, then point PLAYWRIGHT_NODE_MODULES at that node_modules folder:",
      "  npm install --prefix %TEMP%\\deciwatcher-playwright playwright",
      "  npx --prefix %TEMP%\\deciwatcher-playwright playwright install chromium",
      '  $env:PLAYWRIGHT_NODE_MODULES="$env:TEMP\\deciwatcher-playwright\\node_modules"',
      "  node docs/scripts/capture-product-media.mjs",
    ].join("\n")
  );
}

// ── Mocked data ──────────────────────────────────────────────────────────
// Realistic library/office deployment. dB values track each location's vibe:
// study rooms stay quiet, the café and group pods run louder.
function minutesAgo(mins) {
  return new Date(Date.now() - mins * 60_000).toISOString();
}

// Tiny SVG "location photo" placeholder so the cards render an image without
// bundling binary assets into this script.
function locationPhoto(label, bg) {
  const svg =
    `<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'>` +
    `<defs><linearGradient id='g' x1='0' y1='0' x2='1' y2='1'>` +
    `<stop offset='0' stop-color='white' stop-opacity='0.28'/>` +
    `<stop offset='1' stop-color='black' stop-opacity='0.12'/></linearGradient></defs>` +
    `<rect width='200' height='200' fill='${bg}'/>` +
    `<rect width='200' height='200' fill='url(#g)'/>` +
    `<text x='100' y='105' font-family='Inter,sans-serif' font-size='16' fill='white' ` +
    `text-anchor='middle' opacity='0.9'>${label}</text></svg>`;
  return "data:image/svg+xml;charset=utf8," + svg.replace(/#/g, "%23");
}

const sensors = [
  { MAC: "A4:CF:12:0A:1B:01", SensorName: "Reading Room", Location: "North wall · 2nd floor", Picture: locationPhoto("Reading Room", "%231e3a5f"), base: 42, swing: 6 },
  { MAC: "A4:CF:12:0A:1B:02", SensorName: "Study Hall 2B", Location: "East wing · quiet zone", Picture: locationPhoto("Study Hall 2B", "%23134e4a"), base: 46, swing: 8 },
  { MAC: "A4:CF:12:0A:1B:03", SensorName: "Café Corner", Location: "Ground floor · entrance", Picture: locationPhoto("Cafe Corner", "%237c2d12"), base: 64, swing: 9 },
  { MAC: "A4:CF:12:0A:1B:04", SensorName: "Group Study Pods", Location: "3rd floor · collaboration", Picture: locationPhoto("Group Pods", "%234c1d95"), base: 70, swing: 10 },
];

function buildReadings() {
  const readings = [];
  const points = 30; // ~30 minutes of history at 1 reading/min
  for (const s of sensors) {
    for (let i = points; i >= 0; i--) {
      const wobble = Math.sin(i / 3) * s.swing + (Math.random() - 0.5) * 4;
      readings.push({
        MAC: s.MAC,
        Decibels: Math.max(30, Math.round(s.base + wobble)),
        Time: minutesAgo(i),
      });
    }
  }
  return readings;
}

const clientData = {
  sensors: sensors.map(({ base, swing, ...rest }) => rest),
  readings: buildReadings(),
};

// ── Server plumbing ──────────────────────────────────────────────────────
function run(cmd, args, opts = {}) {
  return new Promise((resolve, reject) => {
    const child = spawn(
      useShell ? [cmd, ...args].map(quoteShellPart).join(" ") : cmd,
      useShell ? [] : args,
      { stdio: "inherit", shell: useShell, ...opts }
    );
    child.on("error", reject);
    child.on("exit", (code) =>
      code === 0 ? resolve() : reject(new Error(`${cmd} ${args.join(" ")} exited ${code}`))
    );
  });
}

async function waitForServer(url) {
  const deadline = Date.now() + 60_000;
  while (Date.now() < deadline) {
    try {
      const res = await fetch(url, { signal: AbortSignal.timeout(3000) });
      if (res.ok) return;
    } catch {
      // keep waiting
    }
    await new Promise((r) => setTimeout(r, 500));
  }
  throw new Error(`Timed out waiting for ${url}`);
}

async function main() {
  fs.mkdirSync(outDir, { recursive: true });
  const { chromium } = loadPlaywright();

  let preview;
  let browser;
  try {
    if (!externalBaseUrl) {
      console.log("Building frontend...");
      await run(npmCmd, ["run", "build"], { cwd: frontendDir });
      console.log(`Starting vite preview at ${baseUrl}...`);
      const previewArgs = ["run", "preview", "--", "--port", "4173", "--strictPort", "--host", "127.0.0.1"];
      preview = spawn(
        useShell ? [npmCmd, ...previewArgs].map(quoteShellPart).join(" ") : npmCmd,
        useShell ? [] : previewArgs,
        {
          cwd: frontendDir,
          stdio: debug ? "inherit" : "ignore",
          shell: useShell,
        }
      );
    }
    await waitForServer(baseUrl);

    console.log("Launching Chromium...");
    browser = await chromium.launch({ headless: true });
    const page = await browser.newPage({ viewport: { width: 1280, height: 1400 }, deviceScaleFactor: 2 });
    if (debug) {
      page.on("console", (m) => console.log(`BROWSER ${m.type()}: ${m.text()}`));
      page.on("pageerror", (e) => console.log(`BROWSER pageerror: ${e.message}`));
    }

    await page.route("**/client/data", (route) =>
      route.fulfill({ status: 200, contentType: "application/json", body: JSON.stringify(clientData) })
    );

    console.log("Rendering dashboard...");
    await page.goto(baseUrl, { waitUntil: "domcontentloaded" });
    await page.addStyleTag({
      content: `*, *::before, *::after { transition-duration: 0s !important; animation-duration: 0s !important; opacity: 1 !important; }`,
    });
    await page.getByText("Reading Room", { exact: true }).waitFor({ timeout: 20_000 });
    await page.waitForTimeout(400);

    // Viewport-framed shot (header + first cards) for embedding, plus the full
    // scrolling dashboard for anyone who wants the whole floor at once.
    await page.screenshot({ path: path.join(outDir, "deciwatcher-dashboard.jpg"), type: "jpeg", quality: 90 });
    await page.screenshot({ path: path.join(outDir, "deciwatcher-dashboard-full.jpg"), type: "jpeg", quality: 88, fullPage: true });

    console.log("Rendering single sensor card...");
    const card = page.locator("section.post").first();
    await card.scrollIntoViewIfNeeded();
    await card.screenshot({ path: path.join(outDir, "deciwatcher-sensor-card.jpg"), type: "jpeg", quality: 92 });

    console.log(`Captured screenshots in ${path.relative(repoRoot, outDir)}`);
  } finally {
    if (browser) await browser.close();
    if (preview) preview.kill();
  }
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
