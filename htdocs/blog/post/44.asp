        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=43" title="上一篇日志: 圣诞节期间网络流行的一个东东——自制个性金条" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=45" title="下一篇日志: 在线视频: 游客用DV记录海啸全程!" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>meta标签的常见功能</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2004-12-28</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					meta标签的常见功能： <br/>１、帮助主页被各大搜索引擎登录 <br/>２、定义页面的使用语言 <br/>３、自动刷新并指向新的页面 <br/>４、实现网页转换时的动画效果 <br/>５、网页定级评价 <br/>６、控制页面缓冲 <br/>７、控制网页显示的窗口。 <br/>meta是用来在HTML文档中模拟HTTP协议的响应头报文。<br/>meta 的属性有两种：name和http-equiv。<br/>name属性主要用于描述网页，对应于content（网页内容），以便于搜索引擎机器人查找、分类（目前几乎所有的搜索引擎都使用网上机器人自动查找meta值来给网页分类）。这其中最重要的是description（站点在搜索引擎上的描述）和keywords（分类关键词），所以应该给每页加一个meta值。<br/><br/>name 属性<br/>1、&lt;meta name=&quot;Generator&quot; contect=&quot;editplus&quot;&gt;用以说明生成工具（如Microsoft FrontPage 4.0）等；<br/>2、&lt;meta name=&quot;KEYWords&quot; contect=&quot;cnbruce,cnrose&quot;&gt;向搜索引擎说明你的网页的关键词；<br/>3、&lt;meta name=&quot;Description&quot; contect=&quot;cnbruce's blog&quot;&gt;告诉搜索引擎你的站点的主要内容；<br/>4、&lt;meta name=&quot;Author&quot; contect=&quot;cnbruce&quot;&gt;告诉搜索引擎你的站点的制作的作者；<br/>5、&lt;meta name=&quot;Robots&quot; contect=&quot;all|none|index|noindex|follow|nofollow&quot;&gt;<br/>其中的属性说明如下：<br/>设定为all：文件将被检索，且页面上的链接可以被查询；<br/>设定为none：文件将不被检索，且页面上的链接不可以被查询；<br/>设定为index：文件将被检索；<br/>设定为follow：页面上的链接可以被查询；<br/>设定为noindex：文件将不被检索，但页面上的链接可以被查询；<br/>设定为nofollow：文件将不被检索，页面上的链接可以被查询。<br/><br/>http-equiv属性<br/>1、&lt;meta http-equiv=&quot;Content-Type&quot; contect=&quot;text/html&quot;;charset=gb_2312-80&quot;&gt;和 &lt;meta http-equiv=&quot;Content-Language&quot; contect=&quot;zh-CN&quot;&gt;用以说明主页制作所使用的文字以及语言；又如英文是ISO-8859-1字符集，还有BIG5、utf-8、shift-Jis、Euc、Koi8-2等字符集；<br/>2、&lt;meta http-equiv=&quot;Refresh&quot; content=&quot;n; url=http://yourlink&quot;&gt; 定时让网页在指定的时间n秒内，跳转到页面http;//yourlink；<br/>3、&lt;meta http-equiv=&quot;Expires&quot; contect=&quot;Mon,12 May 2001 00:20:00 GMT&quot;&gt;可以用于设定网页的到期时间，一旦过期则必须到服务器上重新调用。需要注意的是必须使用GMT时间格式；<br/>4、&lt;meta http-equiv=&quot;Pragma&quot; contect=&quot;no-cache&quot;&gt;是用于设定禁止浏览器从本地机的缓存中调阅页面内容，设定后一旦离开网页就无法从Cache中再调出；<br/>5、&lt;meta http-equiv=&quot;set-cookie&quot; contect=&quot;Mon,12 May 2004 00:20:00 GMT&quot;&gt;cookie设定，如果网页过期，存盘的cookie将被删除。需要注意的也是必须使用GMT时间格式；<br/>6、&lt;meta http-equiv=&quot;Pics-label&quot; contect=&quot;&quot;&gt;网页等级评定，在IE的internet选项中有一项内容设置，可以防止浏览一些受限制的网站，而网站的限制级别就是通过meta属性来设置的； <br/>7、&lt;meta http-equiv=&quot;windows-Target&quot; contect=&quot;_top&quot;&gt;强制页面在当前窗口中以独立页面显示，可以防止自己的网页被别人当作一个frame页调用； <br/>8、&lt;meta http-equiv=&quot;Page-Enter&quot; contect=&quot;revealTrans(duration=10,transtion= 50)&quot;&gt;和&lt;meta http-equiv=&quot;Page-Exit&quot; contect=&quot;revealTrans(duration=20，transtion=6)&quot;&gt;设定进入和离开页面时的特殊效果，这个功能即FrontPage中的“格式/网页过渡”，不过所加的页面不能够是一个frame页面。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=44&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(44)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 1 | <a href="trackback.asp?tbID=44&amp;action=view" target="_blank">引用: 286</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
