<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/download.asp" -->
<%
Download.conn = appDownload.conn;

if (!user.loggedIn) {
	page.id = "notLogged";
} else if (user.isAdmin && search.add == "do" && input) {
	if (Download.add(input)) page.id = "addSuccess";
	else {
		var categories = appDownload.getCategories();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = appDownload.getCategories();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var download = Download.getDownload(parseInt(input.id));
	if (download.edit(input)) page.id = "editSuccess";
	else {
		var categories = appDownload.getCategories();
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var categories = appDownload.getCategories();
	var download = Download.getDownload(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Download.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.id) {
	var download = Download.getDownload(parseInt(search.id));
	download.downloadCountUp();
	page.id = "show";
}
%>