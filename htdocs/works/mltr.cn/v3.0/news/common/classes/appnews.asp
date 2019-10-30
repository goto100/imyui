<%
function AppNews() {
	// Categories
	this.getCategories = function() {
		return this.conn.query("SELECT id, name FROM [News_Categories] ORDER BY id");
	}

	// News list
	this.getNewsList = function(cateId, currentPage) {
		if (cateId) {
			var sql = "SELECT n.id, n.title, n.summary, n.date, n.viewCount, n.commentCount, c.id AS cateId, c.name AS cateName"
			+ " FROM [News] AS n, [News_Categories] AS c"
			+ " WHERE n.cateId = c.id"
			+ " AND n.cateId = " + cateId;
		} else {
			var sql = "SELECT id, title, summary, date, viewCount, commentCount FROM [News]"
		}
		sql += " ORDER BY date DESC";
		var tmpA = this.conn.query(sql, 10, currentPage);
		var newsList = [];
		if (tmpA) {
			newsList = tmpA;
			newsList.category = {"id":tmpA[0].cateId, "name":tmpA[0].cateName};
		} else if (cateId) {
			var tmpA = this.conn.query("SELECT TOP 1 id, name FROM [News_Categories] WHERE id = " + cateId);
			newsList.category = {"id":tmpA[0].id, "name":tmpA[0].name};
		}
		newsList.currentPage = currentPage;
		newsList.pageCount = getPageCount(tmpA.recordCount, 10);
		return newsList;
	}

	this.getVbNewsList = function(length) {
		return this.conn.query("SELECT n.id, n.title, n.date, c.id AS cateId, c.name AS cateName"
			+ " FROM [News] AS n, [News_Categories] AS c"
			+ " WHERE n.cateId = c.id"
			+ " ORDER BY date DESC", length, 1, true);
	}
}
%>