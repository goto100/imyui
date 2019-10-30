<!-- #include file = "../../../common/classes/form.asp" -->
<%
function Download() {
	this.conn = Download.conn;

	this.fill = function(value) {
		this.id = value.id;
		this.title = value.title;
		this.path = "attachments/" + value.path;
		this.description = value.description;
		this.category = {"id":value.cateId, "name":value.cateName};
	}

	this.edit = function(value) {
		var form = Download.fillForm(true);
		if (form.submit(value) == true) return true;
		else Download.form = form;
	}

	this.downloadCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [Downloads] SET downloadCount=downloadCount+1 WHERE id=" + this.id);
	}
}

Download.getDownload = function(id) {
	var tmpA = Download.conn.query("SELECT TOP 1 d.*, c.id AS cateId, c.name AS cateName"
		+ " FROM [Downloads] AS d, [Download_Categories] AS c"
		+ " WHERE d.id = " + id
		+ " AND c.id = d.cateId", 1);
	if (tmpA) {
		var download = new Download();
		download.fill(tmpA);
		return download;
	}
}

Download.add = function(input) {
	var form = Download.fillForm();
	if (form.submit(input) == true) return true;
	else Download.form = form;
}

Download.del = function(id) {
	Download.conn.del("Downloads", "id=" + id);
	return true;
}

Download.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Download.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Downloads";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	form.addItem(true, "title", "string", true, "标题必填");
	form.addItem(true, "cateId", "number", true, "分类必选");
	form.addItem(true, "path", "string", true, "路径必填");
	form.addItem(true, "description", "string");

	return form;
}
%>