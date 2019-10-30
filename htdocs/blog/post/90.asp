        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=89" title="上一篇日志: 在Blueidea中对网友关于网页标准的疑虑的解答" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=91" title="下一篇日志: 我的第一个Ajax程序" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/2.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=17" title="查看所有生活杂谈的日志">生活杂谈</a></strong> <a href="feed.asp?cateID=17" target="_blank" title="订阅所有生活杂谈的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有生活杂谈的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>郁闷，动网论坛设置发送邮件，都用了两个小时</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-07-06</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					最近 bbs.mltr.cn 的spam越来越多，都是机器人自动注册+发贴发的。已经有一个多月了，以前试过封IP，可不知为什么spam的IP很多，导致有网友反映无法登陆论坛。无奈只好经常手动删除，还要删除垃圾用户，太麻烦了。为了根除这类现象，我只好把原来的自由注册换成接受密码邮件确认注册了（自动注册是收不到密码邮件的，自然无法登陆发贴），可试了好几次，根本收不到密码邮件……，主要就是不知smtp地址该如何设置，无奈空间商没有人在线，只好自己摸索，从smtp.mltr.cn、mail.mltr.cn到mltr.cn:8080都不成功。用foxmail发送也不成功，上bbs.dvbbs.net搜索，大都是用的免费邮箱简单的设置如smtp.21cn.com即可，还是未果，我想，免费邮箱可以用那我就换免费邮箱！申请了一个mltr.cn.webmaster@gmail.com，还是不行（我觉得也是，用foxmail发送gmail邮件都要进行多项设置，在asp里怎么能够填一个smtp地址就可以了呢）。正在我焦头烂额，不知如何是好之时，收件箱里竟然多出了一份来自admin@mltr.cn的欢迎邮件（mltr.cn的服务器上根本没有这个邮箱），一看此地址来自论坛基本设置的管理员邮箱（不好意思我竟然填个无效的邮箱在这，但愿没有网友有重要的邮件发到那个地址），再看一下此时的设置，smtp是空的……，下面的用户名、密码填的都是0（动网论坛的默认设置）。我晕……原来Jmail组件不需要Smtp服务器也可以发送任何发件人名的邮件的……在设置一下注册用户须接收密码邮件和欢迎邮件，搞定。<br/><br/>这个故事告诉我们，你想想越复杂的事情到头来可能非常简单。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=90&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(90)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 3 | <a href="trackback.asp?tbID=90&amp;action=view" target="_blank">引用: 1336</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
