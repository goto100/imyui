<!-- #include file = "source/index.asp" -->
<%
setPageCategory(downloads.category.id);
page.setTitle("列表");
if (page.category.inId) {
	page.setHeadline("<a href=\"index.asp?cid=" + downloads.category.id + "\">" + downloads.category.name + "</a>");
}
page.content = function() {
	if (downloads.length) {
		page.outputPagebar(downloads.pageCount, downloads.currentPage, downloads.pageParam);
%>
<table class="list">
	<thead>
		<tr>
			<th scope="col">序号</th>
			<th scope="col">标题</th>
			<th scope="col">时间</th>
			<th scope="col">下载</th>
<%
			if (user.isAdmin) {
%>
			<th scope="col">修改</th>
			<th scope="col">删除</th>
<%
			}
%>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="<%=user.isAdmin? "6" : "4"%>">共 <%=downloads.recordCount%> 记录</td>
		</tr>
	</tfoot>
	<tbody>
<%
		for (var i = 0; i < downloads.length; i++) {
%>
		<tr>
			<td><%=i + 1%></td>
			<th scope="row"><a href="download.asp?id=<%=downloads[i].id%>" title="<%=downloads[i].summary%>"><%=downloads[i].title%></a></th>
			<td><%=downloads[i].date.format()%></td>
			<td><%=downloads[i].downloadCount%></td>
<%
			if (user.isAdmin) {
%>
			<td><a href="download.asp?edit&amp;id=<%=downloads[i].id%>">修改</a></td>
			<td><a href="download.asp?delete=do&amp;id=<%=downloads[i].id%>">删除</a></td>
<%
			}
%>
		</tr>
<%
		}
%>
	</tbody>
</table>
<%
	} else {
%>
<p class="msg">暂时没有下载！</p>
<%
	}
}
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"download.asp?add\">添加</a>"]);

page.output();
%>
