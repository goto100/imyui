﻿<!--#include file="commond.asp" -->
<!--#include file="header.asp" -->
<!--内容-->
<%
'==================================
'  信息显示页面
'    更新时间: 2005-10-18
'==================================
if not session(CookieName&"_ShowMsg") then 
    Response.Redirect("default.asp")
end if
    session(CookieName&"_ShowMsg")=false

%>
 <div id="Tbody">
<br/><br/>
   <div style="text-align:center;">
    <div id="MsgContent" style="width:300px">
      <div id="MsgHead"><%=session(CookieName&"_title")%></div>
      <div id="MsgBody">
	   <div class="<%=session(CookieName&"_icon")%>"></div>
       <div class="MessageText"><%=session(CookieName&"_des")%></div>
	  </div>
	</div>
  </div><br/><br/>
 </div>
 <!--#include file="footer.asp" -->