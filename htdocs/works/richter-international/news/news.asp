<!-- #include file = "sources/news.asp" -->
<%
switch (page.id) {
	case "add":
	case "addError":
		var addMode = true;
	case "edit":
	case "editError":
		page.title = addMode? "Add News" : "Edit News";
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
	form.addItem("text", "title", "Title");
	var cateId = form.addItem("select", "cateId", "Category");
	cateId.setValues(categories, "id", "name");
	form.addItem("text", "url", "Transform");
	form.addItem("text", "from", "From");
	form.addItem("text", "link", "Link");
	form.addItem("textarea", "summary", "Summary", 5);
	form.addItem("textarea", "content", "Content", 12);
	form.output();
%>
</div>
<%
		}
		break;

	case "addSuccess":
		page.title = "Add Done";
		break;

	case "editSuccess":
		page.title = "Edit Done";
		break;

	case "deleteSuccess":
		page.title = "Delete Done";
		break;

	case "show":
		if (news.url) Response.Redirect(news.url); else {
			page.title = news.title;
			page.content = function() {
%>
<div id="news" class="text">
	<div class="intro">
		<%=news.summary.replace(/\r\n/ig, "<br />")%>
	</div>
<%=news.content.replace(/\r\n/ig, "<br />")%>
</div>
<%
			}
		}
		break;
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/default.dwt.asp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function checkSubNav(ele) {
	var eleSubNavs = document.getElementById("subNav").getElementsByTagName("ul");
	for (var i = 0; i < eleSubNavs.length; i++) {
		if (eleSubNavs[i].id == "subNav-" + ele.id.substr(4)) eleSubNavs[i].style.display = "block";
		else eleSubNavs[i].style.display = "none";
	}
}
window.onload = function() {
	var eleNavs = document.getElementById("nav").getElementsByTagName("li");
	for (var i = 0; i < eleNavs.length; i++) {
		eleNavs[i].onmouseover = function() { checkSubNav(this); };
		if (document.getElementsByTagName("body")[0].id.substr(5) == eleNavs[i].id.substr(4)) checkSubNav(eleNavs[i]);
	}
	// Block all archers
	// var archers = document.getElementsByTagName("a");
	// for (var i  = 0; i < archers.length; i++) archers[i].href = "#";
}
</script>
<!-- InstanceBeginEditable name="doctitle" -->
<title></title>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<!-- InstanceParam name="language" type="text" value="en" -->
<!-- InstanceParam name="id" type="text" value="news" -->
<!-- InstanceParam name="id2" type="text" value="" -->
<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body id="page-news" class="en">
<div id="Wrapper">
<div id="InnerWrapper">
<div id="InnerWrapper2">
<div id="Header">
	<div id="languageBar">
		<dl>
			<dt><img src="../images/languageBar-title.png" alt="Select Your Language" width="109" height="26" /></dt>
			<dd id="languageBar-en"><a href="../en/">English</a></dd>
			<dd id="languageBar-de"><a href="../de/">Deutsch</a></dd>
			<dd id="languageBar-zh"><a href="javascript:alert('抱歉，中文版尚未推出。')">中文</a></dd>
		</dl>
	</div>
	<img src="../images/logo.png" alt="Richter International" name="logo" width="188" height="72" id="logo" />
	<ul id="nav">
		
		<li id="nav-home"><a href="../en/default.asp">Homepage</a></li>
		<li id="nav-news"><a href="../en/news/">News</a></li>
		<li id="nav-products"><a href="../en/products/">Products</a></li>
		<li id="nav-contact"><a href="../en/contact/">Contact</a></li>
		<li id="nav-aboutus"><a href="../en/aboutus/">About Us</a></li>
		<li id="nav-sitemap"><a href="../en/sitemap/">SiteMap</a></li>
		<li id="nav-thanksto"><a href="../en/thanksto/">Thanks To</a></li>
		<li id="nav-xxx"><a href="#">Under Construction</a></li>		
		
		
	</ul>
	<div id="subNav">
		
		<ul id="subNav-home">
			<li><a href="../">Welcome To Richter-International.com</a></li>
		</ul>
		<ul id="subNav-news">
<!--			<li><a href="../en/news/catalog.asp">Catalog (tbc)</a></li>
-->			<li><a href="../en/news/career.asp">Career opportunities</a></li>
<!--			<li><a href="../en/news/pressreleases.asp">Press released (tbc)</a></li>
-->			<li><a href="../en/news/news.asp?cateId=1">News</a></li>
		</ul>
		<ul id="subNav-products">
			<li><a href="../en/products/promotionalarticles.asp">Promotional Articles</a></li>
			<li><a href="../en/products/bambooflooring/default.asp">Bamboo Flooring</a></li>
			<li><a href="../en/products/lighting.asp">Lighting</a></li>
			<li><a href="../en/products/rawmaterials.asp">Raw Materials</a></li>
		</ul>
		<ul id="subNav-contact">
			<li><a href="../en/contact/locations.asp">Locations</a></li>
			<li><a href="../en/contact/sales.asp">Sales Contacts</a></li>
		</ul>
		<ul id="subNav-aboutus">
			<li><a href="../en/aboutus/management.asp">Management</a></li>
			<li><a href="../en/aboutus/sales.asp">Sales Contacts</a></li>
			<li><a href="../en/aboutus/services.asp">Services</a></li>
		</ul>
		
		
	</div>
</div>
<h1><!-- InstanceBeginEditable name="title" --><%=page.title%><!-- InstanceEndEditable --></h1>
<div id="ContentWrapper">
<div id="Content">
	<!-- InstanceBeginEditable name="content" -->
	<%page.content()%>
	<!-- InstanceEndEditable --></div>
<div id="Sidebar">
	
	<div id="quickBar">
		<ul id="quickBar-news">
<!--			<li><a href="../en/news/catalog.asp">Catalog (tbc)</a></li>
-->			<li><a href="../en/news/career.asp">Career opportunities</a></li>
<!--			<li><a href="../en/news/pressreleases.asp">Press released (tbc)</a></li>
-->			<li><a href="../en/news/news.asp?cateId=1">News</a></li>
		</ul>
	</div>
	
	
	
	
	
	
	
	
	
	
</div>
</div>

<div id="Footer">
	<p>&copy; copyright Richter-International Business &amp; Trading Co.,Ltd. 2003-2006</p>
</div>
</div>
</div>
</div>
</body>
<!-- InstanceEnd --></html>
