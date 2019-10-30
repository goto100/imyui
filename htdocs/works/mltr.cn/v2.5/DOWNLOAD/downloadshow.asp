<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
If Mid(Request.ServerVariables("HTTP_REFERER"), 8, Len(Request.ServerVariables("SERVER_NAME")))<>Request.ServerVariables("SERVER_NAME") Then
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>非法盗链</title></title>
</head>
<body>
	非法盗链，请访问 <a href="http://www.mltr.cn/">MLTR.Cn</a> 进行下载
</body>
</html>
<%ElseIf UserIsPassed<>"Passed" Then
	Plugin="download"
	CateRoot="download"
%>
<!-- #include file="../header.asp" -->
<%ShowAlert "错误", "为保护网站资源，请<a href=""../login.asp"">登陆</a>或花1分钟时间<a href=""../bbs/reg.asp"">注册</a>本站会员后再下载，多谢合作！", "backnorefresh", ""%>
</div>
<!-- #include file="../footer.asp" -->
<%
Else
	Dim CountUp
	If Request.QueryString("mp3")<>Empty Then
		Set CountUp=Conn.Execute("UPDATE Download_Content SET CountDownload=CountDownload+1 WHERE DownloadName='" & CheckStr(Request.QueryString("mp3")) & "' AND CateName='mp3'")
	ElseIf Request.QueryString("mtv")<>Empty Then
		Set CountUp=Conn.Execute("UPDATE Download_Content SET CountDownload=CountDownload+1 WHERE DownloadName='" & CheckStr(Request.QueryString("mtv")) & "' AND CateName='mtv'")
	ElseIf Request.QueryString("midi")<>Empty Then
		Set CountUp=Conn.Execute("UPDATE Download_Content SET CountDownload=CountDownload+1 WHERE DownloadName='" & CheckStr(Request.QueryString("midi")) & "' AND CateName='midi'")
	ElseIf Request.QueryString("other")<>Empty Then
		Set CountUp=Conn.Execute("UPDATE Download_Content SET CountDownload=CountDownload+1 WHERE DownloadName='" & CheckStr(Request.QueryString("other")) & "' AND CateName='other'")
	End If

	Dim DownloadShowRS
	If Request.QueryString("mp3")<>Empty Then
		Set DownloadShowRS=Conn.Execute("SELECT DownloadURL FROM Download_Content WHERE DownloadName='" & CheckStr(Request.QueryString("mp3")) & "' AND CateName='mp3'")
		DownloadFile ("../resources/download/mp3/" & DownloadShowRS("DownloadURL"))
	ElseIf Request.QueryString("mtv")<>Empty Then
		Set DownloadShowRS=Conn.Execute("SELECT DownloadURL FROM Download_Content WHERE CateName='mtv' AND DownloadName='" & CheckStr(Request.QueryString("mtv")) & "'")
		DownloadFile ("../resources/download/mtv/" & DownloadShowRS("DownloadURL"))
	ElseIf Request.QueryString("midi")<>Empty Then
		Set DownloadShowRS=Conn.Execute("SELECT DownloadURL FROM Download_Content WHERE DownloadName='" & CheckStr(Request.QueryString("midi")) & "' AND CateName='midi'")
		DownloadFile ("../resources/download/midi/" & DownloadShowRS("DownloadURL"))
	ElseIf Request.QueryString("other")<>Empty Then
		Set DownloadShowRS=Conn.Execute("SELECT DownloadURL FROM Download_Content WHERE DownloadName='" & CheckStr(Request.QueryString("other")) & "' AND CateName='other'")
		DownloadFile ("../resources/download/other/" & DownloadShowRS("DownloadURL"))
	End If

	CloseRS DownloadShowRS
End If
%>