<!-- #include file = "source/album.asp" -->
<%
switch (page.id) {
	case "show":
		setPageCategory(album.category.id);
		page.setTitle(album.name);
		page.setHeadline("<a href=\"index.asp?cid=" + album.category.id + "\">" + album.category.name + "</a>");
		page.content = function() {
%>
<div id="info">
	<div class="show">
		<img src="images/<%=album.name%>.jpg" alt="<%=album.name%>" class="show" />
		<ul>
			<li>专辑名称：<%=album.name%></li>
			<li>中文译名：<%=album.transName%></li>
			<li>发行日期：<%=album.date%></li>
			<li>发行地区：<%=album.place%></li>
			<li>全球销量：<%=album.sales%></li>
		</ul>
	</div>

</div>

<div id="songs">
<%
			if (album.songs) {
%>
		<table class="list">
			<thead>
				<tr>
					<th scope="col">序</th>
					<th scope="col">歌曲名称</th>
					<th scope="col">在线试听</th>
				</tr>
			</thead>
			<tbody>
<%
				for (var i = 0; i < album.songs.length; i++) {
%>
				<tr>
					<td><%=i + 1%></td>
					<th scope="row"><%if(album.songs[i].lyric) {%><a href="../music/song.asp?id=<%=album.songs[i].id%>"><%=album.songs[i].name%></a><%} else {%><%=album.songs[i].name%><%}%></th>
					<td><%if(album.songs[i].listen) {%><a href="../music/song.asp?listen&amp;id=<%=album.songs[i].id%>"><img src="../images/go.gif" alt="在线试听" /></a><%} else {%>&nbsp;<%}%></td>
				</tr>
<%
				}
%>
			</tbody>
		</table>
<script type="text/javascript">
	var list = document.getElementById("songs").getElementsByTagName("table")[0].getElementsByTagName("a");
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
%>
</div>
<%
		}
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"album.asp?edit&id=" + album.id + "\">编辑</a>", "<a href=\"album.asp?add\">添加</a>"]);
		break;

	case "add":
	case "addError":
		var addMode = true;
	case "edit":
	case "editError":
		page.setTitle(addMode? "添加" : "编辑");
		page.content = function() {
%>
<div id="form">
<%
			var form = new HTMLPage.Form();
			form.action = addMode? "?add=do" : "?edit=do";
			if (!addMode) album.cateId = album.category.id;
			form.value = album;
			form.source = Album.form;

			function formSongs() {
%>
	<label>歌曲：</label>
	<select multiple="multiple" id="source" size="30">
<%
		for (var i = 0; i < songs.length; i++) {
%>
		<option value="<%=songs[i].id%>"><%=songs[i].name%></option>
<%
		}
%>
	</select>
	<select multiple="multiple" id="object" name="songs">
<%
		if (page.id == "edit" && album.songs) for (var i = 0; i < album.songs.length; i++) {
%>
		<option value="<%=album.songs[i].id%>"><%=album.songs[i].name%></option>
<%
		}
%>
	</select>
	<input type="button" id="upButton" value="up" />
	<input type="button" id="downButton" value="down" />
<%
			}

			if (!addMode) form.addItem("hidden", "id");
			form.addItem("text", "name", "名称");
			form.addItem("text", "title", "标题");
			var cateId = form.addItem("select", "cateId", "分类");
			cateId.setValues(categories, "id", "name");
			form.addItem("text", "transName", "译名");
			form.addItem("text", "year", "发行年份");
			form.addItem("text", "date", "发行日期");
			form.addItem("text", "place", "发行地区");
			form.addItem("text", "sales", "全球销量");
			form.addItem("textarea", "info", "信息", 5);
			form.addItem("textarea", "intro", "介绍", 5);
			form.addItem("textarea", "content", "内容", 12);
			form.addOutput(formSongs);
			form.output();
%>
<script type="text/javascript">
	var form = document.getElementById("form").getElementsByTagName("form")[0];
	form.onsubmit = function() {
		for (var i = 0; i < object.length; i++) {
			object[i].selected = true;
		}
	}
	var source = document.getElementById("source");
	var object = document.getElementById("object");
	var upButton = document.getElementById("upButton");
	var downButton = document.getElementById("downButton");
	var selectAll = document.getElementById("selectAll");
	for (var i = 0; i < source.length; i++) {
		source[i].ondblclick = function() {
			goItem(this);
		}
	}
	for (var i = 0; i < object.length; i++) {
		object[i].ondblclick = function() {
			backItem(this);
		}
	}
	upButton.onclick = function() {
		up(object.selectedIndex);
	}
	downButton.onclick = function() {
		down(object.selectedIndex);
	}
	function goItem(item) {
		object.appendChild(item);
		item.ondblclick = function() {
			backItem(this);
		}
	}
	function backItem(item) {
		source.appendChild(item);
		item.ondblclick = function() {
			goItem(this);
		}
	}
	function up(i) {
		var temp = object[i - 1].cloneNode(true);
		object.replaceChild(object[i], object[i - 1]);
		object.insertBefore(temp, object[i]);
	}

	function down(i) {
		var temp = object[i + 1].cloneNode(true);
		object.replaceChild(object[i], object[i + 1]);
		object.insertBefore(temp, object[i]);
	}
</script>
</div>
<%
		}
		break;

	case "addSuccess":
		page.outputMsg("添加成功");

	case "editSuccess":
		page.outputMsg("修改成功");

	case "deleteSuccess":
		page.outputMsg("删除成功");
}

page.output();
%>
