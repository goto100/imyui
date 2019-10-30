        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=126" title="上一篇日志: 离开" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=128" title="下一篇日志: 希望浏览器有这样的功能" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/21.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=26" title="查看所有作品的日志">作品</a></strong> <a href="feed.asp?cateID=26" target="_blank" title="订阅所有作品的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有作品的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>关机脚本</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2006-02-19</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					我们小区的网络白天一下 BT 就会被封网，所以我决定晚上挂通宵，但是我又不能保证早上起来把 BT 关掉（睡懒觉嘛），于是结合网上的资料写了一个自动关机脚本。<br/><br/>需要注意的是如果关机时间是 0点 到 9点，要写 "06:00" 这种格式，前面的零不能省略，否则不能工作哦。<br/><br/>把一下代码存为 shutdown.vbs ，需要自动关机的时候双机运行下就好啦！<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>dim closeTime<br/>closeTime = inputBox("请输入自动关机的时间（格式 HH:MM）：") ' 自动关机时间<br/>if closeTime = "" then<br/>&#160;&#160;&#160;&#160;msgBox("设置错误，程序退出")<br/>else<br/>&#160;&#160;&#160;&#160;msgBox("已设置自动关机！")<br/>&#160;&#160;&#160;&#160;dim countDownTime : countDownTime = 30 ' 允许取消关机倒计时时间<br/>&#160;&#160;&#160;&#160;dim oShell : set oShell = WScript.CreateObject ("WSCript.shell")<br/><br/>&#160;&#160;&#160;&#160;do while true<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;dim nowTime : nowTime = cstr(formatDateTime(time(), 4))<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if nowTime = closeTime then<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;oShell.run "Shutdown /s /t " & countDownTime & " /c 开始自动关机了，请注意将资料存盘 /d p:1:1"<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if msgBox("确定关机吗？", vbyesno) = vbno then<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;oShell.run "Shutdown /a"<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;end if<br/><br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Set oShell = Nothing<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;exit do<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;WScript.Quit 1<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;end if<br/>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;WScript.sleep 3000<br/>&#160;&#160;&#160;&#160;loop<br/>end if<br/></div></div>
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					[本日志由 宇义 于 2007-10-30 00:14 AM 编辑]<br/>
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=127&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(127)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 29 | <a href="trackback.asp?tbID=127&amp;action=view" target="_blank">引用: 799</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
