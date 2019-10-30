<!-- #include file="common.asp" -->
<!-- #include file="inc/function.asp" -->
<%
title="网站地图"
%>
<!-- #include file="header.asp" -->
<div id="bodier">
	<div id="content">
		<ul>
<%
Dim i
For i=1 To UBound(Application("NavListName"))
%>
			<li><a href="/<%=SiteFolder%><%=Application("NavListName")(i)%>"><%=Application("NavListCName")(i)%></a></li>
			<ul>
<%
	Set CateListRS=Conn.Execute("SELECT * FROM [Site_Cate] WHERE [NavName]='" & Application("NavListName")(i) & "' ORDER BY [CateID]")
	Do Until CateListRS.EOF
%>
				<li><a href="/<%=Application("NavListName")(i) & "/" & CateListRS("CateURL")%>"><%=CateListRS("CateCName")%></a></li>
<%
		CateListRS.MoveNext
	Loop
%>
			</ul>
<%
Next
%>
		</ul>
	</div>
</div>
<!-- #include file="footer.asp" -->