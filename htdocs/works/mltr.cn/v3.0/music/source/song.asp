<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/song.asp" -->
<%
Song.conn = appMusic.conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Song.add(input)) page.id = "addSuccess";
	else {
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var song = Song.getSong(parseInt(input.id));
	if (song.edit(input)) page.id = "editSuccess";
	else {
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var song = Song.getSong(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Song.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.listen != null && search.id) {
	var song = Song.getSong(parseInt(search.id));
	song.listenCountUp();
	page.id = "listen";

} else if (search.id) {
	var song = Song.getSong(parseInt(search.id));
	song.viewCountUp();
	page.id = "show";
}
%>