<!-- #include file="common.asp" -->
<!-- #include file="inc/function.asp" -->
<%
title="首页 - " & SiteCName
%>
<!-- #include file="header.asp" -->
<div id="menu">
	<h2>快速链接</h2>
	<ul>
		<li><a href="index.htm">宣传页</a></li>
<%
If UserIsPassed="Passed" Then
%>
<%
Else
%>
		<li><a href="login.asp">登陆本站</a></li>
		<li>
			<form method="post" action="login.asp?action=login">
				<label for="username">账号</label>
				<input type="text" name="username" size="16" maxlength="16" class="text" />
				<label for="password">密码</label>
				<input type="password" name="password" size="16" maxlength="16" class="text" />
				<input type="submit" name="submit" value="登陆" class="button" />
			</form>
		</li>
		<li><a href="bbs/reg.asp">注册</a></li>
		<li><a href="bbs/lostpass.asp">忘记密码</a></li>
<%
End If
%>
	</ul>
</div>
<div id="bodier">
<%
'读取首页内容
Dim MainRs
SetRS MainRs, Conn, "SELECT * FROM Main_Content"
%>
	<div id="topnews">
		<h2>头条新闻</h2>
<%
Dim TopNewsRS
Set TopNewsRS=Conn.Execute("SELECT TopNewsTitle, TopNewsPic, TopNewsURL, TopNewsIntro FROM Main_Content")
%>
		<h3><%=TopNewsRS("TopNewsTitle")%></h3>
		<a href="<%=TopNewsRS("TopNewsURL")%>"><img src="images/topnews/<%=TopNewsRS("TopNewsPic")%>.jpg" alt="<%=TopNewsRS("TopNewsTitle")%>" /></a>
		<p><%=TopNewsRS("TopNewsIntro")%></p>
<%
CloseRS TopNewsRS
%>
	</div>
	<div id="lastnews">
		<h2>最新新闻</h2>
		<!-- #include file="inc/main_lastnews.asp" -->
		<a href="news/news.asp?cate=news" class="more">全部新闻</a>
	</div>
	<div id="picupdate">
		<h2>图片更新</h2>
		<!-- #include file="inc/main_lastupdatepic.asp" -->
	</div>
	<div id="update">
		<h2>最新更新</h2>
		<!-- #include file="inc/main_lastupdate.asp" -->
	</div>
</div>
<div id="sidebar">
	<div id="bbsnewannouncement">
		<h2>本站公告</h2>
		<!-- #include file="inc/main_bbsnewannouncement.asp" -->
	</div>
	<div id="bbsnewtopic">
		<h2>论坛新贴</h2>
		<!-- #include file="inc/main_bbsnewtopic.asp" -->
	</div>
	<div id="bbsinfo">
		<h2>论坛统计</h2>
		<!-- #include file="inc/main_bbsinfo.asp" -->
	</div>
	<div id="vote">
		<h2>本站调查</h2>
		<!-- #include file="inc/main_vote.asp" -->
		<p>欢迎去留言本发表评论。</p>
	</div>
</div>
<div id="link">
	<h2>友情链接</h2>
	<!-- #include file="inc/main_link.asp" -->
</div>
<%
CloseRS MainRs
%>
<!-- #include file="footer.asp" -->