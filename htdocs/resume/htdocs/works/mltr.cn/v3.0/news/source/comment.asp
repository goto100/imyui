<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/news.asp" -->
<%
News.conn = appNews.conn;

if (search["delete"] == "do" && search.id) {
	News.delComment(parseInt(search.id));
	page.id = "deleteSuccess";
}
%>