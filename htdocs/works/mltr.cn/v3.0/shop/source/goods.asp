<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/classes/goods.asp" -->
<%
Goods.conn = appShop.conn;

if (user.isAdmin && search.add == "do" && input) {
	if (Goods.add(input)) page.id = "addSuccess";
	else {
		var categories = appGoods.getCategories();
		page.id = "addError";
	}

} else if (user.isAdmin && search.add != null) {
	var categories = appGoods.getCategories();
	page.id = "add";
}

else if (user.isAdmin && search.edit == "do" && input) {
	var news = Goods.getGoods(parseInt(input.id));
	if (news.edit(input) == true) page.id = "editSuccess";
	else {
		var categories = appGoods.getCategories();
		page.id = "editError";
	}

} else if (user.isAdmin && search.edit != null && search.id) {
	var categories = appGoods.getCategories();
	var news = Goods.getGoods(parseInt(search.id));
	page.id = "edit";

} else if (user.isAdmin && search["delete"] == "do" && search.id) {
	Goods.deleteGoods(parseInt(search.id));
	page.id = "deleteSuccess";

} else if (search.comment != null && input) {
	if (Goods.addComment(input) == true) page.id = "commentSuccess";
	else {
		var news = Goods.getGoods(parseInt(input.newsId));
		page.id = "commentError";
	}

} else if (search.id) {
	var news = Goods.getGoods(parseInt(search.id));
	news.viewCountUp();
	page.id = "show";

} else {
	var cateId;
	var currentPage = search.p? parseInt(search.p) : 1;
	if (search.cid) {
		cateId = parseInt(search.cid);
		var pageParam = "cid=" + cateId;
	}
	var aGoodsList = appShop.getGoodsList(cateId, currentPage);
	aGoodsList.pageParam = pageParam;
	page.id = "list";
}
%>