<!-- #include file = "../common/common.asp" -->
<%
var cateId;
if (search.cid) cateId = parseInt(search.cid);
var albums = appAlbum.getAlbums(cateId);
%>
