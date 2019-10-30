<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="album"
CateRoot="album"
Cate="other"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
<%
Dim OtherRS
Set OtherRS=Conn.Execute("SELECT * FROM Album_Other")
%>
		<%=UbbCode(OtherRS("OtherContent"), 0, 0, 0, 0, "")%>
<%
CloseRS OtherRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->
