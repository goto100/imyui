<!-- #include file = "../common/common.asp" -->
<%
var cateId;
//var currentPage = search.p? parseInt(search.p) : 1;
if (search.listen != null) var pageParam = "listen";
var songs = appMusic.getSongs(/*currentPage*/);
//songs.pageParam = pageParam;
%>