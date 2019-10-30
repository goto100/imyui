<!-- #include file = "../../../common/classes/comment.asp" -->
<%
function News() {
	this.conn = News.conn;

	this.fill = function(value) {
		this.id = value.id;
		this.title = value.title;
		this.url = value.url;
		this.from = value.from;
		this.link = value.link;
		this.summary = value.summary;
		this.content = value.content;
		this.comments = value.comments;
		this.category = {"id":value.cateId, "name":value.cateName};
	}

	this.edit = function(value) {
		var form = News.fillForm(true);
		if (form.submit(value) == true) return true;
		else News.form = form;
	}

	this.viewCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [News] SET viewCount=viewCount+1 WHERE id=" + this.id);
	}
}

News.getNews = function(id) {
	var tmpA = News.conn.query("SELECT TOP 1 n.*, c.id AS cateId, c.name AS cateName"
		+ " FROM [News] AS n, [News_Categories] AS c"
		+ " WHERE n.id = " + id
		+ " AND c.id = n.cateId", 1);
	if (tmpA) {
		Comment.conn = News.conn;
		Comment.tableName = "News_Comments";
		Comment.whereStr = "newsId=" + id;
		var comments = Comment.getComments();
		if (comments) tmpA.comments = comments;
		var news = new News();
		news.fill(tmpA);
		return news;
	}
}

News.add = function(input) {
	var form = News.fillForm();
	if (form.submit(input) == true) return true;
	else News.form = form;
}

News.addComment = function(input) {
	Comment.flag = {"name":"newsId", "type":"number"};
	Comment.conn = News.conn;
	if (Comment.add(input)) {
		var commentCount = News.conn.query("SELECT COUNT(1) AS commentCount FROM [News_Comments] WHERE newsId=" + input.newsId, 1).commentCount;
		News.conn.execute("UPDATE [News] SET commentCount=" + commentCount + " WHERE id=" + input.newsId);
		return true;
	} else return Comment.form;
}

News.del = function(id) {
	News.conn.del("News", "id=" + id);
	News.conn.del("News_Comments", "newsId=" + id);
	return true;
}

News.delComment = function(id) {
	var newsId = News.conn.query("SELECT TOP 1 newsId FROM [News_Comments] WHERE id=" + id, 1).newsId;
	News.conn.del("News_Comments", "id=" + id);
	var commentCount = News.conn.query("SELECT COUNT(1) AS commentCount FROM [News_Comments] WHERE newsId=" + newsId, 1).commentCount;
	News.conn.execute("UPDATE [News] SET commentCount=" + commentCount + " WHERE id=" + newsId);
	return true;
}

News.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = News.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "News";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	form.addItem(true, "title", "string", true, "标题必填");
	form.addItem(true, "cateId", "number", true, "分类必选");
	form.addItem(true, "url", "string");
	form.addItem(true, "from", "string");
	form.addItem(true, "link", "string");
	form.addItem(true, "summary", "string");
	form.addItem(true, "content", "string");

	return form;
}
%>