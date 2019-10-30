<!-- #include file = "../../news/common/classes/news.asp" -->
<%
if (typeof(Application(NAMESPACE + "cacheNewsList.de")) == "undefined" || search.cleancache == "do") {
	var appNews = new AppNews();
	appNews.conn = conn;
	Application(NAMESPACE + "cacheNewsList.de") = appNews.getVbNewsList(4, 2);
}
var newsList = Application(NAMESPACE + "cacheNewsList.de");
%>
<ul>
<%
if (typeof newsList == "unknown") for (var i = 0; i < newsList.ubound(2) + 1; i++) {
%>
	<li><a href="news/news.asp?id=<%=newsList.getItem(0, i)%>"><%=newsList.getItem(1, i)%></a>&nbsp;<%=newsList.getItem(2, i)%></li>
<%
}
%>
</ul>
