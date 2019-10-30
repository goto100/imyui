<%
function DBQuerier(sql) {
	var db = null;
	var selectStr = "";
	var fromStr = "";
	var whereStr = "";
	var orderStr = "";

	this.sql = sql;

	this.setDatabase = function(database) {
		db = database;
	}

	this.addTable = function(name, selects) {
		fromStr += fromStr? ", [" + name + "]" : " FROM [" + name + "]";
		selectStr += selectStr? ", " : "SELECT ";
		if (selects == true) selectStr += name + ".*";
		else {
			for (var i = 0; i < selects.length; i++) selectStr += name + "." + selects[i] + ", ";
			selectStr = selectStr.slice(0, -2);
		}
	}

	this.addWhere = function(where) {
		whereStr += (whereStr? " AND " : " WHERE ") + where;
	}

	this.addOrder = function(order, isDesc) {
		orderStr += (orderStr? ", " : " ORDER BY ") + order + (isDesc? " DESC" : " ASC");
	}

	this.getSql = function() {
		return selectStr + fromStr + whereStr + orderStr;
	}

	this.query = function(length, currentPage, outVbArr) {
		if (!this.sql) this.sql = this.getSql();

		var rs = db.createRecordSet();
		if (length && currentPage) {
			try {
				rs.Open(this.sql, db.getConn(), 1, 1);
			} catch(e) {
				this.hasError = true;
			}
		} else rs = db.execute(this.sql);

		if (length && currentPage) {
			rs.PageSize = length;
			if (!rs.BOF && !rs.EOF) rs.AbsolutePage = currentPage;
		}

		if (!outVbArr) {
			if (length == 1) {
				if (rs.BOF && rs.EOF) return null;
				return new Record(rs).item();
			} else {
				var records = new RecordCollection(rs);
				return records.atEnd()? null : records;
			}
		} else {
			this.recordCount = rs.recordCount;
			return (rs.BOF && rs.EOF)? null : rs.GetRows();
		}
	}
}
%>