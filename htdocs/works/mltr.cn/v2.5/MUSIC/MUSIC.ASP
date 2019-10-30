<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="music"
CateRoot="music"
title="歌曲中心"
%>
<!-- #include file="../header.asp" -->
<%
Dim MusicRS
SetRS MusicRS, Conn, "SELECT * FROM Music_Content ORDER BY MusicName"
%>
<div id="bodier">
	<div id="form">
		<table>
<%
Do Until MusicRS.EOF
%>
			<tr><td><a href="musicedit.asp?musicname=<%=CheckStr(MusicRS("MusicName"))%>"><%=MusicRS("MusicName")%></a></td></tr>
<%
	MusicRS.MoveNext
Loop
%>
		</table>
	</div>
</div>
<!-- #include file="../footer.asp" -->