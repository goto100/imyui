<%
function AppFlash() {
	this.load = function(dbPath) {
		this.conn = new DBConn();
		this.conn.dbPath = dbPath;
		this.conn.open();
	}

	// Flashes
	this.getFlashes = function() {
		return this.conn.query("SELECT id, name, author, date, viewCount FROM [Flashes] ORDER BY name");
	}

}
%>