<!-- #include file = "../common/common.asp" -->
<%
var cateId;
var currentPage = search.p? parseInt(search.p) : 1;
if (search.cid) {
	cateId = parseInt(search.cid);
	var pageParam = "cid=" + cateId;
}
var downloads = appDownload.getDownloads(cateId, currentPage);
downloads.pageParam = pageParam;
%>