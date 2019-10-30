<!-- #include file = "source/goods.asp" -->
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
	if (!addMode) goods.cateId = goods.category.id;
	form.value = goods;
	form.source = Goods.form;

	if (!addMode) form.addItem("hidden", "id");
	form.addItem("text", "title", "标题");
	var cateId = form.addItem("select", "cateId", "分类");
	cateId.setValues(categories, "id", "name");
	form.addItem("text", "url", "跳转");
	form.addItem("text", "from", "来自");
	form.addItem("text", "link", "链接");
	form.addItem("textarea", "summary", "摘要", 5);
	form.addItem("textarea", "content", "内容", 12);
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

	case "show":
		if (news.url) page.redirect(news.url); else {
			setPageCategory(news.category.id);
			page.setTitle(news.title);
			page.setHeadline("<a href=\"index.asp?cid=" + news.category.id + "\">" + news.category.name + "</a>");
			page.content = function() {
			
%>
<div id="goods" class="text">
	<div class="intro">
		<%=UbbCode(news.summary, 1, 1, 1, 1, 1)%>
	</div>
<%=UbbCode(news.content, 1, 1, 1, 1, 1)%>
</div>
<%
			}
		}
		page.addPanel("跳转", ["<a href=\"#comments\">评论</a>", "<a href=\"#commentPost\">发表评论</a>"]);
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"news.asp?edit&id=" + news.id + "\">修改</a>"]);
		break;

	case "list":
	default:
		setPageCategory(aGoodsList.category.id);
		page.setTitle("列表");
		if (page.category.inId) {
			page.setHeadline("<a href=\"index.asp?cid=" + aGoodsList.category.id + "\">" + aGoodsList.category.name + "</a>");
		}
		page.content = function() {
%>
<div id="goodsList">
	
</div>
<%
		}
}

page.output();
%>