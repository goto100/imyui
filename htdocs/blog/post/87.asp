        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=20" title="上一篇日志: 网页标准学习网站收集（6月23日更新）" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=88" title="下一篇日志: 一起来（i170.com）试用手记" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>ASP通过XMLDom在服务器端操作XML文件的主要方法和实现（转）</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-07-03</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					对于小数据量，xml文件在检索更新上于ACCESS有很多优势。<br/><br/>下面说一下创建，查询，修改等对xml操作的主要方法<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>'创建DOM对象<br/>set objDom=server.CreateObject(&quot;MicroSoft.XMLDom&quot;)<br/><br/>'取得xml数据<br/>'方法1 取得xml文件的xml数据<br/>objDom.load(&quot;c:\test.xml&quot;)<br/>'方法2 取得xml数据串的数据<br/>objDom.loadxml(&quot;&lt;people&gt;&lt;man name=&quot;sd&quot;/&gt;&lt;/people&gt;&quot;) <br/><br/>'创建一个节点对象<br/>Set Newnode=objDom.CreateElement(&quot;people&quot;)<br/>'给这个节点赴值<br/>Newnode.Text=&quot;人&quot;<br/>' 给这个节点添加属性<br/>Set NewAttribute=objDom.CreateNode(&quot;attribute&quot;,&quot;name&quot;,&quot;&quot;) <br/>NewAttribute.Text= &quot;张三&quot;<br/>Newnode.SetAttributeNode NewAttribute<br/>'给这个节点添加子节点<br/>Set NewnodeChild=objDom.CreateElement(&quot;address&quot;)<br/>Newnode.appendChild NewnodeChild<br/>'保存这个节点对象<br/>objDom.appendChild Newnode<br/>objDom.save(&quot;c:\test.xml&quot;)<br/><br/>'查找一个节点对象<br/>set objtofind=objdom.documentElement.SelectSingleNode(&quot;//people/man&quot;)<br/>'取出这个节点对象的 节点名，节点值，某个属性值，和全部的xml<br/>nodename=objtofind.nodename<br/>nodevalue=objtofind.text<br/>objtofind.GetAttributeNode(&quot;name&quot;).Nodevalue '属性名为name的属性值<br/><br/>'取出一个属性节点对象<br/>set objattrtofind=objdom.documentElement.SelectSingleNode(&quot;//people/man&quot;). GetAttributeNode(&quot;name&quot;)<br/>'取出这个节点的属性名，属性值<br/>nodeattrname=objattrtofind.nodename<br/>nodeattrvalue=objattrtofind.nodevalue<br/><br/>'删除一个节点对象<br/>set objnode=objdom.documentElement.SelectSingleNode(&quot;//people/man&quot;) '要删除的节点<br/>set objparentnode=objdom.documentElement.SelectSingleNode(&quot;//people&quot;) '要删除的节点的父节点<br/>objparentnode.removeChild objnode<br/><br/>'取出一个节点的字节点集合<br/>set objnodes=objdom.documentElement.SelectSingleNode(&quot;//people/man&quot;).ChildNodes<br/>'遍历这个集合<br/>'方法1 <br/>for each element in objnodes<br/>response.write element.nodename '字节点名<br/>response.write element.text '字节点值<br/>next<br/>'方法2<br/>domlength=objnodes.length<br/>for i = 0 to domlength-1<br/>response.write objnodes.childnodes(i).nodename '字节点名<br/>response.write objnodes.childnodes(i).text '字节点值<br/>next<br/><br/>'取出一个节点的属性集合<br/>set objnodes=objdom.documentElement.SelectSingleNode(&quot;//people/man&quot;).GetAttributeNode(&quot;name&quot;).attributes<br/>'遍历这个集合<br/>for each element in objnodes<br/>response.write element.nodename '属性名<br/>response.write element.nodevalue '属性值<br/>next</div></div><br/><br/>等能够熟练的运用xmldom对象来操作xml文件了，就可以享受xmlhttp对象来实现asp下的许多功能了。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=87&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(87)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 1 | <a href="trackback.asp?tbID=87&amp;action=view" target="_blank">引用: 2549</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
