<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appshop.asp" -->
<%
var appShop = new AppShop();
appShop.dbPath = Server.MapPath("/../database/v3_shop.mdb");
appShop.load();

page.category.id = "shop";
page.category.name = "购物";
page.category.addCategory("byproduct", "周边产品", "index.asp?cid=1");
page.category.addCategory("publish", "音像相关", "index.asp?cid=2");
page.category.addCategory("ticket", "票务代售", "index.asp?cid=3");

function setPageCategory(id) {
	if (id == 1) page.category.inId = "byproduct";
	else if (id == 2) page.category.inId = "publish";
	else if (id == 3) page.category.inId = "ticket";
}
%>