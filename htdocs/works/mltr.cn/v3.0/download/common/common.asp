<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appdownload.asp" -->
<%
var appDownload = new AppDownload();
appDownload.conn = conn;

page.category.id = "download";
page.category.name = "下载";
page.category.addCategory("song", "歌曲", "index.asp?cid=1");
page.category.addCategory("mtv", "录影带", "index.asp?cid=2");
page.category.addCategory("midi", "Midi音乐", "index.asp?cid=3");
page.category.addCategory("other", "其他", "index.asp?cid=4");

function setPageCategory(id) {
	if (id == 1) page.category.inId = "song";
	else if (id == 2) page.category.inId = "mtv";
	else if (id == 3) page.category.inId = "midi";
	else if (id == 4) page.category.inId = "other";
}
%>