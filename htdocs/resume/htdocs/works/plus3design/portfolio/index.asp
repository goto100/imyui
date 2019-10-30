<!--#include file="../conn.asp" -->
<%
function outNav2(id) {
%>
	<ul id="navbar2">
		<li id="navbar2-1"><%if(id!=1){%><a href="?cateId=1">平面</a><%} else {%>平面<%}%></li>
		<li id="navbar2-2"><%if(id!=2){%><a href="?cateId=2">三维</a><%} else {%>三维<%}%></li>
		<li id="navbar2-3"><%if(id!=3){%><a href="?cateId=3">动画</a><%} else {%>动画<%}%></li>
		<li id="navbar2-4"><%if(id!=4){%><a href="?cateId=4">影视</a><%} else {%>影视<%}%></li>
	</ul>
<%
}
page.nav2 = function() {}
switch (search[0]) {
	case "upfile":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		var record = conn.query("SELECT * FROM [Portfolios] WHERE id = " + search.id, 1);
		var portfolio = record;
		page.content = function() {
%>
<form action="?upload" method="post" enctype="multipart/form-data">
	<input type="hidden" name="picFileName" value="portfolio-<%=portfolio.id%>.jpg" />
	<input type="hidden" name="spicFileName" value="works-<%=portfolio.id%>.gif" />
	<table>
		<tr>
			<td>缩略图：（gif格式）</td>
			<td><input type="file" name="spic" /></td>
		</tr>
		<tr>
			<td>作品图：（jpg格式，宽600像素）</td>
			<td><input type="file" name="aaaa" /></td>
		</tr>
	</table>
	<input type="submit" value="上传" />
</form>
<%
		}
		break;
	case "upload":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		try {
			if (input.spic[0].size) input.spic[0].saveAs("images/" + input.spicFileName);
			if (input.aaaa[0].size) input.aaaa[0].saveAs("images/" + input.picFileName);
		} catch(e) {}
		break;
	case "delete":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		conn.del("Portfolios", "id = " + search.id);
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		if (fso.fileExists(Server.MapPath("images/works-" + search.id + ".gif"))) fso.deleteFile(Server.MapPath("images/works-" + search.id + ".gif"));
		if (fso.fileExists(Server.MapPath("images/portfolio-" + search.id + ".jpg"))) fso.deleteFile(Server.MapPath("images/portfolio-" + search.id + ".jpg"));
		page.content = function() {
%>
删除成功！<a href="index.asp">返回</a>
<%
		}
		break;
	case "edit":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		var record = conn.query("SELECT * FROM [Portfolios] WHERE id = " + search.id, 1);
		var portfolio = record;
		page.content = function() {
%>
<form method="post" action="?update">
	<input type="hidden" name="id" value="<%=portfolio.id%>" />
	<table>
		<tr>
			<td>分类：</td>
			<td><select name="cateId">
				<option value="1"<%if(portfolio.cateId==1){%> selected="selected"<%}%>>平面</option>
				<option value="2"<%if(portfolio.cateId==2){%> selected="selected"<%}%>>三维</option>
				<option value="3"<%if(portfolio.cateId==3){%> selected="selected"<%}%>>动画</option>
				<option value="4"<%if(portfolio.cateId==4){%> selected="selected"<%}%>>影视</option>
			</select></td>
		</tr>
		<tr>
			<td>作品内容：（将出现在作品图下方）</td>
			<td><textarea name="content" cols="50" rows="10"><%=portfolio.content%></textarea></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "save":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		var record = conn.insert("Portfolios", {content: input.content, cateId: parseInt(input.cateId)}, true);
		Response.Redirect("index.asp?upfile&id=" + record.id);
		break;
	case "update":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		conn.update("Portfolios", {content: input.content, cateId: parseInt(input.cateId)}, "id = " + input.id);
		Response.Redirect("index.asp?view&id=" + input.id);
		break;
	case "add":
		if (Session("isAdmin") != true) Response.Redirect("index.asp");
		page.content = function() {
%>
<form action="?save" method="post">
	<table>
		<tr>
			<td>分类：</td>
			<td><select name="cateId">
				<option value="1">平面</option>
				<option value="2">三维</option>
				<option value="3">动画</option>
				<option value="4">影视</option>
			</select></td>
		</tr>
		<tr>
			<td>作品内容：（将出现在作品图下方）</td>
			<td><textarea name="content" cols="50" rows="10"></textarea></td>
		</tr>
	</table>
	<input type="submit" value="提交" />
</form>
<%
		}
		break;
	case "view":
		var record = conn.query("SELECT * FROM [Portfolios] WHERE id = " + search.id, 1);
		var portfolio = record;

		var records = conn.query("SELECT * FROM [Portfolios] WHERE cateId = " + portfolio.cateId + " ORDER BY id DESC");
		page.sidebar = function() {
%>
<ul id="works" class="list">
	<%
			if (records) for (var record; !records.atEnd(); records.moveNext()) {
				record = records.item();
	%>
	<li id="works-<%=record.id%>"><a href="?view&id=<%=record.id%>"><img src="images/works-<%=record.id%>.gif" /></a></li>
	<%}%>
</ul>
<%
		}

		page.nav2 = function() {
			outNav2(portfolio.cateId)
		}
		page.content = function() {
%>
<%=portfolio.content%>
	<img src="images/portfolio-<%=portfolio.id%>.jpg" width="600" />
<%
			if (Session("isAdmin")) {
%>
<a href="?edit&amp;id=<%=portfolio.id%>">编辑</a>
<a href="?upfile&amp;id=<%=portfolio.id%>">重新上传图片</a>
<a href="?delete&amp;id=<%=portfolio.id%>" onClick="return confirm('确定要删除么？')">删除</a>
<%
			}
		}
		break;
	default:
		sql = "SELECT TOP 1 * FROM [Portfolios]";
		if (search.cateId) sql += " WHERE cateId = " + search.cateId;
		sql += " ORDER BY id DESC";
		var record = conn.query(sql, 1);
		if (record) Response.Redirect("?view&id=" + record.id);

/*
		var sql = "SELECT * FROM [Portfolios]";
		if (search.cateId) sql += " WHERE cateId = " + search.cateId;
		var records = conn.query(sql);

		page.nav2 = function() {
			outNav2(parseInt(search.cateId));
		}
		page.sidebar = function() {
%>
<ul id="works" class="list">
	<%
			if (records) for (var record; !records.atEnd(); records.moveNext()) {
				record = records.item();
	%>
	<li id="works-<%=record.id%>"><a href="?view&id=<%=record.id%>"><img src="images/works-<%=record.id%>.gif" /></a></li>
	<%}%>
</ul>
<%
		}
*/}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/default.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../style/common.css" rel="stylesheet" type="text/css" />
<link href="style/common.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>作品</title>
<!-- InstanceEndEditable --><!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<!-- InstanceParam name="id" type="text" value="portfolio" -->
</head>

<body id="page-portfolio">
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
	<%=page.nav2()%>
	<!-- InstanceEndEditable --></div>
<div id="ContentWrapper">
<div id="Sidebar">
<!-- InstanceBeginEditable name="Sidebar" -->
<h3><img src="images/Sidebar title.jpg" alt="Portfolio" /></h3>
<%page.sidebar()%>
<%
if (Session("isAdmin") == true) {
%>
<a href="index.asp?add">添加</a>
<%
}
%>
<!-- InstanceEndEditable -->
</div>
<div id="Content">
<!-- InstanceBeginEditable name="Content" -->
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
