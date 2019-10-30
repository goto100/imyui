<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="album"
CateRoot="album"
Cate="greatest"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="list">
<%
Dim GreatestRS
SetRS GreatestRS, Conn, "SELECT GreatestID,GreatestName,GreatestYear FROM Album_Greatest ORDER BY GreatestID"

Do Until GreatestRS.EOF
%>
		<a href="greatestshow.asp?greatest=<%=CheckStr(GreatestRS("GreatestName"))%>"><img src="../resources/album/greatest/small/<%=GreatestRS("GreatestName")%>.jpg" alt="<%=GreatestRS("GreatestName")%>" /></a>
<%
	GreatestRS.MoveNext
Loop
%>
		<p class="msg">共<em><%=GreatestRS.RecordCount%></em>张精选集。</p>
<%
CloseRS GreatestRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->