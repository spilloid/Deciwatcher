import React from 'react';

// Small dependency-free SVG bar chart for a single sensor's decibel history.
// Replaces the unmaintained react-easy-chart (which dragged an old, vulnerable
// d3 + isomorphic-fetch chain into the production bundle) with ~80 lines of SVG.
//
// data: array of { x: <label>, y: <decibels> } in chronological order.

// Colour each bar by how loud the reading is — mirrors the decibel reference
// scale used across the docs (quiet = calm green, painful = red).
function barColor(db){
	if(db < 55)  return '#22c55e'; // ideal / good
	if(db < 70)  return '#f59e0b'; // moderate
	if(db < 85)  return '#f97316'; // loud
	return '#ef4444';              // harmful → danger
}

export default function NoiseChart({ data = [], width = 560, height = 240 }){
	if(data.length === 0){
		return <p style={{ color: '#64748b' }}>No readings yet.</p>;
	}

	const pad = { top: 16, right: 12, bottom: 44, left: 40 };
	const plotW = width - pad.left - pad.right;
	const plotH = height - pad.top - pad.bottom;

	// Fixed 0–120 dB domain so bars are comparable across sensors and the
	// "danger" ceiling is always in frame.
	const maxDb = 120;
	const yTicks = [0, 30, 60, 90, 120];
	const gap = 6;
	const barW = Math.max(2, (plotW - gap * (data.length - 1)) / data.length);

	const yFor = (db) => pad.top + plotH - (Math.min(db, maxDb) / maxDb) * plotH;

	// Only label a handful of x ticks so they stay readable.
	const labelEvery = Math.ceil(data.length / 6);

	return (
		<svg width={width} height={height} role="img" aria-label="Decibel history">
			{/* horizontal grid + y-axis labels */}
			{yTicks.map((t) => {
				const y = yFor(t);
				return (
					<g key={t}>
						<line x1={pad.left} y1={y} x2={width - pad.right} y2={y}
							stroke="#1a2235" strokeWidth="1" />
						<text x={pad.left - 8} y={y + 4} textAnchor="end"
							fontSize="11" fill="#64748b">{t}</text>
					</g>
				);
			})}

			{/* harmful threshold line at 85 dB */}
			<line x1={pad.left} y1={yFor(85)} x2={width - pad.right} y2={yFor(85)}
				stroke="#ef4444" strokeWidth="1" strokeDasharray="4 4" opacity="0.5" />

			{/* bars */}
			{data.map((d, i) => {
				const x = pad.left + i * (barW + gap);
				const y = yFor(d.y);
				const h = pad.top + plotH - y;
				return (
					<g key={i}>
						<rect x={x} y={y} width={barW} height={h} rx="2"
							fill={barColor(d.y)} />
						{i % labelEvery === 0 &&
							<text x={x + barW / 2} y={height - pad.bottom + 16}
								textAnchor="middle" fontSize="10" fill="#64748b"
								transform={`rotate(30 ${x + barW / 2} ${height - pad.bottom + 16})`}>
								{d.x}
							</text>}
					</g>
				);
			})}

			{/* axis titles */}
			<text x={pad.left} y={height - 4} fontSize="11" fill="#94a3b8">Time →</text>
			<text x={12} y={pad.top + plotH / 2} fontSize="11" fill="#94a3b8"
				transform={`rotate(-90 12 ${pad.top + plotH / 2})`}>Decibels</text>
		</svg>
	);
}
