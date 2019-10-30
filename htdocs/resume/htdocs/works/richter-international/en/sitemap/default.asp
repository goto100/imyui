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
<!-- InstanceParam name="id" type="text" value="sitemap" -->
<!-- InstanceParam name="id2" type="text" value="" -->
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body id="page-sitemap" class="en">
<div id="Wrapper">
<div id="InnerWrapper">
<div id="InnerWrapper2">
<div id="Header">
	<div id="languageBar">
		<dl>
			<dt><img src="../../images/languageBar-title.png" alt="Select Your Language" width="109" height="26" /></dt>
			<dd id="languageBar-en"><a href="../../en/">English</a></dd>
			<dd id="languageBar-de"><a href="../../de/">Deutsch</a></dd>
			<dd id="languageBar-zh"><a href="javascript:alert('抱歉，中文版尚未推出。')">中文</a></dd>
		</dl>
	</div>
	<img src="../../images/logo.png" alt="Richter International" name="logo" width="188" height="72" id="logo" />
	<ul id="nav">
		
		<li id="nav-home"><a href="../default.asp">Homepage</a></li>
		<li id="nav-news"><a href="../news/">News</a></li>
		<li id="nav-products"><a href="../products/">Products</a></li>
		<li id="nav-contact"><a href="../contact/">Contact</a></li>
		<li id="nav-aboutus"><a href="../aboutus/">About Us</a></li>
		<li id="nav-sitemap"><a href="../sitemap/">SiteMap</a></li>
		<li id="nav-thanksto"><a href="../thanksto/">Thanks To</a></li>
		<li id="nav-xxx"><a href="#">Under Construction</a></li>		
		
		
	</ul>
	<div id="subNav">
		
		<ul id="subNav-home">
			<li><a href="../../">Welcome To Richter-International.com</a></li>
		</ul>
		<ul id="subNav-news">
<!--			<li><a href="../en/news/catalog.asp">Catalog (tbc)</a></li>
-->			<li><a href="../news/career.asp">Career opportunities</a></li>
<!--			<li><a href="../en/news/pressreleases.asp">Press released (tbc)</a></li>
-->			<li><a href="../news/news.asp?cateId=1">News</a></li>
		</ul>
		<ul id="subNav-products">
			<li><a href="../products/promotionalarticles.asp">Promotional Articles</a></li>
			<li><a href="../products/bambooflooring/default.asp">Bamboo Flooring</a></li>
			<li><a href="../products/lighting.asp">Lighting</a></li>
			<li><a href="../products/rawmaterials.asp">Raw Materials</a></li>
		</ul>
		<ul id="subNav-contact">
			<li><a href="../contact/locations.asp">Locations</a></li>
			<li><a href="../contact/sales.asp">Sales Contacts</a></li>
		</ul>
		<ul id="subNav-aboutus">
			<li><a href="../aboutus/management.asp">Management</a></li>
			<li><a href="../aboutus/sales.asp">Sales Contacts</a></li>
			<li><a href="../aboutus/services.asp">Services</a></li>
		</ul>
		
		
	</div>
</div>
<h1><!-- InstanceBeginEditable name="title" --><!-- InstanceEndEditable --></h1>
<div id="ContentWrapper">
<div id="Content">
	<!-- InstanceBeginEditable name="content" -->	<!-- InstanceEndEditable --></div>
<div id="Sidebar">
	
	
	
	
	
	
	
	
	
	
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
