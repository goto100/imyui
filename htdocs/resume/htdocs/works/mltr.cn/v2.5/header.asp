<%
If CateRoot<>Empty Then
	'读取当前栏目的相关信息
	Dim NavRS
	SetRS NavRS, Conn, "SELECT * FROM [Site_Nav] WHERE [NavName]='" & CateRoot & "'"
	'当前主栏目所有次栏目
	Dim CateListRS
	SetRS CateListRS, Conn, "SELECT * FROM [Site_Cate] WHERE [NavName]='" & CateRoot & "' ORDER BY [CateID]"
End If
If Cate<>Empty Then
	'读取当前子栏目的相关信息
	Dim CateRS
	SetRS CateRS, Conn, "SELECT * FROM [Site_Cate] WHERE [CateName]='" & Cate & "' AND NavName='" & CateRoot & "'"
End If
If IsArray(Application("NavListName"))=False Then
	'读取所有主栏目
	Dim NavListRS
	SetRS NavListRS, Conn, "SELECT * FROM [Site_Nav] Order By [NavID]"
	ReDim NavListName(NavListRS.RecordCount), NavListCName(NavListRS.RecordCount), NavListURL(NavListRS.RecordCount)
	Dim i4
	For i4=1 To NavListRS.RecordCount
		NavListName(i4)=NavListRS("NavName")
		NavListCName(i4)=NavListRS("NavCName")
		NavListURL(i4)=NavListRS("NavURL")
		NavListRS.MoveNext
	Next
	Set i4=Nothing
	Application("NavListName")=NavListName
	Application("NavListCName")=NavListCName
	Application("NavListURL")=NavListURL
	CloseRS NavListRS
End If
%>
<!-- #include file="inc/ubb.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
If title=Empty Then
	If CateRoot<>Empty And Cate<>Empty Then
		title=NavRS("NavCName") & " - " & CateRS("CateCName")
		headline="<a href=""/" & SiteFolder & NavRS("NavName") & """>" & NavRS("NavCName") & "</a> - " & CateRS("CateCName")
	Else
		title=NavRS("NavCName")
		headline=NavRS("NavCName")
	End If
ElseIf title<>Empty And CateRoot<>Empty And Cate<>Empty Then
	headline="<a href=""/" & SiteFolder & NavRS("NavName") & """>" & NavRS("NavCName") & "</a> - " & "<a href=""/" & SiteFolder & NavRS("NavName") & "/" & CateRS("CateURL") & """>" & CateRS("CateCName") & "</a>" & " - " & title
	title=NavRS("NavCName") & " - " & CateRS("CateCName") & " - " & title
Else
	headline=title
End If
%>
<title><%=title & " - " & SiteCName & " - " & SiteTitle%></title>
<script src="/<%=SiteFolder%>inc/script.js" type="text/javascript"></script>
<link href="/<%=SiteFolder%>css/style.css" rel="stylesheet" type="text/css" />
<%
Dim style
If CateRoot<>Empty And Cate<>Empty Then
	style="content"
ElseIf GetASPName="index" Then
	style="index"
ElseIf GetASPName="main" Then
	style="main"
ElseIf Cate=Empty And GetASPName<>"index" And GetASPName<>"main" Then
	style="other"
End If
If style<>Empty Then
%>
<link href="/<%=SiteFolder%>css/<%=style%>.css" rel="stylesheet" type="text/css" />
<%
End If
Set style=Nothing
If CateRoot<>Empty Then
%>
<link href="/<%=SiteFolder%>css/cate/<%=CateRoot%>.css" rel="stylesheet" type="text/css" />
<%
End If
%>
</head>
<body id="cateroot_<%=CateRoot%>" class="plugin_<%=Plugin%>">
<div id="cate_<%=Cate%>" class="plugin_<%=GetASPName%>">
<div id="wrapper" class="">
<div id="innerWrapper">
<!-- PageHeaderBegin -->
<p id="skipheader"><a href="#bodier">Skip Header</a>.</p>
<div id="logo">
	<a href="/<%=SiteFolder%>main.asp" title="返回首页"><img src="/<%=SiteFolder%>images/main.gif" alt="返回首页" /></a>
</div>
<div id="logininfo">
	<h2>登陆状态</h2>
	<ul>
<%
If UserIsPassed="Passed" Then
	If UserValue="Admin" Then
%>
		<li class="welcome">欢迎管理员 <em><%=UserName%></em></li>
<%
	Else
%>
		<li class="welcome">欢迎 <em><%=UserName%></em></li>
<%
	End If
%>
		<li class="logout"><a href="/<%=SiteFolder%>login.asp?action=logout" title="登出">登出</a></li>
<%
Else
%>
		<li class="welcome">欢迎 <em>游客</em></li>
		<li class="login"><a href="/<%=SiteFolder%>login.asp" title="登陆">登陆</a></li>
		<li class="reg"><a href="/<%=SiteFolder%>bbs/reg.asp" title="注册">注册</a></li>
<%
End If
%>
	</ul>
</div>
<div id="nav">
	<h2>网站导航</h2>
	<ul>
<%
Dim i3
For i3=1 To UBound(Application("NavListName"))
	If CateRoot=Application("NavListName")(i3) Then
%>
	<li id="n_<%=Application("NavListName")(i3)%>" class="active">
		<a href="/<%=SiteFolder%><%=Application("NavListURL")(i3)%>" title="<%=Application("NavListCName")(i3)%>"><img src="/<%=SiteFolder%>images/cateroot/<%=Application("NavListName")(i3)%>active.gif" alt="<%=Application("NavListCName")(i3)%>" id="nav_<%=Application("NavListName")(i3)%>" /></a>
	</li>
<%
	Else
%>
	<li id="n_<%=Application("NavListName")(i3)%>">
		<a href="/<%=SiteFolder%><%=Application("NavListURL")(i3)%>" title="<%=Application("NavListCName")(i3)%>" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('nav_<%=Application("NavListName")(i3)%>','','/<%=SiteFolder%>images/cateroot/<%=Application("NavListName")(i3)%>active.gif',1)"><img src="/<%=SiteFolder%>images/cateroot/<%=Application("NavListName")(i3)%>.gif" alt="<%=Application("NavListCName")(i3)%>" id="nav_<%=Application("NavListName")(i3)%>" /></a>
	</li>
<%
	End If
Next
%>
	</ul>
</div>
<div id="title">
	<h1><%=headline%></h1>
</div>
<!-- PageHeaderEnd -->
<div id="mainWrapper">
