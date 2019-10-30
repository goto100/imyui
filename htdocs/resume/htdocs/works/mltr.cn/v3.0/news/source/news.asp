<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/news.asp" -->
<%
News.conn = appNews.conn;

if (user.isAdmin && search.add == "do" && input) {
	if (News.add(input)) page.id = "addSuccess";
	else {
		var categories = appNews.getCategories();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = appNews.getCategories();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var news = News.getNews(parseInt(input.id));
	if (news.edit(input) == true) page.id = "editSuccess";
	else {
		var categories = appNews.getCategories();
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var categories = appNews.getCategories();
	var news = News.getNews(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	News.del(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.comment != null && input) {
	if (News.addComment(input)) page.id = "commentSuccess";
	else {
		var news = News.getNews(parseInt(input.newsId));
		page.id = "commentError";
	}

} else if (search.id) {
	var news = News.getNews(parseInt(search.id));
	news.viewCountUp();
	page.id = "show";
}
%>