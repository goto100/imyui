<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="album"
CateRoot="album"
Cate="ep"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="list">
<%
Dim EPRS
Set EPRS=Conn.Execute("SELECT * FROM Album_EP")
%>
	<%=UbbCode(EPRS("EPContent"), 0, 0, 0, 0, "")%>
<%
CloseRS EPRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

If UserValue="Admin" Then
	ShowContentPanel "管理员", "<p><a href=""epedit.asp"">编辑</a></p>"
End If
%>

</div>
<!-- #include file="../footer.asp" -->
