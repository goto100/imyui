        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=58" title="上一篇日志: 使Flash在html中全屏显示" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=60" title="下一篇日志: 天津，2004年冬季没有雪……" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>The IE Doubled Float-Margin Bug(IE双倍浮动边界Bug)</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-01-03</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					原址：<a href="http://www.positioniseverything.net/explorer/doubled-margin.html" target="_blank">http://www.positioniseverything.net/explorer/doubled-margin.html</a> <br/><br/>地址：<a href="http://www.omemo.net/talk/viewtopic.php?t=3" target="_blank">http://www.omemo.net/talk/viewtopic.php?t=3</a><br/><br/>发现外国人写文章很罗嗦。我在这里简单记录一下就好了。<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">.floatbox { <br/>float: left; <br/>width: 150px; <br/>height: 150px; <br/>margin: 5px 0 5px 100px; <br/>/*This last value applies the 100px left margin */ <br/>} </div></div><br/>这个Div在IE中效果是margin: 5px 0 5px 200px;<br/>也就是说在IE中定义一个层float:left那么它的同方向margin会翻倍。<br/><br/>解决办法：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">.floatbox { <br/>float: left; <br/>width: 150px; <br/>height: 150px; <br/>margin: 5px 0 5px 100px; <br/>display: inline; <br/>}</div></div>
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=59&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(59)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 0 | <a href="trackback.asp?tbID=59&amp;action=view" target="_blank">引用: 235</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
