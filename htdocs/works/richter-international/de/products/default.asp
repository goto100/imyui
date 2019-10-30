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
<!-- InstanceBeginEditable name="head" -->
<!-- InstanceEndEditable -->
<!-- InstanceParam name="language" type="text" value="de" -->
<!-- InstanceParam name="id" type="text" value="products" -->
<!-- InstanceParam name="id2" type="text" value="" -->
<link href="../../style/style.css" rel="stylesheet" type="text/css" />
</head>

<body id="page-products" class="de">
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
		
		
		<li id="nav-home"><a href="../default.asp">Startseite</a></li>
		<li id="nav-news"><a href="../news/">Aktuell</a></li>
		<li id="nav-products"><a href="../products/">Produkte</a></li>
		<li id="nav-contact"><a href="../contact/">Kontakt</a></li>
		<li id="nav-aboutus"><a href="../aboutus/">Ueber Uns</a></li>
		<li id="nav-sitemap"><a href="../sitemap/">Sitemap</a></li>
		<li id="nav-thanksto"><a href="../thanksto/">Thanks To</a></li>
		<li id="nav-xxx"><a href="#">Impressum</a></li>		
		
	</ul>
	<div id="subNav">
		
		
		<ul id="subNav-home">
			<li><a href="../../"></a></li>
		</ul>
		<ul id="subNav-news">
<!--			<li><a href="../de/news/catalog.asp">Katalog (tbc)</a></li>
-->			<li><a href="../news/career.asp">Stellenangebote</a></li>
<!--			<li><a href="../de/news/pressreleases.asp">Pressemitteilungen (tbc)</a></li>
-->			<li><a href="../news/news.asp?cateId=2">Aktuell</a></li>
		</ul>
		<ul id="subNav-products">
			<li><a href="promotionalarticles.asp">Promotionsartikel</a></li>
			<li><a href="bambooflooring/default.asp">Bambus Parkett</a></li>
			<li><a href="lighting.asp">Leuchten</a></li>
			<li><a href="rawmaterials.asp">Rohmaterialien</a></li>
		</ul>
		<ul id="subNav-contact">
			<li><a href="../contact/locations.asp">Anschrift</a></li>
			<li><a href="../contact/sales.asp">Vertrieb</a></li>
		</ul>
		<ul id="subNav-aboutus">
			<li><a href="../aboutus/management.asp">Organisation</a></li>
			<li><a href="../aboutus/sales.asp">Vertrieb</a></li>
			<li><a href="../aboutus/services.asp">AGB</a></li>
		</ul>
		
	</div>
</div>
<h1><!-- InstanceBeginEditable name="title" -->Produkte<!-- InstanceEndEditable --></h1>
<div id="ContentWrapper">
<div id="Content">
	<!-- InstanceBeginEditable name="content" -->
	<ul>
		<li><a href="promotionalarticles.asp">Promotionsartikel</a></li>
		<li><a href="bambooflooring">Bambus Parkett</a></li>
		<li><a href="lighting.asp">Leuchten</a></li>
		<li><a href="rawmaterials.asp">Rohmaterialien</a></li>
	</ul>
<!-- InstanceEndEditable --></div>
<div id="Sidebar">
	
	
	
	
	
	<div id="quickBar">
		<ul id="quickBar-products">
			<li><a href="promotionalarticles.asp">Promotionsartikel</a></li>
			<li><a href="bambooflooring/default.asp">Bambus Parkett</a></li>
			<li><a href="lighting.asp">Leuchten</a></li>
			<li><a href="rawmaterials.asp">Rohmaterialien</a></li>
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
