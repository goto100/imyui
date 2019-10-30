        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=94" title="上一篇日志: CSDN关于Web标准的调查" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=97" title="下一篇日志: 在8种浏览器上看你的网页" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/12.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=22" title="查看所有资源分享的日志">资源分享</a></strong> <a href="feed.asp?cateID=22" target="_blank" title="订阅所有资源分享的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有资源分享的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>网页标准——行为分离</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-07-28</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					在网页标准中，要求“结构、表现与行为”三层分离，在制作的过程中结构（html）与表现（css）的分离大家已经很熟悉了，那行为（javascript）的分离呢？如果你的页面中充斥着javascript脚本和事件句柄（onload、onchange），那说明你做得还不够。<br/><br/>将行为分离，需要把页面中所有在浏览器段执行的js代码放在外部js文件中，再在在页面head区中连接<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">&lt;script type=&quot;javascript&quot; src=&quot;...&quot; /&gt;</div></div><br/><br/>在js中文件使用getElementsByTagName、getElementsByName、getElementById等方法取得页面对象进行操作：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">var select1 = document.getElementsByTagName(&quot;select&quot;)[0];</div></div><br/><br/>给对象增加事件：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">function s1event() {<br/>alert(&quot;OK&quot;);<br/>}<br/>select1.onchange = s1event;</div></div><br/><br/>你可能觉得到此已经结束了，但很遗憾的是还有问题。你会发现程序根本不能正确执行，为什么呢？<br/><br/>在页面中连接的js文件是连接后立刻执行的，把js文件在head区域执行，当时文档中还没有出现你get的Element，则程序不可能正常工作。<br/><br/>要如何修复呢？现在的做法是通过一个函数，待网页全部下载完毕后再执行程序，这是文档中的对象已经全部存在了，就可以正确执行了。这个函数是：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">function addLoadEvent(func) {<br/>&#160;&#160;&#160;&#160;var oldonload = window.onload;<br/>&#160;&#160;&#160;&#160;if (typeof(window.onload) != &quot;function&quot;) {<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;window.onload = func;<br/>&#160;&#160;&#160;&#160;} else {<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;window.onload = function() {<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;oldonload();<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;func();<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;}<br/>&#160;&#160;&#160;&#160;}<br/>} </div></div><br/><br/>把需要get页面中Element的程序作成函数，用addLoadEvent函数调用：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">function s1event() {<br/>alert(&quot;OK&quot;);<br/>}<br/>function executeOnLoaded() {<br/>var select1 = document.getElementsByTagName(&quot;select&quot;)[0];<br/>select1.onchange = s1event;<br/>}<br/><br/>addLoadEvent(executeOnLoaded);</div></div><br/><br/>到此为止，程序正常执行。<br/><br/>以上只是一个折中的办法，因为当页面很大需要很久才能下载完或者由于网络原因用户根本无法下载完全页面的时候，那可就不好了。所以，对于一些比较庞大的页面，还是在页面中使用事件句柄比较稳妥。<br/><br/>当然如果你有更好的解决方法请留言。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=95&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(95)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 6 | <a href="trackback.asp?tbID=95&amp;action=view" target="_blank">引用: 929</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
