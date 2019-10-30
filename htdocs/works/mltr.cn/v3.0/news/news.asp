<!-- #include file = "source/news.asp" -->
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
	if (!addMode) news.cateId = news.category.id;
	form.value = news;
	form.source = News.form;

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
		break;

	case "editSuccess":
		page.outputMsg("修改成功");
		break;

	case "deleteSuccess":
		page.outputMsg("删除成功");
		break;

	case "show":
	case "commentError":
		if (news.url) page.redirect(news.url); else {
			setPageCategory(news.category.id);
			page.setTitle(news.title);
			page.setHeadline("<a href=\"index.asp?cid=" + news.category.id + "\">" + news.category.name + "</a>");
			page.content = function() {
			
%>
<div id="news" class="text">
	<div class="intro">
		<%=news.summary.replace(/\r\n/ig, "<br />")%>
	</div>
<%=news.content.replace(/\r\n/ig, "<br />")%>
</div>
<div id="comments">
	<h2>评论</h2>
<%
				if (news.comments) {
					for (var i = 0; i < news.comments.length; i++) {
%>
	<div class="comment">
		<p class="userInfo">
<%
						if (news.comments[i].user.id) {
%>
			<a href="<%=page.rootStr%>bbs/dispuser.asp?id=<%=news.comments[i].user.id%>"><strong><%=news.comments[i].user.name%></strong></a>
<%
						} else {
%>
			*&nbsp;<strong><%=news.comments[i].user.name%></strong>
<%
						}
%>
			 <%=news.comments[i].date.format()%>
			 <a href="comment.asp?delete=do&amp;id=<%=news.comments[i].id%>">删除</a>
		 </p>
		<div class="content"><%=news.comments[i].content%></div>
	</div>
<%
					}
				} else {
%>
	<p class="msg">暂无评论，欢迎发表！</p>
<%
				}
%>
</div>
<div id="commentPost">
	<h2>发表评论</h2>
<%
				var form = new HTMLPage.Form();
				form.action = "news.asp?comment";
				form.source = Comment.form;

				var newsId = form.addItem("hidden", "newsId");
				newsId.value = news.id;
				if (user.loggedIn) {
					function formUser() {
%>
	<label>昵称：</label><%=user.name%>
<%
					}
					form.addOutput(formUser);
				} else {
					form.addItem("text", "userName", "昵称");
				}
				form.addItem("textarea", "content", "内容", 4);
				form.output();
%>
</div>
<%
			}
		}
		page.addPanel("跳转", ["<a href=\"#comments\">评论</a>", "<a href=\"#commentPost\">发表评论</a>"]);
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"news.asp?edit&id=" + news.id + "\">修改</a>"]);
		break;

	case "commentSuccess":
		page.outputMsg("评论已发出．");
		break;

	default:
		page.redirect("index.asp");
}

page.output();
%>