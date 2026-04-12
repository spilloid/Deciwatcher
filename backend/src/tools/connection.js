require('dotenv').config();
let mysql = require('mysql');
let createMySQLWrap = require('mysql-wrap');
let wrap;

/*
 * Singleton connection pool — import getWrap() wherever DB access is needed.
 * Credentials are read from environment variables (see .env.example).
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
		wrap = createMySQLWrap(pool);
		return wrap;
	}
};
