let  mysql = require('mysql');
let createMySQLWrap = require('mysql-wrap');
let wrap;
/*
Only need 1 file with a password; everywhere else just uses this pool! Safety!
 */
module.exports = {
	getWrap : function () {
		if (wrap) return wrap;
		const pool = mysql.createPool({
			host: "localhost",
			user: "jdspille",
			password: "joseph",
			database: "capstone"
		});
		wrap = createMySQLWrap(pool);
		return wrap;
	}
};
