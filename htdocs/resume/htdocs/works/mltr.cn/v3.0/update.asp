<!-- #include file = "source/update.asp" -->
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
	if (!addMode) update.cateId = update.category.id;
	form.value = update;
	form.source = Update.form;

	if (!addMode) form.addItem("hidden", "id");
	var cateId = form.addItem("select", "cateId", "分类");
	cateId.setValues(categories, "id", "name");
	form.addItem("text", "link", "链接");
	form.addItem("text", "picName", "图片名称");
	form.addItem("textarea", "info", "信息");
	form.output();
%>
</div>
<%
		}
		break;

	case "addSuccess":
		page.outputMsg("添加成功");
		break;

	case "editSuccess":
		page.outputMsg("修改成功");
		break;

	case "deleteSuccess":
		page.outputMsg("删除成功");
		break;

	default:
		page.category.id = "update";
		page.category.name = "更新列表";
		page.headline = "更新列表";
		page.content = function() {
%>
<table class="list">
	<thead>
		<tr>
			<th scope="col">序</th>
			<th scope="col">分类</th>
			<th scope="col">信息</th>
			<th scope="col">时间</th>
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
	<tbody>
<%
		for (var i = 0; i < updates.length; i++) {
%>
		<tr<%if (i%2) {%> class="t2"<%}%>>
			<td><%=i + 1%></td>
			<td><a href="<%=updates[i].cateURL%>"><%=updates[i].cateName%></a></td>
			<th scope="row"><%=updates[i].info%></th>
			<td><%=updates[i].date.format("YY-MM-DD")%></td>
<%
			if (user.isAdmin) {
%>
			<td><a href="update.asp?edit&amp;id=<%=updates[i].id%>">修改</a></td>
			<td><a href="update.asp?delete=do&amp;id=<%=updates[i].id%>">删除</a></td>
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
		}
}

page.output();
%>