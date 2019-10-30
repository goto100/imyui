<!--#include file="../conn.asp" -->
<%
if (Session("isAdmin") == true) {
	page.sidebar = function() {
%>
<a href="?add">添加</a>
<%
	}
}
switch(search[0]) {
	case "add":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		page.content = function() {
%>
<form action="?save" method="post">
	<table>
		<tr>
			<td>名称：</td>
			<td><input name="name" type="text" /></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "save":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		var record = conn.insert("Wallpapers", {name: input.name}, true);
		Response.Redirect("wallpaper.asp?upfile&id=" + record.id);
		break;
	case "upfile":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		var record = conn.query("SELECT * FROM [Wallpapers] WHERE id = " + search.id, 1);
		var wallpaper = record;
		page.content = function() {
%>
<form action="?upload" method="post" enctype="multipart/form-data">
	<input type="hidden" name="spicFileName" value="wallpaper-<%=wallpaper.id%>.jpg" />
	<input type="hidden" name="pic1FileName" value="wallpaper-<%=wallpaper.id%>-1024.jpg" />
	<input type="hidden" name="pic2FileName" value="wallpaper-<%=wallpaper.id%>-1280.jpg" />
	<table>
		<tr>
			<td>缩略图 ：</td>
			<td><input type="file" name="spic" /></td>
		</tr>
		<tr>
			<td>1024 x 768 ：</td>
			<td><input type="file" name="pic1" /></td>
		</tr>
		<tr>
			<td>1280 x 1024：</td>
			<td><input type="file" name="pic2" /></td>
		</tr>
	</table>
	<input type="submit" value="上传" />
</form>
<%
		}
		break;
	case "upload":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		try {
			if (input.spic[0].size) input.spic[0].saveAs("images/" + input.spicFileName);
			if (input.pic1[0].size) input.pic1[0].saveAs("images/" + input.pic1FileName);
			if (input.pic2[0].size) input.pic2[0].saveAs("images/" + input.pic2FileName);
		} catch(e) {}
		Response.Redirect("wallpaper.asp");
		break;
	case "delete":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		conn.del("Wallpapers", "id = " + search.id);
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		if (fso.fileExists(Server.MapPath("images/wallpaper-" + search.id + ".jpg"))) fso.deleteFile(Server.MapPath("images/wallpaper-" + search.id + ".jpg"));
		if (fso.fileExists(Server.MapPath("images/wallpaper-" + search.id + "-1024.jpg"))) fso.deleteFile(Server.MapPath("images/wallpaper-" + search.id + "-1024.jpg"));
		if (fso.fileExists(Server.MapPath("images/wallpaper-" + search.id + "-1280.jpg"))) fso.deleteFile(Server.MapPath("images/wallpaper-" + search.id + "-1280.jpg"));
		page.content = function() {
%>
删除成功！<a href="wallpaper.asp">返回</a>
<%
		}
		break;
	case "edit":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		var record = conn.query("SELECT * FROM [Wallpapers] WHERE id = " + search.id, 1);
		var wallpaper = record;
		page.content = function() {
%>
<form method="post" action="?update">
	<input type="hidden" name="id" value="<%=wallpaper.id%>" />
	<table>
		<tr>
			<td>名称：</td>
			<td><input name="name" type="text" value="<%=wallpaper.name%>" /></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "update":
		if (Session("isAdmin") != true) Response.Redirect("wallpaper.asp");
		conn.update("Wallpapers", {name: input.name}, "id = " + input.id);
		Response.Redirect("wallpaper.asp?view&id=" + input.id);
		break;
	default:
		var records = conn.query("SELECT * FROM [Wallpapers]");
		page.content = function() {
%>
<div id="wallpapers">
<%
			if (records) for (var record; !records.atEnd(); records.moveNext()) {
				record = records.item();
%>
<div class="item">
	<h3><%=record.name%></h3>
	<img src="images/wallpaper-<%=record.id%>.jpg" width="240" height="180" alt="<%=record.name%>" />
	<p><a href="images/wallpaper-<%=record.id%>-1024.jpg">1024 x 768</a></p>
	<p><a href="images/wallpaper-<%=record.id%>-1280.jpg">1280 x 1024</a></p>
<%
				if (Session("isAdmin") == true) {
%>
<a href="?edit&amp;id=<%=record.id%>">编辑</a>
<a href="?upfile&amp;id=<%=record.id%>">重新上传图片</a>
<a href="?delete&amp;id=<%=record.id%>" onClick="return confirm('确定要删除么？')">删除</a>
<%
				}
%>
</div>
<%
			} else {
%>
抱歉，目前暂时没有下载。
<%
			}
%>
</div>
<%
		}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/default.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../style/common.css" rel="stylesheet" type="text/css" />
<link href="style/common.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>壁纸</title>
<!-- InstanceEndEditable --><!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<!-- InstanceParam name="id" type="text" value="download" -->
</head>

<body id="page-download">
<div id="Header">
	<a href="../news.htm"><img src="../images/welcome.jpg" alt="三和中广网站正式开通" id="welcome" /></a>
	<ul id="navbar">
		<li id="navbar-main"><a href="../index.htm" title="首页">首页</a></li>
		<li id="navbar-about"><a href="../about/" title="关于我们">关于我们</a></li>
		<li id="navbar-portfolio"><a href="../portfolio/" title="作品">作品</a></li>
		<li id="navbar-download"><a href="../download/" title="下载">下载</a></li>
		<li id="navbar-cilent"><a href="../cilent/" title="客户">客户</a></li>
		<li id="navbar-service"><a href="../service/" title="服务">服务</a></li>
		<li id="navbar-contact"><a href="../contact/" title="联系">联系</a></li>
	</ul>
	
	<!-- InstanceBeginEditable name="nav2" -->
	<!-- InstanceEndEditable --></div>
<div id="ContentWrapper">
<div id="Sidebar">
<!-- InstanceBeginEditable name="Sidebar" -->
<h3><img src="images/Download.jpg" alt="Download" /></h3>
<ul class="list">
	<li><a href="video.asp"><img src="images/video.gif" align="Video" /></a></li>
	<li><a href="wallpaper.asp"><img src="images/wallpaper.gif" align="Wallpaper" /></a></li>
	<li><a href="tutorial.asp"><img src="images/tutorial.gif" align="Turorial" /></a></li>
</ul>
<%page.sidebar()%>
<!-- InstanceEndEditable -->
</div>
<div id="Content">
<!-- InstanceBeginEditable name="Content" -->
<h2>Wallpaper</h2>
<%page.content()%>
<!-- InstanceEndEditable -->
</div>
<div class="clear"></div>
</div>
<div id="Footer">
	<p><a href="../admin.asp">&copy;</a> Copyright 2005 - 2006 . plus3 design . All Right Reserved. <a href="http://www.miibeian.gov.cn">津ICP备06008731号</a></p>
</div>
</body>
<!-- InstanceEnd --></html>
