<!-- #include file = "../common/common.asp" -->
<%
Album.conn = appAlbum.conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Album.add(input)) page.id = "addSuccess";
	else {
		var categories = appAlbum.getCategories();
		var songs = appAlbum.getSongs();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = appAlbum.getCategories();
	var songs = appAlbum.getSongs();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var album = Album.getAlbum(parseInt(input.id));
	if (album.edit(input) == true) page.id = "editSuccess";
	else {
		var categories = appAlbum.getCategories();
		var songs = appAlbum.getSongs();
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var categories = appAlbum.getCategories();
	var songs = appAlbum.getSongs();
	var album = Album.getAlbum(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Album.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.comment != null && input) {
	if (Album.addComment(input) == true) page.id = "commentSuccess";
	else {
		var album = Album.getAlbum(parseInt(input.albumId));
		page.id = "commentError";
	}

} else if (search.id) {
	var album = Album.getAlbum(parseInt(search.id));
	album.viewCountUp();
	page.id = "show";
}
%>