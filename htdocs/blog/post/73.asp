        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=72" title="上一篇日志: 什么才是提高ASP性能的最佳选择（二）" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=74" title="下一篇日志: 问题" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>什么才是提高ASP性能的最佳选择（三）</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-02-22</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					结论 <br/>　　本文第一部分的重要之处在于许多小事情的累积。为了强调这个问题，我设置了最后一个测试，在其中进行了我们以前曾经测试过的看来无所谓但实际上有坏影响的所有操作。我包含了许多Response.Write 声明、关闭了缓冲器、设置了默认语言、去掉了Option Explicit 引用并初始化了错误句柄。 <br/><br/>　　&lt; %@ LANGUAGE=VBSCRIPT % &gt; <br/><br/>　　&lt; % <br/><br/>　　On Error Resume Next <br/><br/>　　FirstName = &quot;John&quot; <br/><br/>　　… <br/><br/>　　BirthDate = &quot;1/1/1950&quot; <br/><br/>　　Response.Write(&quot;&lt; html &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; head &gt;&quot;) <br/><br/>　　Response.Write(&quot; &lt; title &gt;Response Test&lt; /title &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; /head &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; body &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; h1 &gt;Response Test&lt; /h1 &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; table &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;First Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & FirstName & &quot;&lt; /td &gt;&lt; /tr &gt;&quot;) <br/><br/>　　… <br/><br/>　　Response.Write(&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;Birth Date:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & BirthDate & &quot;&lt; /td &gt;&lt; /tr &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; /table &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; /body &gt;&quot;) <br/><br/>　　Response.Write(&quot;&lt; /html &gt;&quot;) <br/><br/>　　% &gt; <br/><br/>　　/app2/final_1.asp片段 <br/><br/>　　基准值 = 5.57 msec/page <br/><br/>　　反应时间 = 8.85 msec/page <br/><br/>　　差 = +3.28 msec (58.9% 增加) <br/><br/>　　听起来可能很明显，但是理解更重要，那就是我们放置在页面上的代码会对性能有影响。页面上的小变化有时会大大地增加反应时间。 <br/><br/>规则概括 <br/><strong>　　* 避免内联ASP的过多使用。 <br/><br/>　　* 总是将连续Response.Write 语句连接进一个单独语句内。 <br/><br/>　　* 永远不要在Response.Write 周围使用包装函数以附加CRLF。 <br/><br/>　　* 如果必须格式化HTML输出，直接在Response.Write 语句内附加CRLF。 <br/><br/>　　* 总是通过服务器设置开启缓冲器。 <br/><br/>　　* 只要使用适度，ASP注释对性能的影响很小或根本没有影响。 <br/><br/>　　* 设置服务器的默认语言配置以与站点上使用的语言相匹配。 <br/><br/>　　* 除非你使用非默认语言，不要设置语言声明。 <br/><br/>　　* 在VBScript中总是使用Option explicit 。 <br/><br/>　　* 在不需要的情况下，总是在页面或应用程序的水平上关闭Session状态。 <br/><br/>　　* 只有当代码在页面之间共享时才使用Include 文件。 <br/><br/>　　* 在一个页面上，如果代码要使用一次以上，就将代码封入函数区。 <br/><br/>　　* 适当时候，将变量声明移到函数范围内。 <br/><br/>　　* 只有会发生超出测试或控制能力之外的情况时才使用错误句柄。 <br/><br/>　　* 只有当两个或更多操作被作为一个单元执行时，才使用上下文处理。 <br/><br/>　　现在回顾一下，有许多问题可以作为普遍性的方针： <br/><br/>　　* 避免冗余--不要设置那些默认状态下已经设置的属性。 <br/><br/>　　* 限制函数调用的次数。 <br/><br/>　　* 缩小代码的范围。</strong>
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=73&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(73)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 82 | <a href="trackback.asp?tbID=73&amp;action=view" target="_blank">引用: 2059</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
