<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/category.asp" -->
<!-- #include file = "../common/classes/update.asp" -->
<%
Category.conn = conn;
Update.conn = conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Update.add(input)) page.id = "addSuccess";
	else {
		var categories = Category.getCategories();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = Category.getCategories();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var update = Update.getUpdate(parseInt(input.id));
	if (update.edit(input) == true) page.id = "editSuccess";
	else {
		var categories = Categories.getCategories();
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var categories = Category.getCategories();
	var update = Update.getUpdate(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Update.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else {
	var updates = Update.getUpdates();
	page.id = "list";
}
%>