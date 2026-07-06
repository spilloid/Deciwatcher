require('dotenv').config();
const mysql = require('mysql2/promise');

let wrap;

// Build a parameterized "WHERE a = ? AND b = ?" clause from a plain object.
function buildWhere(where) {
	const keys = Object.keys(where || {});
	if (keys.length === 0) return { clause: '', params: [] };
	const clause = ' WHERE ' + keys.map(() => '?? = ?').join(' AND ');
	const params = [];
	for (const k of keys) params.push(k, where[k]);
	return { clause, params };
}

/*
 * Singleton connection pool — import getWrap() wherever DB access is needed.
 * Credentials are read from environment variables (see .env.example).
 *
 * The returned object exposes the small query/select/insert/update surface the
 * routers rely on, backed directly by the maintained mysql2 driver. (This used
 * to be the unmaintained `mysql-wrap` package, which pulled a vulnerable
 * `underscore` with no upstream fix.)
 */
module.exports = {
	getWrap: function () {
		if (wrap) return wrap;
		const pool = mysql.createPool({
			host:     process.env.DB_HOST     || "localhost",
			user:     process.env.DB_USER     || "root",
			password: process.env.DB_PASSWORD || "",
			database: process.env.DB_NAME     || "capstone"
		});

		wrap = {
			// Raw SQL passthrough — resolves to the array of result rows.
			query: async (sql, params = []) => {
				const [rows] = await pool.query(sql, params);
				return rows;
			},
			// SELECT * FROM <table> [WHERE ...] — resolves to matching rows.
			select: async (table, where) => {
				const { clause, params } = buildWhere(where);
				const [rows] = await pool.query('SELECT * FROM ??' + clause, [table, ...params]);
				return rows;
			},
			// INSERT INTO <table> SET ... — resolves to the OkPacket.
			insert: async (table, values) => {
				const [result] = await pool.query('INSERT INTO ?? SET ?', [table, values]);
				return result;
			},
			// UPDATE <table> SET ... [WHERE ...] — resolves to the OkPacket.
			update: async (table, set, where) => {
				const { clause, params } = buildWhere(where);
				const [result] = await pool.query('UPDATE ?? SET ?' + clause, [table, set, ...params]);
				return result;
			}
		};
		return wrap;
	}
};
