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
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		page.content = function() {
%>
<form action="?save" method="post">
	<table>
		<tr>
			<td>名称：</td>
			<td><input name="name" type="text" /></td>
		</tr>
		<tr>
			<td>文件路径（请自行将视频上传至服务器并填写此路径）：</td>
			<td><input name="filepath" type="text" size="60" /></td>
		</tr>
		<tr>
			<td>视频大小：（单位自己填）</td>
			<td><input name="size" type="text" /></td>
		</tr>
		<tr>
			<td>视频长度：（单位自己填）</td>
			<td><input name="length" type="text" /></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "save":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		var record = conn.insert("Videos", {name: input.name, filepath: input.filepath, size: input.size, length: input.length}, true);
		Response.Redirect("video.asp?upfile&id=" + record.id);
		break;
	case "upfile":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		var record = conn.query("SELECT * FROM [Videos] WHERE id = " + search.id, 1);
		var video = record;
		page.content = function() {
%>
<form action="?upload" method="post" enctype="multipart/form-data">
	<input type="hidden" name="spicFileName" value="video-<%=video.id%>.jpg" />
	<table>
		<tr>
			<td>缩略图 ：</td>
			<td><input type="file" name="spic" /></td>
		</tr>
	</table>
	<input type="submit" value="上传" />
</form>
<%
		}
		break;
	case "upload":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		try {
			if (input.spic[0].size) input.spic[0].saveAs("images/" + input.spicFileName);
		} catch(e) {}
		Response.Redirect("video.asp");
		break;
	case "delete":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		conn.del("Videos", "id = " + search.id);
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		if (fso.fileExists(Server.MapPath("images/video-" + search.id + ".jpg"))) fso.deleteFile(Server.MapPath("images/video-" + search.id + ".jpg"));
		page.content = function() {
%>
删除成功！<a href="video.asp">返回</a>
<%
		}
		break;
	case "edit":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		var record = conn.query("SELECT * FROM [Videos] WHERE id = " + search.id, 1);
		var video = record;
		page.content = function() {
%>
<form method="post" action="?update">
	<input type="hidden" name="id" value="<%=video.id%>" />
	<table>
		<tr>
			<td>名称：</td>
			<td><input name="name" type="text" value="<%=video.name%>" /></td>
		</tr>
		<tr>
			<td>文件路径（请自行将视频上传至服务器并填写此路径）：</td>
			<td><input name="filepath" type="text" value="<%=video.filepath%>" size="60" /></td>
		</tr>
		<tr>
			<td>视频大小：（单位自己填）</td>
			<td><input name="size" type="text" value="<%=video.size%>" /></td>
		</tr>
		<tr>
			<td>视频长度：（单位自己填）</td>
			<td><input name="length" type="text" value="<%=video.length%>" /></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "update":
		if (Session("isAdmin") != true) Response.Redirect("video.asp");
		conn.update("Videos", {name: input.name, filepath: input.filepath, size: input.size, length: input.length}, "id = " + input.id);
		Response.Redirect("video.asp?view&id=" + input.id);
		break;
	default:
		var records = conn.query("SELECT * FROM [Videos]");
		page.content = function() {
%>
<div id="videos">
<%
			if (records) for (var record; !records.atEnd(); records.moveNext()) {
				record = records.item();
%>
<div class="item">
	<h3><%=record.name%></h3>
	<a href="<%=record.filepath%>"><img src="images/video-<%=record.id%>.jpg" width="240" height="180" alt="<%=record.name%>" /></a>
	<p>视频大小：<%=record.size%></p>
	<p>视频长度：<%=record.length%></p>
<%
				if (Session("isAdmin") == true) {
%>
<p><a href="?edit&amp;id=<%=record.id%>">编辑</a>
<a href="?upfile&amp;id=<%=record.id%>">重新上传缩略图</a>
<a href="?delete&amp;id=<%=record.id%>" onClick="return confirm('确定要删除么？')">删除</a></p>
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
<title>视频</title>
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
<h2>Video</h2>
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
