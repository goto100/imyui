<!-- #include file = "source/index.asp" -->
<%
if (search.listen != null) {
	page.category.inId = "listen";
	var isListen = true;
} else page.category.inId = "lyric";
page.setTitle("列表");
page.content = function() {
%>
<div id="<%=page.category.inId%>">
<%
	if (songs.length) {
		//page.outputPagebar(songs.pageCount, songs.currentPage, songs.pageParam);
%>
<table class="list">
	<thead>
		<tr>
			<th scope="col">序号</th>
			<th scope="col">名称</th>
			<th scope="col"><%write(isListen? "收听" : "查看")%></th>
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
<%
		for (var i = 48, j = 0; i < 91, j < songs.length; i++) {
			if (i == 57) i = 65; // Skip :;<=>?@
			var firstLetter = songs[j].name.slice(0, 1).toUpperCase();
			if (firstLetter.charCodeAt(0) == i) {
%>
	<tbody>
		<tr>
			<th scope="col" colspan="<%=user.isAdmin? "5" : "3"%>"><a accesskey="<%=firstLetter%>"><%=firstLetter%></a></th>
		</tr>
<%
			for (; j < songs.length && songs[j].name.slice(0, 1).toUpperCase() == firstLetter; j++) {
%>
		<tr>
			<td><%=j + 1%></td>
<%
					if (isListen) {
						if (songs[j].listen) {
%>
			<th scope="row"><a href="song.asp?listen&amp;id=<%=songs[j].id%>"><%=songs[j].name%></a></th>
<%
						} else {
%>
			<th scope="row"><%=songs[j].name%></th>
<%
						}
					} else {
%>
			<td><a href="song.asp?id=<%=songs[j].id%>"><%=songs[j].name%></a></td>
<%
					}
%>
			<td><%=isListen? songs[j].listenCount : songs[j].viewCount%></td>
<%
					if (user.isAdmin) {
%>
			<td><a href="song.asp?edit&amp;id=<%=songs[j].id%>">修改</a></td>
			<td><a href="song.asp?delete=do&amp;id=<%=songs[j].id%>">删除</a></td>
<%
					}
%>
		</tr>
<%
				}
%>
	</tbody>
<%
			} else continue;
		}
%>
</table>
<%
		if (isListen) {
%>
<script type="text/javascript">
	var list = document.getElementById("listen").getElementsByTagName("table")[0].getElementsByTagName("a");
	for (var i = 0; i < list.length; i++) {
		if (list[i].href.indexOf("song.asp?listen&id=") != -1) {
			list[i].onclick = function() {
				window.open(this.href, "listenwindow", "width=300, height=380");
				return false;
			}
		}
	}
</script>
<%
		}
	} else {
%>
<p class="msg">暂时没有歌曲！</p>
<%
	}
%>
</div>
<%
}
if (user.isAdmin) page.addPanel("管理", ["<a href=\"song.asp?add\">添加</a>"]);

page.output();
%>
