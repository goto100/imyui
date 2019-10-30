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
		+ " FROM [News] AS n, [Categories] AS c"
		+ " WHERE n.id = " + id
		+ " AND c.id = n.cateId", 1);
	if (tmpA) {
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

News.del = function(id) {
	News.conn.del("News", "id=" + id);
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