import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

// The frontend is a single-page app that talks to the Express backend.
// In dev, proxy the API routes to the backend so the browser can use
// same-origin relative fetches (e.g. fetch('/client/data')).
// Override the target with VITE_BACKEND_URL when your backend is elsewhere.
const backend = process.env.VITE_BACKEND_URL || 'http://localhost:3001';

export default defineConfig({
  plugins: [react()],
  build: { outDir: 'build' },
  server: {
    port: 3000,
    proxy: {
      '/client': backend,
      '/iot': backend,
      '/admin': backend,
    },
  },
});
