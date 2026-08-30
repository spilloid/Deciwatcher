# Changelog

All notable changes to DeciWatcher are documented in this file, reconstructed
from `git log` (no prior changelog existed).

DeciWatcher does not use a single project-wide version number: `frontend/package.json`
is at `0.1.0` and `backend/package.json` is at `1.0.0`, versioned independently and
neither backed by git tags. Because there is no unified versioning convention to
key off of, entries below are grouped by date and milestone instead of by version.

## 2026-08-23 — Standards and dependency refresh

- Adopted company PR and version-freshness documentation standards.
- Refreshed vulnerable transitive dependencies.

## 2026-07-29 – 2026-08-02 — Dependency security patches

- Bumped `body-parser` (backend) to patch a known vulnerability.
- Bumped `postcss` (frontend) to patch a known vulnerability.

## 2026-07-11 — Accessibility

- Added an accessible dashboard lightbox for screenshots.

## 2026-07-04 – 2026-07-05 — Frontend modernization

- Migrated the frontend build from Create React App to Vite.
- Upgraded dependencies and removed known vulnerabilities; updated docs.
- Updated the OpenReplay session-replay integration.

## 2026-04-12 — Revival

- Repository revived after being dormant since 2019.
- Documentation rewritten to reflect the current state of the project.
- Published the project's GitHub Pages site.

## 2019-07-18 — Original capstone submission

- Initial submission for an IUPUI senior capstone: ESP8266 sensor-node
  firmware, an Express/MySQL backend, and a Create-React-App dashboard.
- Added the final report and project proposal PDFs.
