<!-- #include file = "source/flash.asp" -->
<%
switch (page.id) {
	case "add":
	case "addError":
		var addMode = true;
	case "edit":
	case "editError":
		page.setTitle(addMode? "添加" : "编辑");
		page.content = function() {
%>
<div id="<%=addMode? "add" : "edit"%>">
<%
	var form = new HTMLPage.Form();
	form.action = addMode? "?add=do" : "?edit=do";
	form.value = flash;
	form.source = Flash.form;

	if (!addMode) form.addItem("hidden", "id");
	form.addItem("text", "name", "名称", true, "名称必填");
	form.addItem("text", "author", "作者");
	form.output();
%>
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
	case "show":
		page.category.inId = "flash";
		page.setTitle(flash.name);
		page.content = function() {
			
%>
<div id="flash" class="text">
	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="560" height="400">
		<param name="movie" value="images/flash/<%=flash.id%>.swf" />
		<param name="quality" value="high" />
		<embed src="images/flash/<%=flash.id%>.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="560" height="400"></embed>
	</object>
</div>
<%
		}
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"flash.asp?edit&amp;id=" + flash.id + "\">编辑</a>"]);
		break;

	case "list":
	default:
		page.category.inId = "flash";
		page.setTitle("列表");
		page.content = function() {
%>
<div id="<%=page.category.inId%>">
<%
		if (flashes) {
%>

<%
			for (var i = 0; i < flashes.length; i++) {
%>
	<div class="show">
		<h3><%=flashes[i].name%></h3>

		<a href="flash.asp?id=<%=flashes[i].id%>"><img src="images/flash/<%=flashes[i].id%>.jpg" alt="<%=flashes[i].name%>" class="show" /></a>
		<ul>
			<li>作者：<%=flashes[i].author%></li>
			<li>添加日期：<%=flashes[i].date.format()%></li>
		</ul>
		<a href="flash.asp?id=<%=flashes[i].id%>" class="more">查看</a>
	</div>
<%
			}
%>

<%
		} else {
%>
<p class="msg">暂时没有Flash！</p>
<%
		}
%>
</div>
<%
	}
	if (user.isAdmin) page.addPanel("管理", ["<a href=\"flash.asp?add\">添加</a>"]);
}

page.output();
%>