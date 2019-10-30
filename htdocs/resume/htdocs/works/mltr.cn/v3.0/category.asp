<!-- #include file = "source/category.asp" -->
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
	form.value = category;
	form.source = Category.form;

	if (!addMode) form.addItem("hidden", "id");
	form.addItem("text", "name", "名称");
	form.addItem("text", "url", "地址");
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
		page.category.id = "category";
		page.category.name = "更新列表";
		page.headline = "更新列表";
		page.content = function() {
%>
<table class="list">
	<thead>
		<tr>
			<th scope="col">序</th>
			<th scope="col">名称</th>
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
		for (var i = 0; i < categories.length; i++) {
%>
		<tr<%if (i%2) {%> class="t2"<%}%>>
			<td><%=i + 1%></td>
			<td><a href="<%=categories[i].url%>"><%=categories[i].name%></a></td>
<%
			if (user.isAdmin) {
%>
			<td><a href="category.asp?edit&amp;id=<%=categories[i].id%>">修改</a></td>
			<td><a href="category.asp?delete=do&amp;id=<%=categories[i].id%>">删除</a></td>
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