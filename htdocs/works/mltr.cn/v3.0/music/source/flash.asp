<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "../common/classes/appflash.asp" -->
<!-- #include file = "../common/classes/flash.asp" -->
<%
var appFlash = new AppFlash();
appFlash.conn = conn;

page.category.id = "music";
page.category.name = "音乐";
page.category.addCategory("listen", "在线试听", "index.asp?listen");
page.category.addCategory("lyric", "歌词", "index.asp");
page.category.addCategory("flash", "麦闪", "flash.asp");


Flash.conn = appFlash.conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Flash.add(input)) page.id = "addSuccess";
	else {
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var flash = Flash.getFlash(parseInt(input.id));
	if (flash.edit(input)) page.id = "editSuccess";
	else {
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var flash = Flash.getFlash(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Flash.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.id) {
	var flash = Flash.getFlash(parseInt(search.id));
	flash.viewCountUp();
	page.id = "show";

} else {
	var flashes = appFlash.getFlashes();
	page.id = "list";
}
%>