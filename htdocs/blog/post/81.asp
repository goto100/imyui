        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=79" title="上一篇日志: 真是个不寻常的一天。" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=82" title="下一篇日志: podcast与反波" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>学习JScript的优秀参考——LBS^2 暨 LBS^2代码研究</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-05-04</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					JScript是一种非常强大的语言，与VBScript一样可以用来写ASP，但因其学习难度较高，很多人选择了VBScript，通过本人近期学习JScript，对Web编程又有了进一步的理解，有了JScript，你完全可以用另一种个合理的方式编写ASP。

JScript的突出一点就在于对对象的支持好于VBScript，其语法和使用方法类似于C++/Java，对有经验的程序员很容易上手。

网络上JScript的ASP资料远少于VBScript，在学习JScript的过程中就少了一些参考，近期发布的一个个人blog系统LBS^2即为JScript编写，代码规范，思想先进，是学习JScript优秀参考。

首先看到LBS2的程序文件，对于以前所见过的程序来说最大的区别就是没有include/inc文件夹，也许你会要问，那公用的函数文件放在哪儿呢，就在class文件夹内。lbs2对系统进行了很大程度的封装，大部分操作都在类(class)中，而对于与某一特定对象无关的函数则专门有一个functions类，虽然本人不觉得这样做有什么好处，也许作者有其他方面的考虑。本人更喜欢把类放在inc文件夹中，命名使用cls_的方式，这样就不必将公用function也做成一个类了。

class文件夹中有9个文件，article, cache, dbconn, functions, md5, sha1, ubbcode, upload, user。其中mdb与sha1是转换密码用的，看样子作者也是从别处借鉴的，所以本文不会涉及。upload也非作者的作品，在作者的这篇Blog中写道“文件上传的处理也遇到了问题, JScript 没有二进制的字符串处理函数(好想念 JDBC 的 getBinaryStream() 啊  ). 不得已, 只好用以前的 VB Class 代替.”因为是用VBScript编写的，本文也不涉及。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=81&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(81)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 0 | <a href="trackback.asp?tbID=81&amp;action=view" target="_blank">引用: 142</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
