<!-- #include file = "source/index.asp" -->
<%
page.category.inId = images.category;
page.setTitle("列表");
page.setHeadline("<a href=\"index.asp?" + images.category + "\">" + page.category.subCategory[page.category.inId].name + "</a>")
page.content = function() {
%>
<div id="<%=images.category%>">
<%
	page.outputPagebar(images.pageCount, images.currentPage, images.pageParam);
	for (var i = 0; i < images.length; i++) {
%>
	<a href="images/<%=images.category%>/<%=images[i].name%>"><img src="images/<%=images.category%>/<%=images[i].name%>" alt="<%=images[i].name%>" width="150" /></a>
<%
	}
%>
</div>
<%
}
page.output();
%>
