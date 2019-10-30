        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=60" title="上一篇日志: 天津，2004年冬季没有雪……" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=61" title="下一篇日志: 个性化表单五技巧" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/12.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=22" title="查看所有资源分享的日志">资源分享</a></strong> <a href="feed.asp?cateID=22" target="_blank" title="订阅所有资源分享的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有资源分享的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>说做就做 PFW (Program of Fans Website 歌迷网站程序)</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-01-06</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					<strong>2005-01-03 始发</strong><br/>（部分内容是结合MLTR.Cn的情况定义的）<br/><br/><strong>updated 2005-01-06 16:30</strong> <br/>今天解决了一个问题，原来处于不同深度的目录可以include一个conn.asp连接数据库，只要conn.asp中用绝对路径即可（我看大多数程序把文件都放在一个目录，以为连接不上呢）。甚至还可以用磁盘目录，比如网站在服务器的d:\sever\mltrcn\文件夹下，可以使用磁盘路径。当然还可以连接到与www目录同级的database目录，这样可以防止数据库被下载。<br/><br/>为了避免以后网站与现在这个版本网站变化过大，决定把还是分出news\info\album\photo\music\download\shop文件夹，还可以解决show.asp过大的问题。<br/><br/>虽然也可以用生成htm文件的办法，而且还减少服务器资源占用，不过似乎难度太大，以后再说吧。<br/><br/>以后可能还会细化文件（毕竟栏目目录分开了，一个目录里就那么两个文件也不好，还不如把功能都分开用不同的文件）。不过似乎就和整站程序比较远了，但内容保证都在数据库里，似乎又可以叫整站程序？  <img src="images/smilies/icon_sweat.gif" border="0" style="margin:0px 0px -2px 0px" alt=""/> <br/><br/><strong>目录设计：</strong><br/><br/>固定目录：BBS、upload、resource、database（重要的资源等）<br/>活动目录：image、include、special、js、css（随着版本的升级内容会有较大变化）<br/>栏目目录：news、info、album、photo、music、download、shop<br/>临时目录：temp<br/><br/><strong>文件列表：</strong><br/><br/><u>基本文件：</u><br/><br/>index.htm 宣传页<br/>main.asp 首页<br/>about.asp 关于本站<br/>link.asp 友情链接<br/>copyright.asp 版权声明<br/>sitemap.asp 网站地图<br/><br/><u>连接与模板：</u><br/><br/>CONN.asp 连接数据库<br/>header.asp 网页头部<br/>footer.asp 网页尾部<br/><br/><u>各栏目文件：</u><br/><br/>新闻 news/<br/>news.asp?cate=special\1\2…… special是新闻下的专题栏目<br/>newsshow.asp?id=1\2……<br/>资料 info/<br/>info.asp?cate=history|act|member&id=1\2…… <br/>专辑 album/<br/>album.asp?cate=ep|album&id=1\2……|special&id=1\2……<br/>图片 photo/<br/>photo.asp?cate=wallpaper|portrait|member&id=1\2…… 这次照片分人了 若member没有id则显示全部，id=0为Misc<br/>photoshow.asp<br/>音乐 music/<br/>music.asp?cate=lyric|listen|flash<br/>musicshow.asp<br/>下载 download/<br/>download.asp?cate=mp3|mtv……<br/>购物 shop/<br/>shop.asp?cate=cd|other…… 购买CD、周边物品等<br/><br/><u>功能文件：</u><br/><br/><s>show.asp?pic=……|lyric=……&mode=……（整页or开小页）|listen=……&mode=……（整页or开小页）|flash=…… 查看的综合页面。这样看可能有点大，做的时候可能考虑分开</s><br/>register.asp 改动网的用<br/>login.asp 改动网的用，还能保证安全性（我这臭篓子要是自己做肯定漏洞百出）<br/>command.asp 处理评论的页面，也可查看所有评论<br/>guestbook.asp 因与网站结合，留言本有着一个文件够用了<br/><br/><strong>未完待续……</strong><br/><br/>以后还会有数据库设计、CSS分类设计等等……放假再说，抓紧复习考试中……
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=57&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(57)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 1 | <a href="trackback.asp?tbID=57&amp;action=view" target="_blank">引用: 745</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
