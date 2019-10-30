<!-- #include file = "form.asp" -->
<%
function Update() {
	this.conn = conn;

	this.fill = function(value) {
		this.id = value.id;
		this.date = value.date;
		this.link = value.link;
		this.info = value.info;
		this.picName = value.picName;
		this.category = {"id":value.cateId, "name":value.cateName};
	}

	this.edit = function(value) {
		var form = Update.fillForm(true);
		if (form.submit(value) == true) return true;
		else Update.form = form;
	}
}

Update.getUpdate = function(id) {
	var tmpA = Update.conn.query("SELECT TOP 1 u.*, c.id AS cateId, c.name AS cateName"
		+ " FROM [Updates] AS u, [Categories] AS c"
		+ " WHERE u.id = " + id
		+ " AND c.id = u.cateId", 1);
	if (tmpA) {
		var update = new Update();
		update.fill(tmpA);
		return update;
	}
}

Update.add = function(input) {
	var form = Update.fillForm();
	if (form.submit(input) == true) return true;
	else Update.form = form;
}

Update.del = function(id) {
	Update.conn.del("Updates", "id=" + id);
	return true;
}

Update.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Update.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Updates";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	form.addItem(true, "cateId", "number", true, "分类必选");
	form.addItem(true, "link", "string");
	form.addItem(true, "info", "string", true, "信息必填");
	form.addItem(true, "picName", "string");

	return form;
}

Update.getUpdates = function() {
	var sql = "SELECT u.*, c.id AS cateId, c.name AS cateName, c.url AS cateURL"
		+ " FROM [Updates] AS u, [Categories] AS c"
		+ " WHERE u.cateId = c.id"
		+ " ORDER BY date DESC";
	var updates = Update.conn.query(sql);
	updates.category = {"id":updates[0].cateId, "name":updates[0].cateName};
	return updates;
}

Update.getTextUpdates = function(length) {
	var sql = "SELECT u.*, c.id AS cateId, c.name AS cateName, c.url AS cateURL"
		+ " FROM [Updates] AS u, [Categories] AS c"
		+ " WHERE u.picName = \"\""
		+ " AND u.cateId = c.id"
		+ " ORDER BY date DESC";
	var updates = Update.conn.query(sql, length, 1, true);
	return updates;
}

Update.getPicUpdates = function(length) {
	var sql = "SELECT u.*, c.id AS cateId, c.name AS cateName, c.url AS cateURL"
		+ " FROM [Updates] AS u, [Categories] AS c"
		+ " WHERE u.picName <> \"\""
		+ " AND u.cateId = c.id"
		+ " ORDER BY date DESC";
	var updates = Update.conn.query(sql, length, 1, true);
	return updates;
}
%>