<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="news"
CateRoot="news"
Cate="special"
Dim SpecialCate(6), SpecialCateId
SpecialCateId=Request.QueryString("cate")
If SpecialCateId=Empty Then SpecialCateId=1 End If
SpecialCate(1)="来华简介"
SpecialCate(2)="北京之行"
SpecialCate(3)="活动准备"
SpecialCate(4)="活动现场"
SpecialCate(5)="收获"
SpecialCate(6)="相关"
title=SpecialCate(SpecialCateId)
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
<%
If SpecialCateId=1 Then
%>
	<p class="msg">请从右边选取本专题子栏目。</p>
	<img src="../resources/news/special/200407/200407.jpg" alt="专题 - MLTR2004年7月中国之行" />
	<p>Michael Learns To Rock于2001年11月在上海奥林匹克体育馆举行了声势浩大的亚洲巡回演唱会之中国上海演唱会。在一片熟悉而动人的歌声中，“迈克学摇滚”彻底引发了上海歌迷的热情和狂热，万人体育馆内一片沸腾。事隔3年后的7月，迈克学摇滚再次造访中国，携带着他们的新专辑，为阔别三年的中国歌迷带来了他们久违的歌声。</p>
	<p>MLTR此次行程为期6天，由于北京之行只是一个颁奖典礼，活动较少，本站并没有亲临现场，但也搜集了众多新闻让大家了解MLTR的北京之行。本站为了报道这次来华，两位站长18日便前往上海，为MLTR的上海之行做准备，这也是本站成立以来最大的一次活动，也为以后类似活动的组织积累了不少经验。这次活动得到了上海部分歌迷的热心帮助，以及上海东方广播电台的大力支持，在此感谢他们。</p>
	<p>7月22日，MLTR乘飞机抵达北京，7月24日上午，MLTR接受网易(<a href="http://www.163.com/">www.163.com</a>)专访，在网易聊天室中与网友对话。7月24日晚，MLTR参加了在北京奥林匹克体育馆举行的第6届CCTV-MTV音乐盛典，被评为“国际年度最佳组合”，并在晚会上唱了一首Take Me To Your Heart。</p>
	<p>结束了北京之行，7月25日一早MLTR便匆匆忙忙乘飞机到达上海，为26日晚上的歌迷见面会做准备。</p>
	<p>7月26日下午6时30分，由东广音乐“动感101”主办, 百代唱片/上海步升音乐文化传播有限公司协办，MLTR参加了在位于上海淮海中路283号香港广场南座四楼的Rojam Disco举办的“夏日人气偶像总动员”五周年开幕式盛典(暨迈克学摇滚上海歌迷见面会)，带着他们最新鲜的音乐礼物再次来到上海歌迷的面前,将他们的真心放在歌迷的手心。他们在现场被授予东广音乐动感101的”动感之星”荣誉称号,并同其他提名艺人,包括莎拉布莱曼,C21,玛利亚凯利等共同角逐“夏日人气偶像总动员”之“最佳访沪艺人”评选。百代唱片颁发给迈克学摇滚金唱片销量奖。同时,特邀当红艺人胡彦彬作为嘉宾出场，与MLTR同唱Take Me To Your Heart。本站站长Ryan也上台介绍了网站情况，并与歌迷做了互动。歌迷见面会结束后,MLTR还在现场为广大歌迷签售最新专辑，于当晚11点离开现场。</p>
	<p>7月27日，MLTR带着中国歌迷的礼物，乘飞机离开了上海，结束了此次中国之行。但他们今年的中国之行并没有结束，今年10月份，他们有望再次来华举办演唱会，这次Michael Learns To Rock的来华，也名副其实的成为了10月中国演唱会的预演。</p>
<%
ElseIf SpecialCateId=2 Then
%>
	<div class="note">相关资源请访问“<a href="showspecial.asp?id=1&cateid=6">相关</a>”页面，包括访谈、视频</div>
	<p>2004年7月22日上午11：50，来自丹麦首都哥本哈根的sk995号航班缓缓降落在北京首都机场，MLTR第四次中国之行正式拉开帷幕。</p>
	<p>经过1天的休息，7月24日上午，MLTR来到网易北京总部做客，现场与网上网友聊天，在聊天中，他们提到他们将唱歌到80岁，虽然有一些玩笑的成分在里面，但也体现了他们的团结和对音乐的执着，MLTR在专访中还回答了网友的众多问题，现场气氛非常轻松和谐。</p>
	<p>7月24日下午，MLTR在酒店又接受了媒体的专访。24日晚7：30，MLTR参加了在能容纳5000人的北京奥林匹克体育馆举行的第6届CCTV-MTV音乐盛典，被评为“国际年度最佳组合”，并在晚会上唱了一首由他们重新填词和配器，在中国经久不衰来自天王张学友的经典歌曲《吻别》的翻唱版本《Take Me To Your Heart》。来自于MLTR.dk的现场演唱图片：</p>
	<p><img src="../resources/news/special/200407/mtv_2004.jpg" alt="现场图片" /></p>
<%
ElseIf SpecialCateId=3 Then
%>
	<div class="note">点击“<a href="showspecial.asp?id=1&cateid=5">收获</a>”观看MLTR签过名的物品</div>
	<p>MLTR中文站联合YUMMY、CHILD，为Michael Learns To Rock精心准备了三套极具中国特色的茶具，陶瓷，蓝色底，白色雕龙(看起来像皇帝御用)。同时，YUMMY要登台献艺，不得不苦练茶道表演。<img src="../resources/news/special/200407/bottle.jpg" alt="我们赠送给MLTR的茶壶" /></p>
	<p>印制了MLTR中文站的T-Shirt，作为签名留念使用。图案为临时设计，不过效果还算不错。遗憾的是最后只签到了1件T-Shirt。</p>
	<p>订做了演出现场使用的横幅，“MICHAEL,TAKE US TO YOUR HEART”，以此欢迎Michael Learns To Rock的到来，也拉近了Michael Learns To Rock与歌迷之间心的距离。在现场,Mikkel, Jascha和Kaare还看着横幅开心地笑了，Jascha也竖起了大拇指。</p>
	<p>订做了以MLTR中文站欢迎页为图案的相框，作为Michael Learns To Rock乐队成员为网站题词使用</p>
<%
ElseIf SpecialCateId=4 Then
%>
<h3>场外歌迷和售CD</h3>
<div class="note">当日下午3点多就有歌迷到达现场，在门口等候。</div>
<table class="style1"><tr>
	<td><a href="../resources/news/special/200407/200407001.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407001.jpg" alt="点击看大图" />Rojam门口的海报</a></td>
	<td><a href="../resources/news/special/200407/200407002.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407002.jpg" alt="点击看大图" />早去的歌迷在门口排队购买CD</a></td>
	<td><a href="../resources/news/special/200407/200407003.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407003.jpg" alt="点击看大图" />购买CD赠送海报</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407004.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407004.jpg" alt="点击看大图" />这么多CD……</a></td>

	<td><a href="../resources/news/special/200407/200407005.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407005.jpg" alt="点击看大图" />Rojam大门口</a></td></tr></table>

<h3>彩排现场</h3>
<div class="note">下午4点多，MLTR到达现场，开始彩排。由于怕打扰他们彩排，拍照片时大多照片没有开闪光灯，导致比较模糊。</div>
<table class="style1"><tr>
	<td><a href="../resources/news/special/200407/200407006.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407006.jpg" alt="点击看大图" />彩排准备</a></td>
	<td><a href="../resources/news/special/200407/200407007.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407007.jpg" alt="点击看大图" />我们在现场悬挂的横幅:Michael, Take Us To Your Heart</a></td>
	<td><a href="../resources/news/special/200407/200407008.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407008.jpg" alt="点击看大图" />彩排准备</a></td></tr><tr>

	<td><a href="../resources/news/special/200407/200407009.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407009.jpg" alt="点击看大图" />彩排准备</a></td>
	<td><a href="../resources/news/special/200407/200407010.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407010.jpg" alt="点击看大图" />彩排准备</a></td>
	<td><a href="../resources/news/special/200407/200407011.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407011.jpg" alt="点击看大图" />Jascha调试乐器</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407012.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407012.jpg" alt="点击看大图" />Mikkle笑一个</a></td>
	<td><a href="../resources/news/special/200407/200407013.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407013.jpg" alt="点击看大图" />Mikkle</a></td>
	<td><a href="../resources/news/special/200407/200407014.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407014.jpg" alt="点击看大图" />Kaare</a></td>

	</tr><tr>
	<td><a href="../resources/news/special/200407/200407015.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407015.jpg" alt="点击看大图" />Kaare</a></td>
	<td><a href="../resources/news/special/200407/200407016.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407016.jpg" alt="点击看大图" />Mikkel</a></td>
	<td><a href="../resources/news/special/200407/200407017.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407017.jpg" alt="点击看大图" />Mikkel</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407018.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407018.jpg" alt="点击看大图" />Jascha</a></td>
	<td><a href="../resources/news/special/200407/200407019.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407019.jpg" alt="点击看大图" />Jascha</a></td>

	<td><a href="../resources/news/special/200407/200407020.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407020.jpg" alt="点击看大图" />Kaare</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407021.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407021.jpg" alt="点击看大图" />采访室</a></td>
	<td><a href="../resources/news/special/200407/200407022.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407022.jpg" alt="点击看大图" />Mikkel</a></td>
	<td><a href="../resources/news/special/200407/200407023.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407023.jpg" alt="点击看大图" />Kaare</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407024.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407024.jpg" alt="点击看大图" />彩排中</a></td>

	<td><a href="../resources/news/special/200407/200407025.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407025.jpg" alt="点击看大图" />彩排中</a></td>
	<td><a href="../resources/news/special/200407/200407026.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407026.jpg" alt="点击看大图" />彩排中</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407027.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407027.jpg" alt="点击看大图" />Jascha</a></td>
	<td><a href="../resources/news/special/200407/200407028.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407028.jpg" alt="点击看大图" />Jascha</a></td>
	<td><a href="../resources/news/special/200407/200407029.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407029.jpg" alt="点击看大图" />Jascha</a></td>

	</tr><tr>
	<td><a href="../resources/news/special/200407/200407030.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407030.jpg" alt="点击看大图" />Kaare</a></td>
	<td><a href="../resources/news/special/200407/200407031.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407031.jpg" alt="点击看大图" />彩排中</a></td>
	<td><a href="../resources/news/special/200407/200407032.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407032.jpg" alt="点击看大图" />Jascha</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407033.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407033.jpg" alt="点击看大图" />Kaare</a></td>
	<td><a href="../resources/news/special/200407/200407034.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407034.jpg" alt="点击看大图" />Mikkel</a></td>

	<td><a href="../resources/news/special/200407/200407035.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407035.jpg" alt="点击看大图" />Mikkel</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407036.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407036.jpg" alt="点击看大图" />Kaare</a></td>
	<td><a href="../resources/news/special/200407/200407037.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407037.jpg" alt="点击看大图" />Jascha在干什么？</a></td>
	<td><a href="../resources/news/special/200407/200407038.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407038.jpg" alt="点击看大图" />彩排中</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407039.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407039.jpg" alt="点击看大图" />彩排中</a></td>

	<td><a href="../resources/news/special/200407/200407040.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407040.jpg" alt="点击看大图" />Jascha背影</a></td>
	<td><a href="../resources/news/special/200407/200407041.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407041.jpg" alt="点击看大图" />和上一张对比一下</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407042.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407042.jpg" alt="点击看大图" />彩排中</a></td>
	<td><a href="../resources/news/special/200407/200407043.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407043.jpg" alt="点击看大图" />彩排中</a></td>
	<td><a href="../resources/news/special/200407/200407044.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407044.jpg" alt="点击看大图" />Jascha</a></td>

	</tr><tr>
	<td><a href="../resources/news/special/200407/200407045.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407045.jpg" alt="点击看大图" />一起商量事情，左上角为本站宣传横幅</a></td>
	<td><a href="../resources/news/special/200407/200407046.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407046.jpg" alt="点击看大图" />正在唱吻别</a></td>
	<td><a href="../resources/news/special/200407/200407047.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407047.jpg" alt="点击看大图" />胡彦斌出场</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407048.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407048.jpg" alt="点击看大图" />手中拿着歌词</a></td>
	<td><a href="../resources/news/special/200407/200407049.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407049.jpg" alt="点击看大图" />胡彦斌和MLTR同台演出</a></td>

	<td><a href="../resources/news/special/200407/200407050.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407050.jpg" alt="点击看大图" />胡彦斌</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407051.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407051.jpg" alt="点击看大图" />Mikkel</a></td>
	<td><a href="../resources/news/special/200407/200407052.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407052.jpg" alt="点击看大图" />Kaare</a></td>
	<td><a href="../resources/news/special/200407/200407053.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407053.jpg" alt="点击看大图" />Mikkel</a></td>
	</tr>
</table>

<h3>媒体发布会</h3>
<div class="note">晚上7点，媒体发布会与现场活动同时开始，头一个小时MLTR在上面接受采访，下面是歌迷活动。</div>
<table class="style1"><tr>
	<td><a href="../resources/news/special/200407/200407054.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407054.jpg" alt="点击看大图" />即将开始，有记者在等待</a></td>
	<td><a href="../resources/news/special/200407/200407055.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407055.jpg" alt="点击看大图" />媒体发布会</a></td>
	<td><a href="../resources/news/special/200407/200407056.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407056.jpg" alt="点击看大图" />看话筒很多吧！</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407057.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407057.jpg" alt="点击看大图" />Jascha回答提问</a></td>

	<td><a href="../resources/news/special/200407/200407058.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407058.jpg" alt="点击看大图" />媒体发布会</a></td>
	<td><a href="../resources/news/special/200407/200407059.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407059.jpg" alt="点击看大图" />媒体发布会</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407060.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407060.jpg" alt="点击看大图" />Jascha回答提问</a></td>
	<td><a href="../resources/news/special/200407/200407061.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407061.jpg" alt="点击看大图" />Mikkel回答提问</a></td>
	<td><a href="../resources/news/special/200407/200407062.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407062.jpg" alt="点击看大图" />Kaare回答提问</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407063.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407063.jpg" alt="点击看大图" />Jascha回答提问</a></td>

	<td><a href="../resources/news/special/200407/200407064.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407064.jpg" alt="点击看大图" />Kaare回答提问</a></td></tr></table>
<h3>活动现场</h3>
<div class="note">当日活动于晚上7点开始，由于现场比较拥挤，有一些照片没有照到，但也可以给大家带来现场最激烈的感受了。MLTR当天共演唱了6首歌曲：Sleeping Child, 25 Minutes, Take Me To Your Heart, That Is Why You Go Away, Paint My Love, Someday.
</div>
<table class="style1"><tr>
	<td><a href="../resources/news/special/200407/200407065.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407065.jpg" alt="点击看大图" />活动即将开始</a></td>
	<td><a href="../resources/news/special/200407/200407066.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407066.jpg" alt="点击看大图" />主持人张明</a></td>
	<td><a href="../resources/news/special/200407/200407067.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407067.jpg" alt="点击看大图" />相关人员</a></td></tr><tr>

	<td><a href="../resources/news/special/200407/200407068.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407068.jpg" alt="点击看大图" />现场人不少</a></td>
	<td><a href="../resources/news/special/200407/200407069.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407069.jpg" alt="点击看大图" />活动主持人</a></td>
	<td><a href="../resources/news/special/200407/200407070.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407070.jpg" alt="点击看大图" />现场</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407071.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407071.jpg" alt="点击看大图" />听声音猜编辑活动</a></td>
	<td><a href="../resources/news/special/200407/200407072.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407072.jpg" alt="点击看大图" />站长Ryan上台介绍网站</a></td>
	<td><a href="../resources/news/special/200407/200407073.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407073.jpg" alt="点击看大图" />Ryan介绍网站</a></td></tr><tr>

	<td><a href="../resources/news/special/200407/200407074.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407074.jpg" alt="点击看大图" />Ryan介绍网站</a></td>
	<td><a href="../resources/news/special/200407/200407075.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407075.jpg" alt="点击看大图" />Ryan介绍网站</a></td>
	<td><a href="../resources/news/special/200407/200407076.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407076.jpg" alt="点击看大图" />Ryan介绍网站</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407077.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407077.jpg" alt="点击看大图" />主持人介绍歌迷猜歌名活动</a></td>
	<td><a href="../resources/news/special/200407/200407078.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407078.jpg" alt="点击看大图" />Ryan点歌迷上台参加活动</a></td>
	<td><a href="../resources/news/special/200407/200407079.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407079.jpg" alt="点击看大图" />猜歌名的歌迷</a></td></tr><tr>

	<td><a href="../resources/news/special/200407/200407080.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407080.jpg" alt="点击看大图" />听主持人介绍规则</a></td>
	<td><a href="../resources/news/special/200407/200407081.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407081.jpg" alt="点击看大图" />认真听歌</a></td>
	<td><a href="../resources/news/special/200407/200407082.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407082.jpg" alt="点击看大图" />将歌名写在题板上</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407083.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407083.jpg" alt="点击看大图" />认真听歌</a></td>
	<td><a href="../resources/news/special/200407/200407084.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407084.jpg" alt="点击看大图" />由Ryan检查歌迷答题情况</a></td>
	<td><a href="../resources/news/special/200407/200407085.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407085.jpg" alt="点击看大图" />只有2名歌迷全部答对，获得正版CD一张</a></td></tr><tr>

	<td><a href="../resources/news/special/200407/200407086.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407086.jpg" alt="点击看大图" />主持人邀请下位嘉宾</a></td>
	<td><a href="../resources/news/special/200407/200407087.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407087.jpg" alt="点击看大图" />中间黑衣服的是工作人员，MLTR到达上海她一路跟随</a></td>
	<td><a href="../resources/news/special/200407/200407088.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407088.jpg" alt="点击看大图" />又一位歌迷嘉宾演唱Take Me To Your Heart</a></td>
	</tr><tr>
	<td><a href="../resources/news/special/200407/200407089.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407089.jpg" alt="点击看大图" />MLTR正式与歌迷见面</a></td>
	<td><a href="../resources/news/special/200407/200407090.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407090.jpg" alt="点击看大图" />MLTR在台上回答歌迷问题</a></td>

	<td><a href="../resources/news/special/200407/200407091.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407091.jpg" alt="点击看大图" />楼上有人提问</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407092.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407092.jpg" alt="点击看大图" />此时歌迷还是比较平静</a></td>
	<td><a href="../resources/news/special/200407/200407093.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407093.jpg" alt="点击看大图" />回答问题</a></td>
	<td><a href="../resources/news/special/200407/200407094.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407094.jpg" alt="点击看大图" />MLTR在台上</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407095.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407095.jpg" alt="点击看大图" />大屏幕放录像</a></td>
	<td><a href="../resources/news/special/200407/200407096.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407096.jpg" alt="点击看大图" />张明调动气氛</a></td>

	<td><a href="../resources/news/special/200407/200407097.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407097.jpg" alt="点击看大图" />MLTR开始演唱</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407098.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407098.jpg" alt="点击看大图" />MLTR正在演唱</a></td>
	<td><a href="../resources/news/special/200407/200407099.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407099.jpg" alt="点击看大图" />MLTR正在演唱</a></td>
	<td><a href="../resources/news/special/200407/200407100.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407100.jpg" alt="点击看大图" />MLTR正在演唱</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407101.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407101.jpg" alt="点击看大图" />MLTR正在演唱</a></td>
	<td><a href="../resources/news/special/200407/200407102.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407102.jpg" alt="点击看大图" />MLTR正在演唱</a></td>

	<td><a href="../resources/news/special/200407/200407103.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407103.jpg" alt="点击看大图" />MLTR正在演唱</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407104.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407104.jpg" alt="点击看大图" />MLTR正在演唱</a></td>
	<td><a href="../resources/news/special/200407/200407105.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407105.jpg" alt="点击看大图" />MLTR正在演唱</a></td>
	<td><a href="../resources/news/special/200407/200407106.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407106.jpg" alt="点击看大图" />MLTR正在演唱</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407107.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407107.jpg" alt="点击看大图" />即将颁发奖项</a></td>
	<td><a href="../resources/news/special/200407/200407108.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407108.jpg" alt="点击看大图" />MLTR荣获金唱片销量奖和“动感之星”称号</a></td>

	<td><a href="../resources/news/special/200407/200407109.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407109.jpg" alt="点击看大图" />获奖了很高兴</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407110.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407110.jpg" alt="点击看大图" />Yummy上台翻译茶道表演</a></td>
	<td><a href="../resources/news/special/200407/200407111.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407111.jpg" alt="点击看大图" />感谢“御品茶业”提供茶道表演</a></td>
	<td><a href="../resources/news/special/200407/200407112.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407112.jpg" alt="点击看大图" />茶人正在表演茶道</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407113.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407113.jpg" alt="点击看大图" />茶人正在表演茶道</a></td>
	<td><a href="../resources/news/special/200407/200407114.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407114.jpg" alt="点击看大图" />茶人正在表演茶道</a></td>

	<td><a href="../resources/news/special/200407/200407115.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407115.jpg" alt="点击看大图" />茶人正在表演茶道</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407116.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407116.jpg" alt="点击看大图" />茶人正在表演茶道</a></td>
	<td><a href="../resources/news/special/200407/200407117.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407117.jpg" alt="点击看大图" />茶人正在表演茶道</a></td>
	<td><a href="../resources/news/special/200407/200407118.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407118.jpg" alt="点击看大图" />茶人正在表演茶道</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407119.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407119.jpg" alt="点击看大图" />茶人正在表演茶道</a></td>
	<td><a href="../resources/news/special/200407/200407120.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407120.jpg" alt="点击看大图" />MLTR饮用茶人沏好的茶</a></td>

	<td><a href="../resources/news/special/200407/200407121.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407121.jpg" alt="点击看大图" />Kaare“照猫画虎”</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407122.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407122.jpg" alt="点击看大图" />看来泡的不怎么样，茶人在偷笑</a></td>
	<td><a href="../resources/news/special/200407/200407123.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407123.jpg" alt="点击看大图" />Kaare在泡茶</a></td>
	<td><a href="../resources/news/special/200407/200407124.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407124.jpg" alt="点击看大图" />Kaare在泡茶</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407125.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407125.jpg" alt="点击看大图" />Kaare在泡茶</a></td>
	<td><a href="../resources/news/special/200407/200407126.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407126.jpg" alt="点击看大图" />Kaare在泡茶</a></td>

	<td><a href="../resources/news/special/200407/200407127.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407127.jpg" alt="点击看大图" />泡好了</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407128.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407128.jpg" alt="点击看大图" />请Jascha喝</a></td>
	<td><a href="../resources/news/special/200407/200407129.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407129.jpg" alt="点击看大图" />茶道表演结束</a></td>
	<td><a href="../resources/news/special/200407/200407130.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407130.jpg" alt="点击看大图" />这张Jascha很帅</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407131.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407131.jpg" alt="点击看大图" />MLTR演唱吻别</a></td>
	<td><a href="../resources/news/special/200407/200407132.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407132.jpg" alt="点击看大图" />大家都在跟着唱</a></td>

	<td><a href="../resources/news/special/200407/200407133.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407133.jpg" alt="点击看大图" />大家都站着不断挥手</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407134.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407134.jpg" alt="点击看大图" />神秘嘉宾胡彦斌出场</a></td>
	<td><a href="../resources/news/special/200407/200407135.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407135.jpg" alt="点击看大图" />胡彦斌演唱吻别高潮部分</a></td>
	<td><a href="../resources/news/special/200407/200407136.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407136.jpg" alt="点击看大图" />现场灯光</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407137.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407137.jpg" alt="点击看大图" />胡彦斌演唱完毕</a></td>
	<td><a href="../resources/news/special/200407/200407138.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407138.jpg" alt="点击看大图" />张明提问，胡彦斌只上台约5分钟</a></td>

	<td><a href="../resources/news/special/200407/200407139.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407139.jpg" alt="点击看大图" />MLTR继续演唱</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407140.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407140.jpg" alt="点击看大图" />现场非常火爆</a></td>
	<td><a href="../resources/news/special/200407/200407141.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407141.jpg" alt="点击看大图" />已经没有歌迷坐着了</a></td>
	<td><a href="../resources/news/special/200407/200407142.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407142.jpg" alt="点击看大图" />电台为调动气氛也做出了不少努力-下雪</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407143.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407143.jpg" alt="点击看大图" />Jascha唱得也很激动</a></td>
	<td><a href="../resources/news/special/200407/200407144.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407144.jpg" alt="点击看大图" />全场大合唱</a></td>

	<td><a href="../resources/news/special/200407/200407145.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407145.jpg" alt="点击看大图" />激动的歌迷们</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407146.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407146.jpg" alt="点击看大图" />演唱结束</a></td>
	<td><a href="../resources/news/special/200407/200407147.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407147.jpg" alt="点击看大图" />电台准备的一张歌迷涂鸦赠送给MLTR，Kaare说会挂在卧室里</a></td>
	<td><a href="../resources/news/special/200407/200407148.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407148.jpg" alt="点击看大图" />涂鸦名字：Paint My Love</a></td></tr><tr>
	<td><a href="../resources/news/special/200407/200407149.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407149.jpg" alt="点击看大图" />演唱最后一首歌</a></td>
	<td><a href="../resources/news/special/200407/200407150.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407150.jpg" alt="点击看大图" />活动即将结束</a></td>

	<td><a href="../resources/news/special/200407/200407151.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407151.jpg" alt="点击看大图" />歌迷从台下递上来一张自制海报</a></td></tr>
	</table>
<h3>签名活动</h3>
<div class="note">活动9点钟结束后进行了签名售CD活动，由于签名活动比较混乱，所以没有拍到照片。</div>
<%
ElseIf SpecialCateId=5 Then
%>
<h3>本站总结</h3>
<p>本次活动，着实让大家看到了Michael Learns To Rock在中国的受欢迎程度，他们的到来，再次点燃了中国乐迷的热情，也掀起了Michael Learns To Rock的音乐热潮。</p>
<p>本次活动的成功举办，体现了上海歌迷对乐队的支持，以及良好的素质，Michael Learns To Rock也在活动结束后告诉我们，他们这次真的是很高兴，中国的歌迷感动了他们！</p>
<p>活动结束后，购买了MLTR新专辑的歌迷，都拿到了Mikkel,Jascha和Kaare的亲笔签名。Ryan也代表MLTR中文站以及所有中国歌迷，单独向Mikkel,Jascha和Kaare问好，Mikkel, Jascha很喜欢我们身穿印有新专辑封面和WWW.MLTR.CN图案的T体恤，并且主动要求签名。后来在和Kaare轻松的聊天中得知，他经常光临MLTR.Cn，他说虽然看不懂中文，但是还是会来经常逛逛，他觉得这是中国歌迷给MLTR的最好礼物。我们很高兴听到Kaare这样说，他也高兴地在T-Shirt正面和背面，顽皮地签了两个名字：）。Jascha在离开Rojam的时候，还热情的于YUMMY抱在一起，把YUMMY感动地……</p>
<p>Mikkel,Jascha和Kaare也在活动结束后，欣然为MLTR中文站签名并题词，按我们的请求，JASCHA题上了“All I need is someone who makes me wanna sing”，一句朴实的歌词，也同时是一句心情的表达。</p>
<h3>收获物品</h3>
<table class="style1"><tr>
<td><a href="../resources/news/special/200407/200407152.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407152.jpg" alt="点击看大图" />签名CD</a></td>
<td><a href="../resources/news/special/200407/200407153.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407153.jpg" alt="点击看大图" />签名CD</a></td>

<td><a href="../resources/news/special/200407/200407154.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407154.jpg" alt="点击看大图" />签名CD</a></td></tr><tr>
<td><a href="../resources/news/special/200407/200407155.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407155.jpg" alt="点击看大图" />签名CD</a></td>
<td><a href="../resources/news/special/200407/200407156.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407156.jpg" alt="点击看大图" />签名CD</a></td>
<td><a href="../resources/news/special/200407/200407157.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407157.jpg" alt="点击看大图" />签名CD</a></td></tr><tr>
<td><a href="../resources/news/special/200407/200407158.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407158.jpg" alt="点击看大图" />签名CD</a></td>
<td><a href="../resources/news/special/200407/200407159.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407159.jpg" alt="点击看大图" />集合</a></td>
<td><a href="../resources/news/special/200407/200407160.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407160.jpg" alt="点击看大图" />集合</a></td></tr><tr>
<td><a href="../resources/news/special/200407/200407161.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407161.jpg" alt="点击看大图" />集合</a></td>
<td><a href="../resources/news/special/200407/200407162.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407162.jpg" alt="点击看大图" />集合</a></td>

<td><a href="../resources/news/special/200407/200407163.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407163.jpg" alt="点击看大图" />集合</a></td></tr><tr>
<td><a href="../resources/news/special/200407/200407164.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407164.jpg" alt="点击看大图" />海报(无签名)</a></td>
<td><a href="../resources/news/special/200407/200407165.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407165.jpg" alt="点击看大图" />宣传画与海报</a></td>
<td><a href="../resources/news/special/200407/200407166.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407166.jpg" alt="点击看大图" />宣传画</a></td></tr><tr>
<td><a href="../resources/news/special/200407/200407167.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407167.jpg" alt="点击看大图" />宣传画</a></td>
<td><a href="../resources/news/special/200407/200407168.jpg" rel="external"><img src="../resources/news/special/200407/small/s200407168.jpg" alt="点击看大图" />宣传画</a></td></tr></table>
<%
ElseIf SpecialCateId=6 Then
%>
<div class="note">
专访MLTR的<a href="http://www.163.com/" rel="external">网易</a>网站，网址：<a href="http://www.163.com/" rel="external">www.163.com</a><br />
24上午网易聊天室<a href="rtsp://202.108.34.60:554/mltr.rm" rel="external">现场视频</a><br />
24日上午网易名人坊<a href="http://ent.163.com/ent_2003/editor/news/starnews/040724/040724_266183.html" rel="external">聊天记录</a><br />
24日下午MLTR接受媒体采访<a href="http://entdown.163.com/ent/0407/25/intmltr.rm" rel="external">视频</a><br />
24日下午MLTR部分媒体<a href="http://ent.163.com/ent_2003/editor/news/starnews/040725/040725_266543.html" rel="external">采访资料</a><br />

24日下午MLTR<a href="http://ent.163.com/ent_2003/editor/media/pic/040724/040724_266273.html" rel="external">访谈现场图片</a><br />
TOM娱乐<a href="http://ent.tom.com/1306/1362/2004725-89361.html" rel="external">访谈现场图片</a><br />
网易第6届CCTV-MTV<a href="http://ent.163.com/ent_2003/editor/music/musicidea/040630/040630_258931.html" rel="external">音乐盛典专栏</a><br />
TOM娱乐第6届CCTV-MTV<a href="http://ent.tom.com/1129/1507/2004725-89398.html" rel="external">音乐盛典专栏</a><br />
音乐盛典<a href="http://news.xinhuanet.com/ent/2004-07/25/content_1643882.htm" rel="external">新华网新闻</a><br />
音乐盛典<a href="http://ent.163.com/ent_2003/editor/music/miscnews/040724/040724_266309.html" rel="external">完全获奖名单</a></div>

	<h3>版权声明</h3>
	<div class="note">本专题所有文字、图片等资料除特殊说明一律MLTR中文站<a href="../main/copyright.asp" rel="external">版权所有</a>转载请注明版权</div>
	<%
	End If
	%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

ReDim liarray(6)
Dim i
For i=1 To 6
	liarray(i)="<a href=""?cate=" & i & """>" & SpecialCate(i) & "</a>"
Next
Set i=Nothing

ShowContentPanel "跳转", liarray

%>
</div>
<!-- #include file="../footer.asp" -->