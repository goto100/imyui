<!-- #include file = "../common/common.asp" -->
<%
page.category.id = "photo";
page.category.name = "图片";
page.category.addCategory("photo", "最新照片", "index.asp?photo");
page.category.addCategory("galleries", "综合写真", "index.asp?galleries");
page.category.addCategory("wallpaper", "电脑壁纸", "index.asp?wallpaper");
page.category.addCategory("reports", "报刊杂志", "index.asp?reports");
%>