<!-- #include file = "../common/common.asp" -->
<%
var cateId;
var currentPage = search.p? parseInt(search.p) : 1;
if (search.cid) {
	cateId = parseInt(search.cid);
	var pageParam = "cid=" + cateId;
}
var newsList = appNews.getNewsList(cateId, currentPage);
newsList.pageParam = pageParam;
%>