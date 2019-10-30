<!-- #include file = "../common.asp" -->
<%
var pageSize = 15;
if (search) {
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	var e = search.getExpandoNames();
	var p = search.p? parseInt(search.p) : 1;
	var images = [];
	images.category = e[0];
	images.pageSize = pageSize;
	images.currentPage = p;
	images.pageParam = images.category;
	var e = new Enumerator(fso.getFolder(page.transformPath("photo/images/" + e[0] + "/", true)).files);
	var end = p * pageSize;
	var start = end - pageSize;
	var flag = 0;
	for (flag = 0; !e.atEnd(); e.moveNext(), flag++) {
		if (flag >= start && flag < end) images.push(e.item());
	}
	images.pageCount = getPageCount(flag, pageSize);
}
%>