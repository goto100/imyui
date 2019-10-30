<!-- #include file = "common/common.asp" -->
<%
page.category.id = "main"
page.category.name = "首页"
page.addStyle("main");
page.content = function() {%>
<div id="menu">
	<ul>
		<li><a href="default.htm">宣传页</a></li>
	</ul>
</div>
<div id="main">
	<div id="topnews">
		<h2>头条新闻</h2>
		<h3>FROM INDIA TO CHINA</h3>
		<a href="#"><img src="images/topnews/2005beforechina.jpg" alt="FROM INDIA TO CHINA" /></a>
		<p>MLTR 结束印度之行来到中国</p>
	</div>
	<div id="lastnews">
		<h2>最新新闻</h2>
<!-- #include file = "news/news-list.asp" -->
		<a href="news/index.asp?cid=1" class="more">全部新闻</a>
	</div>
	<div id="picupdate">
		<h2>图片更新</h2>
<!-- #include file = "picupdate-list.asp" -->
	</div>
	<div id="update">
		<h2>最新更新</h2>
<!-- #include file = "update-list.asp" -->
	</div>
</div>
<div id="sidebar">
	<div id="bbsnewannouncement">
		<h2>本站公告</h2>
<!-- #include file = "bbsannouncement-list.asp" -->
	</div>
	<div id="bbsnewtopic">
		<h2>论坛新贴</h2>
<!-- #include file = "bbstopic-list.asp" -->
	</div>
	<div id="bbsinfo">
		<h2>论坛统计</h2>
<!-- #include file = "bbsinfo-list.asp" -->
	</div>
	<div id="vote">
		<h2>本站调查</h2>
		<p>抱歉，投票系统暂时关闭中。</p>
		<p>欢迎去留言本发表评论。</p>
	</div>
</div>
<div id="link">
	<h2>友情链接</h2>
	<ul>
		<li><a href="http://falling.gf8.cn/" title="Evanescence中文站" rel="external"><img src="images/link/evanescence.gif" alt="Evanescence中文站" /></a></li>
		<li><a href="http://www.celinefans.net/" title="Celine Dion中国歌迷站" rel="external"><img src="images/link/celinedion.gif" alt="Celine Dion中国歌迷站" /></a></li>
		<li><a href="http://bluefans.net" title="BLUE中文站" rel="external"><img src="images/link/blue.gif" alt="BLUE中文站" /></a></li><li><a href="http://www.u2cn.com/" title="U2中文站" rel="external"><img src="images/link/u2.gif" alt="U2中文站" /></a></li>
		<li><a href="http://www.backstreetboys.cn/" title="后街男孩中文站" rel="external"><img src="images/link/backstreetboys.gif" alt="后街男孩中文站" /></a></li>
		<li><a href="http://www.aaroncarter.cn/" title="AaronCarter中文网站" rel="external"><img src="images/link/aaroncarter.gif" alt="AaronCarter中文网站" /></a></li>
		<li><a href="http://www.avril-lavigne.net.cn/" title="Avril中国歌迷后援会" rel="external"><img src="images/link/avril-lavigne.jpg" alt="Avril中国歌迷后援会" /></a></li>
		<li><a href="http://www.caiyihao.com" title="浩的网站" rel="external"><img src="images/link/caiyihao.gif" alt="浩的网站" /></a></li>
		</ul>
</div>
<%
}

page.output();
%>
