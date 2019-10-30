﻿        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=70" title="上一篇日志: 正则表达式 教程" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=72" title="下一篇日志: 什么才是提高ASP性能的最佳选择（二）" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>什么才是提高ASP性能的最佳选择（一）</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-02-22</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					ASP开发人员为了在他们的设计项目中获得更好的性能和可扩展性而不断努力。幸运地是，有许多书籍和站点在这方面提供了很好的建议。但是这些建议的基础都是从ASP平台工作的结构上所得出的结论，对实际获得的性能的提高没有量的测量。由于这些建议需要更加复杂的编码过程并降低了编码的可读性，开发人员就只能在看不到实际运行效果的情况下，独自衡量为了提高他们ASP应用程序的性能是否值得付出这些代价。 <br/>　　本文分为两大部分，我将介绍一些性能测试结果，帮助开发人员来确定某一特定举措是否不仅对将来的项目来说是值得的，并且能够对原来的项目进行更新。在第一部分我将回顾一些ASP开发的基础性问题。在第二部分，将涉及一些最优化ADO函数，并将它们的结果与调用VB COM对象执行相同ADO函数的ASP页面进行比较。这些结果很让人开眼界，甚至有些时候是很令人吃惊的。 <br/>　　在本文中，我们将回答以下问题： <br/>　　* 将ASP生成的内容写入响应流中最有效的方法是什么？ <br/>　　* 是否应该开启缓冲器？ <br/>　　* 是否应该考虑向ASP代码中增加注释？ <br/>　　* 是否应该为页面明确地设置默认语言？ <br/>　　* 如果不需要，是否应该关闭Session 状态？ <br/>　　* 是否应该把脚本逻辑放在子程序和函数区中？ <br/>　　* 使用包含文件有什么影响？ <br/>　　* 执行错误处理时会施加什么样的负载？ <br/>　　* 设置一个上下文处理是否对性能有影响？ <br/>所有测试都是用Microsoft的Web应用程序重点工具(WAST)来进行的，这是一个免费的工具，可以在这里找到。我用WAST创建了一个简单的test 脚本，反复调用下面所描述的ASP页面测试（每个超过70，000次）。反应的时间基于平均最后字节总时间(TTLB), 也就是从最初请求的时间到工具从服务器接收最后一位数据的时间。我们的测试服务器是一个Pentium 166，内存为196MB，客户机为Pentium 450，内存为256MB。你也许会想这些机器的性能并不算很高级，但是不要忘了，我们并不是要测试服务器的容量，我们只是要测试服务器每次处理一个页面所用的时间。测试期间这些机器不做其它工作。WAST 测试脚本、测试报告以及所有的ASP测试页面都包含在ZIP文件中，你可以自己进行回顾和测试。 <br/>将ASP生成的内容写入响应流中最有效的方法是什么？ <br/>　　使用ASP的一个最主要原因是在服务器上生成动态内容。所以很明显，我们测试的起点是确定将动态内容发送到响应流中的最适合的方式。在多种选择中，有两个是最基本的：一是使用内联ASP标记，另一个是使用Response.Write 语句。 <br/>　　为测试这些选择，我们创建了一个简单的ASP页面，其中定义了一些变量，然后将它们的值插入表格中。虽然这个页面很简单也不是很实用，但它允许我们分离并测试一些单独的问题。 <br/>　　使用ASP内联标记 <br/>　　第一个测试包括使用内联ASP标记&lt; %= x % &gt;，其中x是一个已赋值的变量。到目前为止，这个方法是最容易执行的，并且它使页面的HTML部分保持一种易于阅读和维护的格式。 <br/>　　&lt; % OPTION EXPLICIT <br/>　　Dim FirstName <br/>　　Dim LastName <br/>　　Dim MiddleInitial <br/>　　Dim Address <br/>　　Dim City <br/>　　Dim State <br/>　　Dim PhoneNumber <br/>　　Dim FaxNumber <br/>　　Dim EMail <br/>　　Dim BirthDate <br/>　　FirstName = &quot;John&quot; <br/>　　MiddleInitial = &quot;Q&quot; <br/>　　LastName = &quot;Public&quot; <br/>　　Address = &quot;100 Main Street&quot; <br/>　　City = &quot;New York&quot; <br/>　　State = &quot;NY&quot; <br/>　　PhoneNumber = &quot;1-212-555-1234&quot; <br/>　　FaxNumber = &quot;1-212-555-1234&quot; <br/>　　EMail = &quot;john@public.com&quot; <br/>　　BirthDate = &quot;1/1/1950&quot; <br/>　　% &gt; <br/>　　&lt; HTML &gt; <br/>　　&lt; HEAD &gt; <br/>　　&lt; TITLE &gt;Response Test&lt; / TITLE &gt; <br/>　　&lt; /HEAD &gt; <br/>　　&lt; BODY &gt; <br/>　　&lt; H1 &gt;Response Test&lt; /H1 &gt; <br/>　　&lt; TABLE &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;First Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= FirstName % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Middle Initial:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= MiddleInitial % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Last Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= LastName % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Address:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= Address % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;City:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= City % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;State:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= State % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Phone Number:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= PhoneNumber % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Fax Number:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= FaxNumber % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;EMail:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= EMail % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; tr &gt;&lt; td &gt;&lt; b &gt;Birth Date:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&lt; %= BirthDate % &gt;&lt; /td &gt;&lt; /tr &gt; <br/>　　&lt; /TABLE &gt; <br/>　　&lt; /BODY &gt; <br/>　　&lt; /HTML &gt; <br/>　　/app1/response1.asp的完整代码 <br/>　　以前的最佳（反应速度） = 8.28 msec/page <br/>　　在HTML的每一行使用Response.Write 语句 <br/>　　许多比较好的学习文档建议避免使用前面的那种方法。其主要理由是，在输出页面和处理页面施加反应时间的过程中，如果web 服务器不得不在发送纯HTML和处理脚本之间进行转换，就会发生一种被称为上下文转换的问题。大部分程序员一听到这里，他们的第一反应就是将原始的HTML的每一行都包装在Response.Write函数中。 <br/>　　… <br/>　　Response.Write(&quot;&lt; html &gt;&quot;) <br/>　　Response.Write(&quot;&lt; head &gt;&quot;) <br/>　　Response.Write(&quot; &lt; title &gt;Response Test&lt; /title &gt;&quot;) <br/>　　Response.Write(&quot;&lt; /head &gt;&quot;) <br/>　　Response.Write(&quot;&lt; body &gt;&quot;) <br/>　　Response.Write(&quot;&lt; h1 &gt;Response Test&lt; /h1 &gt;&quot;) <br/>　　Response.Write(&quot;&lt; table &gt;&quot;) <br/>　　Response.Write(&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;First Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & FirstName & &quot;&lt; /td &gt;&lt; /tr &gt;&quot;) <br/>　　Response.Write(&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;Middle Initial:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & MiddleInitial & &quot;&lt; /td &gt;&lt; /tr &gt;&quot;) <br/>　　… <br/>　　/app1/response2.asp的片段 <br/>　　以前的最佳（反应速度） = 8.28 msec/page <br/>　　反应时间 = 8.08 msec/page <br/>　　差= -0.20 msec (减少 2.4%) <br/>　　我们可以看到，使用这种方法与使用内联标记的方法相比在性能上获得的收益非常小，这也许是因为页面给服务器装载了一大堆小的函数调用。这种方法最大的缺点是，由于现在HTML都嵌入脚本中，所以脚本代码变得更加冗长，更加难以阅读和维护。 <br/>　　使用包装函数 <br/>　　当我们试图使用Response.Write 语句这种方法时，最令人灰心的发现可能就是Response.Write 函数不能在每行的结尾处放置一个CRLF 。因此，当你从浏览器中阅读源代码时，本来布置得非常好的HTML，现在成了没有结束的一行。我想，你的下一个发现可能会更令你恐怖：在Response 对象中没有其姊妹函数Writeln 。所以，一个很明显的反应就是为Response.Write 函数创建一个包装函数，以便给每一行都附加一个CRLF 。 <br/>　　… <br/>　　writeCR(&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;First Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & FirstName & &quot;&lt; /td &gt;&lt; /tr &gt;&quot;) <br/>　　… <br/>　　SUB writeCR(str) <br/>　　Response.Write(str & vbCRLF) <br/>　　END SUB <br/>　　/app1/response4.asp的片段 <br/>　　以前的最佳（反应速度）= 8.08 msec/page <br/>　　反应时间= 10.11 msec/page <br/>　　差 = +2.03 msec (增加 25.1%) <br/>　　当然，由于这种方法有效地使函数调用次数加倍，其对性能的影响也很明显，因此要不惜一切代价避免。具有讽刺意味的是CRLF也向反应流中为每行增加了2个字节，而这是浏览器不需要呈现到页面上的。格式化良好的HTML所做的一切就是让你的竞争者更容易阅读你的HTML源代码并理解你的设计。 <br/>　　将连续的Response.Write 连接到一个单独语句中 <br/>　　不考虑我们前面用包装函数进行的测试，下一个合乎逻辑的步骤就是从单独的Response.Write 语句中提取出所有的字符串，将它们连接到一个单独语句中，这样就减少了函数调用的次数，极大地提高了页面的性能。 <br/>　　… <br/>　　Response.Write(&quot;&lt; html &gt;&quot; & _ <br/>　　&quot;&lt; head &gt;&quot; & _ <br/>　　&quot;&lt; title &gt;Response Test&lt; /title &gt;&quot; & _ <br/>　　&quot;&lt; /head &gt;&quot; & _ <br/>　　&quot;&lt; body &gt;&quot; & _ <br/>　　&quot;&lt; h1 &gt;Response Test&lt; /h1 &gt;&quot; & _ <br/>　　&quot;&lt; table &gt;&quot; & _ <br/>　　&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;First Name:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & FirstName & &quot;&lt; /td &gt;&lt; /tr &gt;&quot; & _ <br/>　　… <br/>　　&quot;&lt; tr &gt;&lt; td &gt;&lt; b &gt;Birth Date:&lt; /b &gt;&lt; /td &gt;&lt; td &gt;&quot; & BirthDate & &quot;&lt; /td &gt;&lt; /tr &gt;&quot; & _ <br/>　　&quot;&lt; /table &gt;&quot; & _ <br/>　　&quot;&lt; /body &gt;&quot; & _ <br/>　　&quot;&lt; /html &gt;&quot;) <br/>　　/app1/response3.asp的片段 <br/>　　以前的最佳（反应速度）= 8.08 msec/page <br/>　　反应时间 = 7.05 msec/page <br/>　　差 = -1.03 msec (减少12.7%) <br/>　　目前，这是最优化的配置。 <br/>　　将连续的Response.Write 连接到一个单独语句中，在每行结尾处增加一个CRLF <br/>　　考虑到那些要求他们的源代码从浏览器中看要很纯粹的人，我用vbCRLF 常量在前面测试中每行的结尾处插入了一些回车，然后重新运行。　　 <br/>　　… <br/>　　Response.Write(&quot;&lt; html &gt;&quot; & vbCRLF & _ <br/>　　&quot;&lt; head &gt;&quot; & vbCRLF & _ <br/>　　&quot; &lt; title &gt;Response Test&lt; /title &gt;&quot; & vbCRLF & _ <br/>　　&quot;&lt; /head &gt;&quot; & vbCRLF & _ <br/>　　… <br/>　　/app1/response5.asp的片段 <br/>　　前面的最佳（反应速度）= 7.05 msec/page <br/>　　反应时间= 7.63 msec/page <br/>　　差 = +0.58 msec (增加 8.5%) <br/>　　运行的结果在性能上有一点降低，这也许是由于额外的串联和增加的字符量。 <br/>　　回顾和观测 <br/>　　从前面有关ASP输出的测试中可以得出一些规则： <br/>　　* 避免内联ASP的过多使用。 <br/>　　* 总是将连续Response.Write 语句连接进一个单独语句内。 <br/>　　* 永远不要在Response.Write 周围使用包装函数来附加CRLF。 <br/>　　* 如果必须格式化HTML输出，直接在Response.Write 语句内附加CRLF。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=71&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(71)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 72 | <a href="trackback.asp?tbID=71&amp;action=view" target="_blank">引用: 275</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
