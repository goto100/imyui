<!-- #include file = "common/classes/appnews.asp" -->
<!-- #include file = "common/classes/news.asp" -->
<%
if (typeof(Application(NAMESPACE + "cacheNewsList")) == "undefined" || search.cleancache == "do") {
	var appNews = new AppNews();
	appNews.load(Server.MapPath("/../database/richter-international.mdb"));
	Application(NAMESPACE + "cacheNewsList") = appNews.getVbNewsList(4);
}
var newsList = Application(NAMESPACE + "cacheNewsList");
%>
<ul>
<%
for (var i = 0; i < newsList.ubound(2) + 1; i++) {
%>
	<li>
		<p class="date"><%=newsList.getItem(2, i)%></p>
		<p><a href="../en/news/news/index.asp?cid=<%=newsList.getItem(3, i)%>"><%=newsList.getItem(4, i)%></a>&nbsp;-&nbsp;<a href="../en/news/news/news.asp?id=<%=newsList.getItem(0, i)%>"><%=newsList.getItem(1, i)%></a></p>
	</li>
<%
}
%>
</ul>
