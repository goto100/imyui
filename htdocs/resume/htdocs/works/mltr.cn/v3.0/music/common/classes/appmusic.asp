<%
function AppMusic() {
	this.load = function(dbPath) {
		this.conn = new DBConn();
		this.conn.dbPath = dbPath;
		this.conn.open();
	}

	// Songs
	this.getSongs = function(currentPage) {
		var tmpA = this.conn.query("SELECT id, name, listen, listenCount, viewCount FROM [Songs] ORDER BY name"/*, 20, currentPage*/);
		var songs = {};
		songs = tmpA;
		//songs.currentPage = currentPage;
		//songs.pageCount = getPageCount(tmpA.recordCount, 20);
		return songs;
	}

}
%>