<!-- #include file = "form.asp" -->
<%
function Category() {
	this.conn = conn;

	this.fill = function(value) {
		this.id = value.id;
		this.name = value.name;
		this.url = value.url;
	}

	this.edit = function(value) {
		var form = Category.fillForm(true);
		if (form.submit(value) == true) return true;
		else Category.form = form;
	}
}

Category.getCategory = function(id) {
	var tmpA = Category.conn.query("SELECT TOP 1 *"
		+ " FROM [Categories]"
		+ " WHERE id = " + id, 1);
	if (tmpA) {
		var category = new Category();
		category.fill(tmpA);
		return category;
	}
}

Category.add = function(input) {
	var form = Category.fillForm();
	if (form.submit(input) == true) return true;
	else Category.form = form;
}

Category.del = function(id) {
	Category.conn.del("Categories", "id=" + id);
}

Category.fillForm = function(isEdit) {
	var form = new Form();
	form.conn = Category.conn;
	form.mode = isEdit? "edit" : "add";
	form.table = "Categories";

	if (isEdit) {
		form.addItem("sign", "id", "number");
		form.addSubmit("id", search.id);
	}
	form.addItem(true, "name", "string", true, "名称必填");
	form.addItem(true, "url", "string");

	return form;
}

Category.getCategories = function() {
	var sql = "SELECT *"
		+ " FROM [Categories]"
		+ " ORDER BY id";
	return Category.conn.query(sql);
}
%>