<!-- #include file = "../../../common/classes/form.asp" -->
<%
function Flash() {
	this.conn = Flash.conn;

	this.fill = function(value) {
		this.id = value.id;
		this.name = value.name;
		this.author = value.author;
		this.date = value.date;
	}

	this.edit = function(value) {
		var form = Flash.fillForm(true);
		if (form.submit(value) == true) return true;
		else Flash.form = form;
	}

	this.viewCountUp = function(number) {
		if (!number) number = 1;
		this.conn.execute("UPDATE [Flashes] SET viewCount=viewCount+1 WHERE id=" + this.id);
	}
}

Flash.getFlash = function(id) {
	var tmpA = Flash.conn.query("SELECT TOP 1 id, name, author, date, viewCount"
		+ " FROM [Flashes]"
		+ " WHERE id = " + id, 1);
	if (tmpA) {
		var flash = new Flash();
		flash.fill(tmpA);
		return flash;
	}
}

Flash.add = function(input) {
	var form = Flash.fillForm();
	if (form.submit(input) == true) return true;
	else Flash.form = form;
}

Flash.del = function(id) {
	Flash.conn.del("Flashes", "id=" + id);
	return true;
}

Flash.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Flash.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Flashes";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	if (!addMode) form.addItem("hidden", "id");
	form.addItem(true, "name", "string", true, "名称必填");
	form.addItem(true, "author", "string");
	form.addItem(true, "date", "date");

	return form;
}
%>
