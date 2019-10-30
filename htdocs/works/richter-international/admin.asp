<!-- #include file = "common/common.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
</head>

<body>
<%
if (search.logout != null) {
	user.logout();
	Response.Redirect("admin.asp");
} else if (input.password || user.isAdmin) {
	if (user.login(input.password)) { 
%>
<p><a href="?logout">Logout</a></p>
<p><a href="news/news.asp?add">Add News</a></p>
<%
	} else {
%>
<h1>Wrong Password!</h1>
<p><a href="javascript:history.go(-1);">Back</a></p>
<%
	}
} else {
%>
<form action="" method="post">
	<label>Password：<input type="text" name="password" /></label>
	<input type="submit" />
</form>
</body>
</html>
<%
}
%>