<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="album"
CateRoot="album"
Cate="album"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="newalbum">
<%
ShowContentH2 "最新专辑"

Dim AlbumNewRS
Set AlbumNewRS=Conn.Execute("SElECT TOP 1 * FROM Album_Album ORDER BY AlbumID DESC")
%>
		<div class="show">
			<h3><%=AlbumNewRS("AlbumName")%></h3>
			<a href="albumshow.asp?album=<%=CheckStr(AlbumNewRS("AlbumName"))%>"><img src="../resources/album/album/<%=AlbumNewRS("AlbumName")%>.jpg" alt="<%=AlbumNewRS("AlbumName")%>" class="show" /></a>
			<%=UbbCode(AlbumNewRS("AlbumIntro"), 0, 0, 0, 0, "")%>
			<a href="albumshow.asp?album=<%=CheckStr(AlbumNewRS("AlbumName"))%>" class="more">详细...</a>
		</div>
	</div>
	<div id="otheralbum">
<%
ShowContentH2 "其他专辑"

CloseRS AlbumNewRS

Dim AlbumRS
SetRS AlbumRS, Conn, "SELECT AlbumID,AlbumName,AlbumYear FROM Album_Album ORDER BY AlbumID"

Dim i
For i=1 To AlbumRS.RecordCount-1
%>
		<a href="albumshow.asp?album=<%=AlbumRS("AlbumName")%>"><img src="../resources/album/album/small/<%=AlbumRS("AlbumName")%>.jpg" alt="<%=AlbumRS("AlbumName")%>" /></a>
<%
	AlbumRS.MoveNext
Next
Set i=Nothing
%>
		<p class="msg">共<em><%=AlbumRS.RecordCount%></em>张专集。</p>
<%
CloseRS AlbumRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->