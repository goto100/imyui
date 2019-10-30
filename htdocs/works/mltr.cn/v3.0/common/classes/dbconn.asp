<%
function DBConn() {
	var conn;

	this.dbPath = "";
	this.opened = false;

	// Open
	this.open = function() {
		if (!this.dbPath) outputErrorMsg("Database path does not exist.");

		try {
			conn = new ActiveXObject("ADODB.Connection");
		} catch(e) {
			outputErrorMsg("Can't create DB Connection, you need ADODB.Connection object.");
		}
		if (!this.opened) {
			//try {
				conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + this.dbPath;
				conn.Open();
			//} catch(e) {
			//	outputErrorMsg("Database Connection failure.");
			//}
			this.opened = true;
		}
	}

	// Close
	this.close = function() {
		if (this.opened) {
			try {
				conn.Close();
			} catch(e) {
				outputErrorMsg(e);
			}
			delete conn;
			this.opened = false;
		}
	}

	// Execute
	this.execute = function(sql) {
		if (!this.opened) this.open();

		//try {
			return conn.Execute(sql);
		//} catch(e) {
		//	outputErrorMsg(e);
		//}
	}

	// Query
	this.query = function(sql, length, currentPage, outVbArr, dateCols) {
		if (!this.opened) this.open();

		try {
			var rs = new ActiveXObject("ADODB.Recordset");
		} catch(e) {
			outputErrorMsg("Can't create DB Recordset, you need ADODB.Recordset object.");
		}

		//try {
			if (length && currentPage) rs.Open(sql, conn, 1, 1);
			else rs = this.execute(sql); // Simple query
		//} catch(e) {
			//outputErrorMsg(e);
		//}

		if (rs.BOF && rs.EOF) return null;
		else {
			if (length && currentPage) {
				rs.PageSize = length;
				if (currentPage <= rs.PageCount) rs.AbsolutePage = currentPage;
				else return null;
				var result = rs.GetRows(length);
			} else var result = rs.GetRows();

			if (!outVbArr) {
				var tmp = [];
				var rows = result.ubound(2);
				var cols = result.ubound(1);
				for (var i = 0; i <= rows; i++) {
					tmp[i] = [];
					for (var j = 0; j <= cols; j++) {
						var t = result.getItem(j, i);
						if (typeof(t) == "date") tmp[i][rs.Fields(j).Name] = new Date(t);
						else tmp[i][rs.Fields(j).Name] = t;
					}
				}
				result = tmp;
				result.recordCount = rs.recordCount;
				if (length == 1) result = result[0];
			} else this.recordCount = rs.recordCount;

			rs.Close();
			delete rs;

			return result;
		}
	}

	// Update
	this.update = function(table, values, where) {
		if (!this.opened) this.open();

		var sql = "UPDATE [" + table + "] SET ";
		var e = values.getExpandoNames();
		for (var i = 0; i < e.length; i++) {
			if (values[e[i]] != undefined) {
				sql +=  " [" + e[i] + "]=";
				switch (values[e[i]].constructor) {
					case Boolean:
						sql += values[e[i]] + ", ";
						break;
	
					case Number:
						sql += values[e[i]] + ", ";
						break;
	
					case String:
						sql += "'" + values[e[i]].checkSQL() + "', ";
						break;
	
					case Date:
						sql += "#" + values[e[i]].format() + "#, ";
				}
			}
		}
		sql = sql.slice(0, -2);
		if (where) sql += " WHERE " + where;

		this.execute(sql);

		return true;
	}

	// Insert
	this.insert = function(table, values) {
		if (!this.opened) this.open();

		var sql = "INSERT INTO [" + table + "] (", valueStr = "";
		var e = values.getExpandoNames();
		for (var i = 0; i < e.length; i++) {
			if (values[e[i]] != undefined) {
				sql += "[" + e[i] + "], ";
				switch (values[e[i]].constructor) {
					case Boolean:
						valueStr += values[e[i]] + ", ";
						break;
	
					case Number:
						valueStr += values[e[i]] + ", ";
						break;
	
					case String:
						valueStr += "'" + values[e[i]].checkSQL() + "', ";
						break;
	
					case Date:
						valueStr += "#" + values[e[i]].format() + "#, ";
				}
			}
		}
		sql = sql.slice(0, -2) + ") VALUES (" + valueStr.slice(0, -2) + ")";
		this.execute(sql);

		return true;
	}

	// Delete
	this.del = function(table, where, range) {
		if (!this.opened) this.open();

		var sql = "DELETE " + (range? range: "*") + " FROM [" + table + "] WHERE " + where;

		this.execute(sql);

		return true;
	}
}
%>