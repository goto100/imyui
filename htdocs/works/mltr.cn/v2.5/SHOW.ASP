<!-- #include file="common.asp" -->
<!-- #include file="inc/function.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Show.Asp</title>
<script src="inc/script.js" type="text/javascript"></script>
<style type="text/css">
	html{width:100%;height:100%;margin:0;padding:0;}
	body{width:100%;height:100%;text-align:center;margin:0;padding:0;}
</style>
</head>

<body>
<%
If Request.QueryString("swf")<>Empty Then
%>
	<script type="text/javascript">
		ShowSwf("<%=Request.QueryString("swf")%>", "100%", "100%")
	</script>
<%
ElseIf Request.QueryString("pic")<>Empty Then
%>
	<style type="text/css">
		table{width:100%;height:100%;margin:0 auto;}
	</style>
	<table>
			<tr><td valign="middle"><img src="<%=Request.QueryString("pic")%>" /></td></tr></table>
<%
End If
%>
</body>
</html>