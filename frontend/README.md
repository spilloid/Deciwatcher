# DeciWatcher Frontend

React 18 dashboard for DeciWatcher, built with Vite.

The app fetches sensor metadata and decibel histories from the Express backend at
`GET /client/data`, then renders one card per active sensor with an inline SVG
bar chart. It is currently a read-only dashboard; sensor management is available
through backend admin API endpoints, not through this UI.

## Scripts

```bash
npm install
npm run dev
npm run build
npm run preview
```

`npm run dev` starts Vite on `http://localhost:3000`. The dev server proxies
`/client`, `/iot`, and `/admin` to `http://localhost:3001` by default.

To point the proxy at another backend:

```bash
VITE_BACKEND_URL=http://192.168.0.177:3001 npm run dev
```

On Windows PowerShell:

```powershell
$env:VITE_BACKEND_URL="http://192.168.0.177:3001"; npm run dev
```

Production builds are written to `frontend/build/`.

## Status

- Stable: React 18 + Vite build, `/client/data` dashboard fetch, per-sensor charts.
- Planned: authentication, admin UI controls, data-retention views.
- Removed: Create React App, `react-scripts`, `react-easy-chart`, and the old service worker scaffold.
