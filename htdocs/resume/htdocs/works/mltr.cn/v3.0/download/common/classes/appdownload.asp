<%
function AppDownload() {

	// Load
	this.load = function(dbPath) {
		this.conn = new DBConn();
		this.conn.dbPath = dbPath;
		this.conn.open();
	}

	// Categories
	this.getCategories = function() {
		return this.conn.query("SELECT id, name FROM [Download_Categories] ORDER BY id");
	}

	// Get downloads
	this.getDownloads = function(cateId, currentPage) {
		if (cateId) {
			var sql = "SELECT d.id, d.title, d.path, d.date, d.description, d.downloadCount, c.id AS cateId, c.name AS cateName"
			+ " FROM [Downloads] AS d, [Download_Categories] AS c"
			+ " WHERE d.cateId = c.id"
			+ " AND d.cateId = " + cateId;
		} else {
			var sql = "SELECT id, title, path, date, description, downloadCount FROM [Downloads]"
		}
		sql += " ORDER BY date DESC";
		var tmpA = this.conn.query(sql, 20, currentPage);
		var downloads = {};
		if (tmpA) {
			downloads = tmpA;
			downloads.category = {"id":tmpA[0].cateId, "name":tmpA[0].cateName};
		} else if (cateId) {
			var tmpA = this.conn.query("SELECT TOP 1 id, name FROM [Download_Categories] WHERE id = " + cateId);
			downloads.category = {"id":tmpA[0].id, "name":tmpA[0].name};
		}
		downloads.currentPage = currentPage;
		downloads.pageCount = getPageCount(tmpA.recordCount, 20);
		return downloads;
	}
}
%>