<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/category.asp" -->
<%
Category.conn = conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Category.add(input)) page.id = "addSuccess";
	else {
		var categories = Category.getCategories();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = Category.getCategories();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var category = Category.getCategory(parseInt(input.id));
	if (category.edit(input) == true) page.id = "editSuccess";
	else page.id = "editError";

} else if (user.isAdmin && search.edit != null && search.id) {
	var category = Category.getCategory(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Category.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else {
	var categories = Category.getCategories();
	page.id = "list";
}
%>