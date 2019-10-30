<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appalbum.asp" -->
<%
var appAlbum = new AppAlbum();
appAlbum.conn = conn;

page.category.id = "album";
page.category.name = "专辑";
page.category.addCategory("album", "专辑", "index.asp?cid=1");
page.category.addCategory("greatest", "精选集", "index.asp?cid=2");
page.category.addCategory("ep", "单曲专辑", "ep.asp");
page.category.addCategory("other", "其他", "other.asp");

function setPageCategory(id) {
	if (id == 1) page.category.inId = "album";
	else if (id == 2) page.category.inId = "greatest";
}
%>