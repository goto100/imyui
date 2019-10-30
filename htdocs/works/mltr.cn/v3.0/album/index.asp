<!-- #include file = "source/index.asp" -->
<%
setPageCategory(albums.category.id);
page.setTitle("列表");
if (page.category.inId) {
		page.setHeadline("<a href=\"index.asp?cid=" + albums.category.id + "\">" + albums.category.name + "</a>");
}
page.content = function() {
	if (albums.length) {
%>
<div id="newAlbum">
	<div class="show">
		<h3><%=albums[0].name%><%if (albums[0].title) write(" (" + albums[0].title + ")")%></h3>
		<a href="album.asp?id=<%=albums[0].id%>"><img src="images/<%=albums[0].name%>.jpg" alt="<%=albums[0].name%>" class="show" /></a>
		<p><%=albums[0].intro%></p>
		<a href="album.asp?id=<%=albums[0].id%>" class="more">详细...</a>
<%
			if (user.isAdmin) {
%>
				<a href="album.asp?edit&amp;id=<%=albums[0].id%>">编辑</a>
				<a href="album.asp?delete=do&amp;id=<%=albums[0].id%>">删除</a>
<%
			}
%>
	</div>
</div>
<div id="albums">
	<table class="list">
		<tbody>
<%
		for (var i = 1; i < albums.length; i++) {
%>
			<tr>
				<td><a href="album.asp?id=<%=albums[i].id%>" title="<%=albums[i].intro%>"><img src="images/<%=albums[i].name%>.jpg" alt="<%=albums[i].name%>" width="80" /></a></td>
				<th scope="row"><a href="album.asp?id=<%=albums[i].id%>"><%=albums[i].name%><%if (albums[i].title) write(" (" + albums[i].title + ")")%></a></th>
				<td><%=albums[i].transName%></td>
				<td><%=albums[i].year%></td>
<%
			if (user.isAdmin) {
%>
				<td><a href="album.asp?edit&amp;id=<%=albums[i].id%>">编辑</a></td>
				<td><a href="album.asp?delete=do&amp;id=<%=albums[i].id%>">删除</a></td>
<%
			}
%>
			</tr>
<%
		}
%>
		</tbody>
	</table>
</div>
<%
	} else {
%>
<div id="albums">
	<p class="msg">暂时没有专辑！</p>
</div>
<%
	}
}
if (user.isAdmin) page.addPanel("管理", ["<a href=\"album.asp?add\">添加</a>"]);

page.output();
%>
