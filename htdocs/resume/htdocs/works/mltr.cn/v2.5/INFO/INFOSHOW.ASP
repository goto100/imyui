<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim InfoShowRS
Set InfoShowRS=Conn.Execute("SELECT * FROM Info_Content WHERE InfoName='" & Request.QueryString("info") & "'")

Plugin="info"
CateRoot="info"
Cate=InfoShowRS("InfoName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
	<%=UbbCode(InfoShowRS("InfoContent"), 0, 0, 0, 0, "")%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
If UserValue="Admin" Then
	ShowContentPanel "管理员", "<p><a href=""infoedit.asp?info=" & CheckStr(InfoShowRS("InfoName")) & """>编辑</a></p>"
End If
CloseRS InfoShowRS
%>
</div>
<!-- #include file="../footer.asp" -->