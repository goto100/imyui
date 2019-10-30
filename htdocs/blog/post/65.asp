        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=64" title="上一篇日志: 新发现一个IE的Bug" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=66" title="下一篇日志: 玩转你的QQ" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>IIS建立多站点</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-02-01</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					一直都在用WindowsXP的IIS5，不能建立多站点，可用起来真不方便，于是在网上查了一查才知道，XP的IIS只能建立一个站点，于是换上了Windows2003，以为应该很容易了，可访问的时候还是不行，终于看到了这篇文章，才搞清楚。<br/><br/>如果想在一台主机上实现多个站点的访问,通常来讲有三种途径:<br/>1、改TCP端口<br/>2、加IP<br/>3、变主机头名<br/><br/>一、先来说说改端口法：以建立A，B两站点为例，打开IIS，把默认的站点改为A，设置好主目录后，在上面右键打开属性，点击web站点，地址为192.168.0.1,默认端口为80，<br/>再右键点击A站点，新建——站点，打开WEB站点创建向导，建立B站点，在再属性页把TCP端口改为8080，<br/><br/>Click to Open in New Window<br/><br/>这样局域网内用户就可以直接输入 ：<br/><br/>192.168.0.1 访问A站，<br/>192.168.0.1:8080 访问B站点，<br/><br/>多个站点依此类推8081、8082……<br/><br/>优点：建立方法简单，具有隐蔽性。<br/>缺点：访问繁琐，需键入端口号。<br/><br/>二、增加网卡IP<br/>给主机的网卡绑定多个IP，绑定方法点击开始/设置/网络和拨号连接/本地连接/属性，选择“Internet协议(TCP/IP)”，并点击“属性”按钮，在出现的“Internet协议(TCP/IP)属性”窗口中点击“高级”按钮，IP设置，点击“添加”按钮，增加一个IP地址，如图所示。<br/><br/>Click to Open in New Window<br/><br/>我们分别给A，B两站分配不同的IP就OK了，客户端直接通过IP地址进行访问。<br/><br/>优点：设置简单。<br/>缺点：不如输入域名访问方便。<br/><br/>三、更改主机头名<br/>这种方法需要和DNS配合使用，当然如果你有申请国际域名话就好办了，假设A，B站点建立好后，右键点击A站点——属性——网站——高级——添加主机头，如果我们申请的域名为www.aaa.com，那就添加这个域名。<br/><br/>Click to Open in New Window<br/><br/>同理B也这样操作，再到域名管理那把主机A指向到你主机的IP即可，(两个域名都指向同一IP，但需要固定IP，如你没有域名，那你只有自己动手建立域名服务器了，说白了就是设置DNS，并且要在客户端的DNS里添加你的域名服务器地址)。<br/><br/>优点：易于访问。<br/>缺点：实现方法较为麻烦，如申请有域名则较易。<br/><br/>小结：如申请有域名，则用第三种方法，也只能用这种方法：），<br/>否则建议采用第二种或第三种，随便说一句如添加了主机头，则不能用IP地址访问了。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=65&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(65)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 0 | <a href="trackback.asp?tbID=65&amp;action=view" target="_blank">引用: 231</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
