<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/ubb.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/cate/shop.css" rel="stylesheet" type="text/css" />
<title>购物公告</title>
</head>

<body class="affiche">
<%
Dim rs
Set rs=BBSConn.Execute("SELECT * FROM Dv_BbsNews WHERE boardid=21 AND id=" & Request.QueryString("id"))
%>
<h1>购物公告 - <%=rs("title")%></h1>
<div id="content">
	<%=UbbCode(rs("content"), 0, 0, 0, 0, 0)%>
	<p class="time"><strong>发表日期：</strong><%=rs("addtime")%></p>
</div>
</body>
</html>
