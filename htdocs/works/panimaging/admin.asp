<!--#include file="common.asp" -->
<!--#include file="conn.asp" -->
<%
var password = "admin888";

header();

if (String(Request.QueryString("logout")) != "undefined") Session.Contents.Remove("LoggedIn");

if (String(Request.QueryString("login")) != "undefined") {
	if (Request.Form("password") == password) {
		Session("LoggedIn") = true;
		Response.Redirect("admin.asp");
	} else {
		Response.Write("<h2>密码错误！<a href=\"admin.asp\">返回</a></h2>");
		footer();
		Response.End();
	}
} else if (Session("LoggedIn") != true) {
%>
<h2>您未登录，请登陆</h2>
<form action="admin.asp?login" method="post">
	<label>密码：<input type="password" name="password" size="24" /></label><br />
	<input type="submit" value="提交" class="submit" />
</form>
<%
	footer();
	Response.End();
}

var conn = new ActiveXObject("ADODB.Connection");
conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + dbPath;
conn.Open();

// Add
if (String(Request.QueryString("add")) == "do") {
	conn.Execute("INSERT INTO [Article] (cateId, title, content) VALUES (" + parseInt(Request.Form("cateId")) + ", '" + Request.Form("title") + "', '" + Request.Form("content") + "')");
	Response.Write("<h2>已添加，<a href=\"admin.asp\">返回</a></h2>");
} else if (String(Request.QueryString("add")) != "undefined") {
%>
<form action="admin.asp?add=do" method="post">
	<label>标题：<input type="text" name="title" size="36" /></label>
	<label>类别：
		<select name="cateId">
			<option value="1">最新动态</option>
			<option value="2">应用实例</option>
		</select>
	</label><br />
	<label>内容：<textarea name="content" cols="48" rows="12"></textarea></label><br />
	<input type="submit" value="提交" class="submit" />
</form>
<%
} else if (String(Request.QueryString("edit")) == "do") {
	conn.Execute("UPDATE [Article] SET title='" + Request.Form("title") + "', content='" + checkSQL(Request.Form("content")) + "', [date]=#" + Request.Form("date") + "# WHERE id=" + Request.Form("id"));
	Response.Write("<h2>已更新，<a href=\"admin.asp\">返回</a></h2>");
} else if (String(Request.QueryString("edit&id")) != "undefined") {
	var rs = new ActiveXObject("ADODB.Recordset");
	rs = conn.Execute("SELECT TOP 1 title, content, date FROM [Article] WHERE id=" + Request.QueryString("edit&id"));
	rs = transformArray(rs);
	rs = rs[0];
%>
<form action="admin.asp?edit=do" method="post">
	<input type="hidden" name="id" value="<%=Request.QueryString("edit&id")%>" />
	<label>标题：<input type="text" name="title" size="36" value="<%=rs["title"]%>" /></label><br />
	<label>内容：<textarea name="content" cols="48" rows="12"><%=rs["content"]%></textarea></label><br />
	<label>时间：<input type="text" name="date" value="<%=rs["date"]%>" />请严格按照格式输入，否则无法修改</label><br />
	<input type="submit" value="提交" class="submit" />
</form>
<%
} else if (String(Request.QueryString("delete")) == "do" && String(Request.QueryString("id")) != "undefined") {
	conn.Execute("DELETE * FROM [Article] WHERE id=" + Request.QueryString("id"));
	Response.Write("<h2>删除成功！<a href=\"admin.asp\">返回</a></h2>");
} else {
%>
<a href="admin.asp?add">添加</a>
<a href="admin.asp?logout">登出</a>
<ul>
<%
	var rs = new ActiveXObject("ADODB.Recordset");
	rs = conn.Execute("SELECT id, title FROM [Article] ORDER BY cateId, date DESC");
	rs = transformArray(rs);
	for (var i = 0; i < rs.length; i++) {
%>
	<li><a href="admin.asp?edit&id=<%=rs[i]["id"]%>"><%=rs[i]["title"]%></a> <a href="admin.asp?delete=do&id=<%=rs[i]["id"]%>" onclick="return confirm('确定删除？')">删除</a></li>
<%
	}
%>
</ul>
<%
}

footer();
%>
