<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/default.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/common.css" rel="stylesheet" type="text/css" />
<link href="style/common.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title></title>
<!-- InstanceEndEditable --><!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<!-- InstanceParam name="id" type="text" value="" -->
</head>

<body id="page-">
<div id="Header">
	<a href="news.htm"><img src="images/welcome.jpg" alt="三和中广网站正式开通" id="welcome" /></a>
	<ul id="navbar">
		<li id="navbar-main"><a href="index.htm" title="首页">首页</a></li>
		<li id="navbar-about"><a href="about/" title="关于我们">关于我们</a></li>
		<li id="navbar-portfolio"><a href="portfolio/" title="作品">作品</a></li>
		<li id="navbar-download"><a href="download/" title="下载">下载</a></li>
		<li id="navbar-cilent"><a href="cilent/" title="客户">客户</a></li>
		<li id="navbar-service"><a href="service/" title="服务">服务</a></li>
		<li id="navbar-contact"><a href="contact/" title="联系">联系</a></li>
	</ul>
	
	<!-- InstanceBeginEditable name="nav2" -->
	<!-- InstanceEndEditable --></div>
<div id="ContentWrapper">
<div id="Sidebar">
<!-- InstanceBeginEditable name="Sidebar" -->

<!-- InstanceEndEditable -->
</div>
<div id="Content">
<!-- InstanceBeginEditable name="Content" -->
<%
if (search.submit != null) {
	conn.update("Settings", {"password": input.password});
	Response.Redirect("admin.asp");
} else {
%>
<form action="?submit" method="post">
	<label>请输入新密码：
	<input type="password" name="password" />
	</label>
	<input type="submit" value="提交" />
</form>
<%
}
%>
<!-- InstanceEndEditable -->
</div>
<div class="clear"></div>
</div>
<div id="Footer">
	<p><a href="admin.asp">&copy;</a> Copyright 2005 - 2006 . plus3 design . All Right Reserved. <a href="http://www.miibeian.gov.cn">津ICP备06008731号</a></p>
</div>
</body>
<!-- InstanceEnd --></html>
