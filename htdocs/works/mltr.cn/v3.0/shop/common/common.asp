<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appshop.asp" -->
<%
var appShop = new AppShop();
appShop.dbPath = Server.MapPath("/../database/v3_shop.mdb");
appShop.load();

page.category.id = "shop";
page.category.name = "����";
page.category.addCategory("byproduct", "�ܱ߲�Ʒ", "index.asp?cid=1");
page.category.addCategory("publish", "�������", "index.asp?cid=2");
page.category.addCategory("ticket", "Ʊ�����", "index.asp?cid=3");

function setPageCategory(id) {
	if (id == 1) page.category.inId = "byproduct";
	else if (id == 2) page.category.inId = "publish";
	else if (id == 3) page.category.inId = "ticket";
}
%>