<!-- #include file = "source/index.asp" -->
<%
setPageCategory(newsList.category.id);
page.setTitle("列表");
if (page.category.inId) {
	page.setHeadline("<a href=\"index.asp?cid=" + newsList.category.id + "\">" + newsList.category.name + "</a>");
}
page.content = function() {
	if (newsList.length) {
		page.outputPagebar(newsList.pageCount, newsList.currentPage, newsList.pageParam);
%>
<table class="list">
	<thead>
		<tr>
			<th scope="col">序</th>
			<th scope="col">标题</th>
			<th scope="col">时间</th>
			<th scope="col">查看</th>
			<th scope="col">评</th>
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
			<td colspan="<%=user.isAdmin? "7" : "5"%>">共 <%=newsList.recordCount%> 记录</td>
		</tr>
	</tfoot>
	<tbody>
<%
		for (var i = 0; i < newsList.length; i++) {
%>
		<tr<%if (i%2) {%> class="t2"<%}%>>
			<td><%=i + 1%></td>
			<th scope="row"><a href="news.asp?id=<%=newsList[i].id%>" title="<%=newsList[i].summary%>"><%=newsList[i].title%></a></th>
			<td><%=newsList[i].date.format("YY-MM-DD")%></td>
			<td><%=newsList[i].viewCount%></td>
			<td><%=newsList[i].commentCount%></td>
<%
			if (user.isAdmin) {
%>
			<td><a href="news.asp?edit&amp;id=<%=newsList[i].id%>">修改</a></td>
			<td><a href="news.asp?delete=do&amp;id=<%=newsList[i].id%>">删除</a></td>
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
<p class="msg">暂时没有新闻！</p>
<%
	}
}

if (user.isAdmin) page.addPanel("管理", ["<a href=\"news.asp?add\">添加</a>"]);

page.output();
%>
