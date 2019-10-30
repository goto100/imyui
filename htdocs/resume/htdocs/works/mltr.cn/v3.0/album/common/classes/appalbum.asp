<!-- #include file = "album.asp" -->
<%
function AppAlbum() {
	this.load = function(dbPath) {
		this.conn = new DBConn();
		this.conn.dbPath = dbPath;
		this.conn.open();
	}

	this.getSongs = function() {
		return this.conn.query("SELECT id, name FROM [Songs] ORDER BY name");
	}

	this.getAlbums = function(cateId) {
		Album.conn = this.conn;
		return Album.getAlbums(cateId);
	}

	this.getCategories = function() {
		return this.conn.query("SELECT id, name FROM [Music_Categories] ORDER BY id");
	}
}
%>