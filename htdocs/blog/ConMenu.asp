﻿<!--#include file="conCommon.asp" -->
<!--#include file="common/function.asp" -->
<!--#include file="common/library.asp" -->
<!--#include file="common/cache.asp" -->
<!--#include file="common/checkUser.asp" -->
<%
'==================================
'  后台管理菜单部分
'    更新时间: 2005-7-3
'==================================
if session(CookieName&"_System")=true and memName<>empty and stat_Admin=true then 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Language" content="UTF-8" />
<meta name="author" content="puter2001@21cn.com,PuterJam" />
<meta name="Copyright" content="PL-Blog 2 CopyRight 2005" />
<meta name="keywords" content="PuterJam,Blog,ASP,designing,with,web,standards,xhtml,css,graphic,design,layout,usability,ccessibility,w3c,w3,w3cn" />
<meta name="description" content="PuterJam's BLOG" />
<link rel="stylesheet" rev="stylesheet" href="common/control.css" type="text/css" media="all" />
<title>后台管理-菜单</title>
<script>
var LastItem=null
function MenuClick(obj,url){
 if (LastItem!=null){
  LastItem.className="menuA"
 }
 obj.className="menuAS"
 LastItem=obj
 obj.blur()
 if (url.length>0) parent.MainContent.location=url;
}
</script>
</head>
<body class="menuBody" onload="MenuClick(document.getElementById('index'),'ConContent.asp?Fmenu=welcome')">
 <div class="menu">
 <img border="0" src="images/Control/menuS.jpg" width="152" height="8"></div>
 <ul class="menuUL">
   <li><a id="index" href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=welcome')"><img src="images/Control/icon/icon0.gif" alt="" border="0" class="MenuIcon"/>后台首页</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=General&Smenu=')"><img src="images/Control/icon/icon2.gif" alt="" border="0" class="MenuIcon"/>站点基本设置</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Categories&Smenu=')"><img src="images/Control/icon/icon4.gif" alt="" border="0" class="MenuIcon"/>日志分类管理</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Comment&Smenu=')"><img src="images/Control/icon/icon10.gif" alt="" border="0" class="MenuIcon"/>评论留言管理</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Skins&Smenu=')"><img src="images/Control/icon/icon5.gif" alt="" border="0" class="MenuIcon"/>界面与插件</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=SQLFile&Smenu=')"><img src="images/Control/icon/icon3.gif" alt="" border="0" class="MenuIcon"/>数据库与附件</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Members&Smenu=')"><img src="images/Control/icon/icon6.gif" alt="" border="0" class="MenuIcon"/>帐户与权限</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Link&Smenu=')"><img src="images/Control/icon/icon7.gif" alt="" border="0" class="MenuIcon"/>友情链接管理</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=smilies&Smenu=')"><img src="images/Control/icon/icon8.gif" alt="" border="0" class="MenuIcon"/>表情与关键字</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Status&Smenu=')"><img src="images/Control/icon/icon1.gif" alt="" border="0" class="MenuIcon"/>服务器信息</a></li>
   <li><a href="javascript:void(0)" class="menuA" onclick="MenuClick(this,'ConContent.asp?Fmenu=Logout&Smenu=')"><img src="images/Control/icon/icon9.gif" alt="" border="0" class="MenuIcon"/>退出</a></li>
</ul>
 </body>
</html>
<%
else
 Response.Redirect("default.asp")
end if
%>