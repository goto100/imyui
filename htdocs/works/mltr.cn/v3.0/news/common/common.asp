<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appnews.asp" -->
<%
var appNews = new AppNews();
appNews.conn = conn;

page.category.id = "news";
page.category.name = "新闻";
page.category.addCategory("news", "最新动态", "index.asp?cid=1");
page.category.addCategory("local", "本站新闻", "index.asp?cid=2");
page.category.addCategory("special", "专题", "index.asp?cid=3");

function setPageCategory(id) {
	if (id == 1) page.category.inId = "news";
	else if (id == 2) page.category.inId = "local";
	else if (id == 3) page.category.inId = "special";
	else if (id == 4) page.category.inId = "special";
}
%>