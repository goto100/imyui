        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=82" title="上一篇日志: podcast与反波" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=83" title="下一篇日志: JScript中的静态类与类成员" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>用JScript写ASP</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-05-16</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					<strong>5月16日更新，见后</strong><br/><br/>五一假期一个目标——学习使用JScript写ASP。<br/><br/>JScript和JavaScript是基本一样的，只不过微软管JavaScript叫做JScript。我认为JScript相对于VBScript的优点有：<br/><br/><ul><br/><li>语法接近于C/Java（至少比VB正规许多）；<br/></li><li>更好的面向对象；<br/></li><li>更多……<br/></li></ul><br/><br/>待我学习的更深入会了解得更多。<br/><br/>前一阵就在图书馆借了一本JavaSctipt的书，当时的目的是学习客户端的脚本，那本书上也没有提及JavaSctipt可以用在服务器端（1997年的书，当时还是Netscape横行），但其中的面向对象的内容让我受益匪浅（最开始学面向对象是上学期的C++，上课从来不听，最后突击过了，现在都忘了  <img src="images/smilies/icon_sweat.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> ），ASP的VBSctipt算是我第一个可以写出比较完整程序的语言，但是它的面向对象太差，所以对于面向对象的理解还是停留在非常初级的水平。<br/><br/>在学习过程中的经验等我会记录在Blog上，或许可以帮助更多的人。<br/><br/><strong>5月16日更新，举两个JS比VB好的例子：</strong><br/><br/>VBS中仅可定义一次变量，在用的非常多的for循环中，经常需要 i 这类的临时变量，而VBS的写法一般是这个样子的：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>Dim i<br/>For i=1 To n<br/>&nbsp;&nbsp;&nbsp;&nbsp;'.......<br/>&nbsp;&nbsp;&nbsp;&nbsp;i=i+1<br/>End For<br/></div></div><br/><br/>也许你觉得并不麻烦，可要命的是这个 i 不可被重新定义（除非在不同的过程中），当在同一过程中需要另一个for循环时，你需要使用另外一个变量，如 j ，或者 ii，当然你可以继续使用刚才的 i，只要重新指定一个值既可，但程序员往往会忘记刚才到底有没有出现过循环而继续使用刚才定义的 i，甚至日后修改程序将之前的循环和变量定义删掉了，那程序运行时就会提示变量未定义。<br/><br/>我知道最早的C语言就已经支持把变量定义在循环中，此变量仅在本循环中有效，而VBS竟然一直不支持这个人性化的方法。<br/><br/>在JS中就方便多了，以上情况统统不用考虑：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>for(var i; i&lt;n; i++) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;// ......<br/>}<br/></div></div><br/><br/>无论到了什么时候这段代码都不会出现问题。<br/><br/>第二个就是对命名数组的支持，JS支持这样的数组 arr[&quot;name&quot;] ，还可以使用对象的表示方法写成 arr.name ，非常方便。<br/><br/>JS创建数组也非常方便，类似这种方式 var arr = [&quot;1&quot;, &quot;2&quot;, &quot;3&quot;]; 取得数组元素个数只要 arr.length 既可。<br/><br/>创建命名数组也很方便 var arr = {&quot;name1&quot;: &quot;content1&quot;, &quot;name2&quot;: &quot;content2&quot;}
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=80&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(80)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 0 | <a href="trackback.asp?tbID=80&amp;action=view" target="_blank">引用: 1213</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
