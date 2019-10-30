        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=54" title="上一篇日志: 圣诞老人不会来" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=56" title="下一篇日志: 今天抽空写了MLTR.Cn未来需要加入的功能" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>Web Standard 网页标准随记</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-01-03</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					昨天晚上经过两个小时的努力，终于把MLTR.Cn首页的Xhtml验证错误减少到4个（最多曾达到过120个  <img src="images/smilies/icon_sweat.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> ）由于没有时间了，那4个错误改日再查找解决方法。<br/><br/><strong>update:2005/01/03 20:30</strong><br/>MLTR.Cn的首页已经通过xhtml1.0的校验了。添加一条随记。<br/>今天第一次校验MLTR.Cn的CSS，发现竟然一次性全部通过，说明我书写CSS的习惯还是很好的嘛~  <img src="images/smilies/icon_lol.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> <br/>对于MLTR.Cn全部页面，我想我没有时间去每页都校验一遍了，等出了中文版的本地校验软件再说吧。<br/><br/><ul><br/><li>所有标签小写，而页面第一行<br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;<a href="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" target="_blank">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd</a>&quot;&gt;</div></div><br/>则要大写<br/></li><li>&lt;script&gt;要有type属性<br/></li><li>在新页面中打开链接为target=&quot;new&quot;，不是以前的target=&quot;_blank&quot;了<br/></li><li>&lt;ul&gt;、&lt;ol&gt;标签与其中的&lt;li&gt;标签之间不能有内容<br/></li><li>&lt;form&gt;...&lt;form/&gt;而&lt;option... /&gt;<br/></li><li>链接中的&quot;&&quot;要写成&quot;&&quot;不含引号<br/></li><li>所有属性加引号 且 必须有值 如：<div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">valued=&quot;valued&quot; &lt;hr noshde=&quot;noshade&quot;&gt;</div></div><br/><br/>这里需要注意的是，不懂JavaScript或偷懒的人可能从网上down了一段代码就添加到网页里了，我就是down了一段“设为首页”的代码<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>&lt;a onClick=&quot;this.style.behavior='url(#default#homepage)';this.setHomePage('<a href="http://www.mltr.cn/" target="_blank">http://www.mltr.cn/</a>');return false;&quot; <br/>href=&quot;#&quot;&gt;设为首页<br/>&lt;/a&gt;<br/></div></div><br/>结果通不过验证，搞了老半天，原来是<br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent">&lt;a onClick=&quot;this……</div></div><br/>这个属性大写了一个字母C </li> <img src="images/smilies/icon_sweat.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> <br/>希望大家引以为戒……不要犯和我同样的低级错误  <img src="images/smilies/icon_sweat.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> <br/></ul>
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=55&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(55)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 7 | <a href="trackback.asp?tbID=55&amp;action=view" target="_blank">引用: 581</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
