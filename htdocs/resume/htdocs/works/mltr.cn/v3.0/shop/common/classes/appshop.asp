<%
function AppShop() {

	// Load
	this.load = function() {
		this.conn = new DBConn();
		this.conn.dbPath = this.dbPath;
		this.conn.open();
	}

	// Categories
	this.getCategories = function() {
		return this.conn.query("SELECT id, name FROM [Categories] ORDER BY id");
	}

	// Goods list
	this.getGoodsList = function(cateId, currentPage) {
		if (cateId) {
			var sql = "SELECT g.id, g.name, g.intro, g.date, g.picPath, g.isCommend, c.id AS cateId, c.name AS cateName"
			+ " FROM [Goods] AS n, [Categories] AS c"
			+ " WHERE n.cateId = c.id"
			+ " AND n.cateId = " + cateId;
		} else {
			var sql = "SELECT id, name, intro, date, picPath, isCommend FROM [Goods]"
		}
		sql += " ORDER BY date DESC";
		var tmpA = this.conn.query(sql, 10, currentPage);
		var goodsList = [];
		if (tmpA) {
			goodsList = tmpA;
			goodsList.category = {"id":tmpA[0].cateId, "name":tmpA[0].cateName};
		} else if (cateId) {
			var tmpA = this.conn.query("SELECT TOP 1 id, name FROM [Categories] WHERE id = " + cateId);
			goodsList.category = {"id":tmpA[0].id, "name":tmpA[0].name};
		}
		goodsList.currentPage = currentPage;
		goodsList.pageCount = getPageCount(tmpA.recordCount, 10);
		return goodsList;
	}
}
%>