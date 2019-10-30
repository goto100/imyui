<!--#include file="Record.asp" -->
<!--#include file="RecordCollection.asp" -->
<!--#include file="DBQuerier.asp" -->
<%
function DBAccess(dbPath) {
	var conn;

	this.dbPath = dbPath;
	this.opened = false;
	this.hasError = false;

	// Insert different type
	function getSQLStr(value) {
		if (value == null) return "NULL";
		switch (value.constructor) {
			case Boolean: return value? "TRUE" : "FALSE";
			case Number: return value.toString();
			case String: return "'" + DBAccess.checkSQL(value) + "'";
			case Date: return "#" + value.format("yyyy/MM/dd HH:mm:ss", 0) + "#";
		}
	}

	this.createRecordSet = function() {
		try {
			return new ActiveXObject("ADODB.RecordSet");
		} catch(e) {
			throw new Error(0, "Can't create DB Recordset, you need ADODB.Recordset object.");
		}
	}

	// Open
	this.open = function() {
		DBAccess.conns.push(this);

		try {
			conn = new ActiveXObject("ADODB.Connection");
		} catch(e) {
			throw new Error(0, "Can't create DB Connection, you need ADODB.Connection object.");
		}
		try {
			conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + this.dbPath;
			conn.Open();
		} catch(e) {
			throw new Error(0, "Database Connection failure.");
		}
		this.opened = true;
	}

	// Close
	this.close = function() {
		if (!this.opened) return;
		try {
			conn.Close();
		} catch(e) {
			throw new Error(0, "Close database connection error.");
		}
		delete conn;
		this.opened = false;
	}

	// Execute
	this.execute = function(sql) {
		if (!this.opened) this.open();

		try {
			return conn.Execute(sql, 0, 0x0001);
		} catch(e) {
			this.hasError = true;
		}
	}

	// Advance query
	this.createQuerier = function() {
		if (!this.opened) this.open();
		DBAccess.queryCount += 1;

		var querier = new DBQuerier;
		querier.setDatabase(this);
		return querier;
	}

	// Query by SQL
	this.query = function(sql, length, currentPage, outVbArr) {
		if (!this.opened) this.open();
		DBAccess.queryCount += 1;

		var querier = new DBQuerier(sql);
		querier.setDatabase(this);
		return querier.query(length, currentPage, outVbArr);
	}

	// Update
	this.update = function(table, value, where) {
		if (!this.opened) this.open();

		var sql = "UPDATE [" + table + "] SET ";
		if (value.constructor == String) sql += value;
		else {
			var e = value.getExpandoNames();
			for (var i = 0; i < e.length; i++) {
				sql +=  " [" + e[i] + "]=";
				sql += getSQLStr(value[e[i]]) + ", ";
			}
			sql = sql.slice(0, -2);
		}
		if (where) sql += " WHERE " + where;

		return this.execute(sql);
	}

	// Insert
	this.insert = function(table, value, returnRecord) {
		if (!this.opened) this.open();

		if (returnRecord) {
			var rs =  this.createRecordSet();
			rs.Open("SELECT * FROM [" + table + "]", conn, 1, 3);
			rs.AddNew();
			var e = value.getExpandoNames();
			for (var i = 0; i < e.length; i++) {
				if (value[e[i]] && value[e[i]].constructor == String) rs(e[i]) = DBAccess.checkSQL(value[e[i]]);
				else if (value[e[i]] && value[e[i]].constructor == Date) rs(e[i]) = new Date(value[e[i]].format("yyyy/MM/dd HH:mm:ss", 0)).getVarDate();
				else rs(e[i]) = value[e[i]];
			}
			rs.Update();
			return new Record(rs).item();
		} else {
			var sql = "INSERT INTO [" + table + "] (", valueStr = "";
			var e = value.getExpandoNames();
			for (var i = 0; i < e.length; i++) {
				sql += "[" + e[i] + "], ";
				valueStr += getSQLStr(value[e[i]]) + ", ";
			}
			sql = sql.slice(0, -2) + ") VALUES (" + valueStr.slice(0, -2) + ")";
	
			return this.execute(sql);
		}
	}

	// Delete
	this.del = function(table, where, range) {
		if (!this.opened) this.open();

		var sql = "DELETE " + (range? range: "*") + " FROM [" + table + "] WHERE " + where;

		return this.execute(sql);
	}

	this.getConn = function() {
		return conn;
	}

	this.beginTrans = function() {
		conn.BeginTrans();
	}

	this.commitTrans = function() {
		conn.CommitTrans();
	}


	this.rollbackTrans = function() {
		conn.RollbackTrans();
	}
}

// Check SQL
DBAccess.checkSQL = function(str) {
	return str.replace(/\'/ig, "''");
}

DBAccess.conns = [];
DBAccess.closeAll = function() {
	for (var i = 0; i < DBAccess.conns.length; i++) DBAccess.conns[i].close();
}
DBAccess.queryCount = 0;
%>