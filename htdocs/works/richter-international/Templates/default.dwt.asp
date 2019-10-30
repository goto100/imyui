<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<!-- TemplateBeginEditable name="doctitle" -->
<title></title>
<!-- TemplateEndEditable -->
<!-- TemplateBeginEditable name="head" -->
<!-- TemplateEndEditable -->
<!-- TemplateParam name="language" type="text" value="en" -->
<!-- TemplateParam name="id" type="text" value="" -->
<!-- TemplateParam name="id2" type="text" value="" -->
<link href="../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body id="page-@@(id)@@" class="@@(language)@@">
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
		<!-- TemplateBeginIf cond="language=='en'" -->
		<li id="nav-home"><a href="../en/default.asp">Homepage</a></li>
		<li id="nav-news"><a href="../en/news/">News</a></li>
		<li id="nav-products"><a href="../en/products/">Products</a></li>
		<li id="nav-contact"><a href="../en/contact/">Contact</a></li>
		<li id="nav-aboutus"><a href="../en/aboutus/">About Us</a></li>
		<li id="nav-sitemap"><a href="../en/sitemap/">SiteMap</a></li>
		<li id="nav-thanksto"><a href="../en/thanksto/">Thanks To</a></li>
		<li id="nav-xxx"><a href="#">Under Construction</a></li>		
		<!-- TemplateEndIf -->
		<!-- TemplateBeginIf cond="language=='de'" -->
		<li id="nav-home"><a href="../de/default.asp">Startseite</a></li>
		<li id="nav-news"><a href="../de/news/">Aktuell</a></li>
		<li id="nav-products"><a href="../de/products/">Produkte</a></li>
		<li id="nav-contact"><a href="../de/contact/">Kontakt</a></li>
		<li id="nav-aboutus"><a href="../de/aboutus/">Ueber Uns</a></li>
		<li id="nav-sitemap"><a href="../de/sitemap/">Sitemap</a></li>
		<li id="nav-thanksto"><a href="../de/thanksto/">Thanks To</a></li>
		<li id="nav-xxx"><a href="#">Impressum</a></li>		
		<!-- TemplateEndIf -->
	</ul>
	<div id="subNav">
		<!-- TemplateBeginIf cond="language=='en'" -->
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
		<!-- TemplateEndIf -->
		<!-- TemplateBeginIf cond="language=='de'" -->
		<ul id="subNav-home">
			<li><a href="../"></a></li>
		</ul>
		<ul id="subNav-news">
<!--			<li><a href="../de/news/catalog.asp">Katalog (tbc)</a></li>
-->			<li><a href="../de/news/career.asp">Stellenangebote</a></li>
<!--			<li><a href="../de/news/pressreleases.asp">Pressemitteilungen (tbc)</a></li>
-->			<li><a href="../de/news/news.asp?cateId=2">Aktuell</a></li>
		</ul>
		<ul id="subNav-products">
			<li><a href="../de/products/promotionalarticles.asp">Promotionsartikel</a></li>
			<li><a href="../de/products/bambooflooring/default.asp">Bambus Parkett</a></li>
			<li><a href="../de/products/lighting.asp">Leuchten</a></li>
			<li><a href="../de/products/rawmaterials.asp">Rohmaterialien</a></li>
		</ul>
		<ul id="subNav-contact">
			<li><a href="../de/contact/locations.asp">Anschrift</a></li>
			<li><a href="../de/contact/sales.asp">Vertrieb</a></li>
		</ul>
		<ul id="subNav-aboutus">
			<li><a href="../de/aboutus/management.asp">Organisation</a></li>
			<li><a href="../de/aboutus/sales.asp">Vertrieb</a></li>
			<li><a href="../de/aboutus/services.asp">AGB</a></li>
		</ul>
		<!-- TemplateEndIf -->
	</div>
</div>
<h1><!-- TemplateBeginEditable name="title" --><!-- TemplateEndEditable --></h1>
<div id="ContentWrapper">
<div id="Content">
	<!-- TemplateBeginEditable name="content" -->	<!-- TemplateEndEditable --></div>
<div id="Sidebar">
	<!-- TemplateBeginIf cond="language=='en' && id=='news'" -->
	<div id="quickBar">
		<ul id="quickBar-news">
<!--			<li><a href="../en/news/catalog.asp">Catalog (tbc)</a></li>
-->			<li><a href="../en/news/career.asp">Career opportunities</a></li>
<!--			<li><a href="../en/news/pressreleases.asp">Press released (tbc)</a></li>
-->			<li><a href="../en/news/news.asp?cateId=1">News</a></li>
		</ul>
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='de' && id=='news'" -->
	<div id="quickBar">
		<ul id="quickBar-news">
<!--			<li><a href="../de/news/catalog.asp">Katalog (tbc)</a></li>
-->			<li><a href="../de/news/career.asp">Stellenangebote</a></li>
<!--			<li><a href="../de/news/pressreleases.asp">Pressemitteilungen (tbc)</a></li>
-->			<li><a href="../de/news/news.asp?cateId=2">Aktuell</a></li>
		</ul>
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='en' && id=='products' && !id2" -->
	<div id="quickBar">
		<ul id="quickBar-products">
			<li><a href="../en/products/promotionalarticles.asp">Promotional Articles</a></li>
			<li><a href="../en/products/bambooflooring/default.asp">Bamboo Flooring</a></li>
			<li><a href="../en/products/lighting.asp">Lighting</a></li>
			<li><a href="../en/products/rawmaterials.asp">Raw Materials</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='en' && id=='products' && id2=='bamboo'" -->
	<div id="quickBar">
		<ul id="quickBar-products">
			<li><a href="../en/products/bambooflooring/aboutbamboo.asp">About Bamboo</a></li>
			<li><a href="../en/products/bambooflooring/bamboocharacteristics.asp"> Bamboo Characteristics</a></li>
			<li><a href="../en/products/bambooflooring/environementallyfriendlyproducts.asp">Environmentally Friendly Products</a></li>
			<li><a href="../en/products/bambooflooring/productsintroduction.asp">Product Introduction</a></li>
			<li><a href="../en/products/bambooflooring/maintenance.asp">Maintenance</a></li>
			<li><a href="../en/products/bambooflooring/installation.asp">Installation</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='de' && id=='products' && !id2" -->
	<div id="quickBar">
		<ul id="quickBar-products">
			<li><a href="../de/products/promotionalarticles.asp">Promotionsartikel</a></li>
			<li><a href="../de/products/bambooflooring/default.asp">Bambus Parkett</a></li>
			<li><a href="../de/products/lighting.asp">Leuchten</a></li>
			<li><a href="../de/products/rawmaterials.asp">Rohmaterialien</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='de' && id=='products' && id2=='bamboo'" -->
	<div id="quickBar">
		<ul id="quickBar-products">
		<li><a href="../de/products/bambooflooring/aboutbamboo.asp">About Bamboo</a></li>
		<li><a href="../de/products/bambooflooring/bamboocharacteristics.asp"> Bamboo Characteristics</a></li>
		<li><a href="../de/products/bambooflooring/environementallyfriendlyproducts.asp">Environmentally Friendly Products</a></li>
		<li><a href="../de/products/bambooflooring/productsintroduction.asp">Product Introduction</a></li>
		<li><a href="../de/products/bambooflooring/maintenance.asp">Maintenance</a></li>
		<li><a href="../de/products/bambooflooring/installation.asp">Installation</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='en' && id=='contact'" -->
	<div id="quickBar">
		<ul id="quickBar-contact">
			<li><a href="../en/contact/locations.asp">Locations</a></li>
			<li><a href="../en/contact/sales.asp">Sales Contacts</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='de' && id=='contact'" -->
	<div id="quickBar">
		<ul id="quickBar-contact">
			<li><a href="../de/contact/locations.asp">Anschrift</a></li>
			<li><a href="../de/contact/sales.asp">Vertrieb</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='en' && id=='aboutus'" -->
	<div id="quickBar">
		<ul id="quickBar-aboutus">
			<li><a href="../en/aboutus/management.asp">Management</a></li>
			<li><a href="../en/aboutus/sales.asp">Sales Contacts</a></li>
			<li><a href="../en/aboutus/services.asp">Services</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
	<!-- TemplateBeginIf cond="language=='de' && id=='aboutus'" -->
	<div id="quickBar">
		<ul id="quickBar-aboutus">
			<li><a href="../de/aboutus/management.asp">Organisation</a></li>
			<li><a href="../de/aboutus/sales.asp">Vertrieb</a></li>
			<li><a href="../de/aboutus/services.asp">AGB</a></li>
		</ul>	
	</div>
	<!-- TemplateEndIf -->
</div>
</div>

<div id="Footer">
	<p>&copy; copyright Richter-International Business &amp; Trading Co.,Ltd. 2003-2006</p>
</div>
</div>
</div>
</div>
</body>
</html>
