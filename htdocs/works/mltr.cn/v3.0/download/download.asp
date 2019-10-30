<!-- #include file = "source/download.asp" -->
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
	if (!addMode) download.cateId = download.category.id;
	form.value = download;
	form.source = Download.form;

	if (!addMode) form.addItem("hidden", "id");
	form.addItem("text", "title", "标题");
	var cateId = form.addItem("select", "cateId", "分类");
	cateId.setValues(categories, "id", "name");
	form.addItem("text", "path", "路径");
	form.addItem("textarea", "description", "描述", 5);
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
		page.redirect(download.path);
		break;
	case "notLogged":
		page.outputMsg("请先登录");
	default:
		page.redirect("index.asp");
}

page.output();
%>