<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
Response.Charset = "utf-8";
Session.CodePage = 65001;
function header(name, title) {
	function getState(name) {
		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
body {
	scrollbar-face-color:#a6eefd;
	scrollbar-highlight-color:#0080ff;
	scrollbar-shadow-color:#48c4ff;
	scrollbar-3dlight-color:#0eb6e7;
	scrollbar-darkshadow-color:#0eb6e7;
	scrollbar-arrow-color:#616465;
	scrollbar-track-color:#dfdfdf;
	cursor:url('images/cur.cur');
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" href="style/skin.css" rel="stylesheet" />
<title><%=title%> - 北京帕美智软件开发有限公司</title>
</head>

<body>
<div id="Wrapper"><div id="InnerWrapper"><div id="InnerWrapper2">
<div id="Header">
	<div id="Navbar">
		<ul>
			<li id="Navbar_news"><a href="news.asp" title="最新动态"<%if(name=="news"){%> class="active"<%}%>>最新动态</a></li>
			<li id="Navbar_aboutus"><a href="aboutus.asp" title="关于我们"<%if(name=="aboutus"){%> class="active"<%}%>>关于我们</a></li>
			<li id="Navbar_products"><a href="products.asp" title="产品简介"<%if(name=="products"){%> class="active"<%}%>>产品简介</a></li>
			<li id="Navbar_service"><a href="service.asp" title="技术服务"<%if(name=="service"){%> class="active"<%}%>>技术服务</a></li>
			<li id="Navbar_examples"><a href="examples.asp" title="应用实例"<%if(name=="examples"){%> class="active"<%}%>>应用实例</a></li>
			<li id="Navbar_indelibility"><a href="indelibility.asp" title="我们不会忘记"<%if(name=="indelibility"){%> class="active"<%}%>>我们不会忘记</a></li>
			<li id="Navbar_contactus"><a href="contactus.asp" title="联系我们"<%if(name=="contactus"){%> class="active"<%}%>>联系我们</a></li>
			<li id="Navbar_invite"><a href="invite.asp" title="诚聘英才"<%if(name=="invite"){%> class="active"<%}%>>诚聘英才</a></li>
			<li id="Navbar_email"><a href="mailto:liu@panimaging.com" title="Email us">发送邮件</a></li>
		</ul>
	</div>
</div>

<div id="Content">
	<h1><img src="images/<%=name%>-title.gif" /></h1>
<%}

function footer() {
%>
</div>

<div id="Footer">
	<p class="Copy">北京帕美智软件开发有限公司 版权所有<a href="admin.asp"><img src="/images/dot.gif"border="0"></a></p><p>
	<p>地址：北京市朝阳区东三环南路54号华腾园13号楼511室 邮编：100022<br />
	电话：010－87735727、87735771 传真：010－87735727<br />
	网址：www.panimaging.com E-mail: liu@panimaging.com
</div>

</div></div></div>
</body>
</html>
<%
}
%>
