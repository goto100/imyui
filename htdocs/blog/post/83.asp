        <%ST(A)%>
			<div id="Content_ContentList" class="content-width"><a name="body" accesskey="B" href="#body"></a>
				<div class="pageContent">
					<div style="float:right;width:180px !important;width:auto"><a href="?id=80" title="上一篇日志: 用JScript写ASP" accesskey=","><img border="0" src="images/Cprevious.gif" alt=""/>上一篇</a> | <a href="?id=84" title="下一篇日志: HTML4标签的默认样式列表" accesskey="."><img border="0" src="images/Cnext.gif" alt=""/>下一篇</a></div> 
					<img src="images/icons/22.gif" style="margin:0px 2px -4px 0px" alt=""/> <strong><a href="default.asp?cateID=20" title="查看所有网页制作的日志">网页制作</a></strong> <a href="feed.asp?cateID=20" target="_blank" title="订阅所有网页制作的日志" accesskey="O"><img border="0" src="images/rss.png" alt="订阅所有网页制作的日志" style="margin-bottom:-1px"/></a>
				</div>
				<div class="Content">
					<div class="Content-top"><div class="ContentLeft"></div><div class="ContentRight"></div>
					<h1 class="ContentTitle"><strong>JScript中的静态类与类成员</strong></h1>
					<h2 class="ContentAuthor">作者:宇义 日期:2005-05-16</h2>
				</div>
			    <div class="Content-Info">
					<div class="InfoOther">字体大小: <a href="javascript:SetFont('12px')" accesskey="1">小</a> <a href="javascript:SetFont('14px')" accesskey="2">中</a> <a href="javascript:SetFont('16px')" accesskey="3">大</a></div>
					<div class="InfoAuthor"><img src="images/weather/hn2_sunny.gif" style="margin:0px 2px -6px 0px" alt=""/><img src="images/weather/hn2_t_sunny.gif" alt=""/> <img src="images/level3.gif" style="margin:0px 2px -1px 0px" alt=""/><$EditAndDel$></div>
				</div>
				<div id="logPanel" class="Content-body">
					什么是静态类和类成员，有点编程知识的人应该都知道了，我再简单的说一下，静态类就是不需要不需要创建对象实例的类，比如ASP中的七大对象都是，ASP中的七大对象甚至不允许创建对象实例。<br/><br/>静态成员就是一个可以创建实例的类中包含的不会在创建的实例中存在的成员，静态类中的成员肯定都是静态成员啦。也可以说如果一个类中全是静态成员那这个类自然成了静态类。<br/><br/>因为静态类不需要创建实例既可使用，所以他默认情况下就已经占用系统资源，而普通的类只有创建了对象实例才会使用系统资源，所以静态类不建议多创建。<br/><br/>静态成员也是如此，它不存在于对象中，不管你有没有创建对象实例，均可以使用静态成员。<br/><br/>举JScript中的例子：<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>function MyClass() {<br/>&nbsp;&nbsp;&nbsp;&nbsp;this.name = &quot;ScYui&quot;;<br/>}<br/>// 一个类，包含一个非静态成员，必须创建对象实例才可使用：<br/>var myClass = new MyClass;<br/>alert(myClass.name);<br/>// 显示ScYui<br/><br/>MyClass.age = &quot;20&quot;; // 这行代码声明MyClass类的一个静态成员，使用方法如下：<br/>alert(MyClass.age);<br/>// 如果 alert(myClass.age) 既会出错，因为 age 成员是静态的，对象实例中不包括。<br/><br/>// 在类中使用静态成员不能用this，而是使用类名，如将MyClass改造一下：<br/>function MyClass() {<br/>&nbsp;&nbsp;&nbsp;&nbsp;this.name = &quot;ScYui&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;this.info = this.name + MyClass.age;<br/>}<br/></div></div><br/><br/>静态成员什么时候用得到呢？<br/><br/>一般的使用情况是：当一个类可能被创建多个对象，而多个对象中需要一些公用信息的时候。比如创建一个家庭成员的类。<br/><br/><div class="UBBPanel"><div class="UBBTitle"><img src="images/code.gif" style="margin:0px 2px -3px 0px" alt="程序代码"/> 程序代码</div><div class="UBBContent"><br/>function Family(strName, intAge) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;this.name = strName;<br/>&nbsp;&nbsp;&nbsp;&nbsp;this.age =&nbsp;&nbsp;intAge;<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;Family.personNumber += 1; // 统计家庭成员个数<br/>}<br/>Family.personNumber = 0; // 静态成员<br/><br/>// 创建两位家庭成员<br/>var tom = new Family(&quot;tom&quot;, 20);<br/>var mary = new Family(&quot;Mary&quot;, 18);<br/><br/>alert(Family.personNumber); // 显示2<br/><br/>// 家里来了只小狗<br/>var dog = new Family(&quot;xiaoqiang&quot;, 2);<br/><br/>alert(Family.personNumber); // 显示3<br/></div></div><br/><br/>我觉得JScript对于类的处理很好，所有的function均不会立即执行，而只有调用或者创建对象后才使用系统资源，而静态成员是一上来占用系统资源的，所以写在function外部。
					<br/><br/><br/>
				</div>
				<div class="Content-body">
					
					<img src="images/From.gif" style="margin:0px 2px -4px 0px" alt=""/><strong>文章来自:</strong> <a href="#" target="_blank">本站原创</a><br/>
					<img src="images/icon_trackback.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>引用通告:</strong> <a href="trackback.asp?tbID=83&amp;action=view" target="_blank">查看所有引用</a> | <a href="javascript:;" title="获得引用文章的链接" onclick="getTrackbackURL(83)">我要引用此文章</a><br/>
					<img src="images/tag.gif" style="margin:4px 2px -4px 0px" alt=""/><strong>Tags:</strong> <br/>
				</div>
				<div class="Content-bottom"><div class="ContentBLeft"></div><div class="ContentBRight"></div>评论: 1 | <a href="trackback.asp?tbID=83&amp;action=view" target="_blank">引用: 1097</a> | 查看次数: <$log_ViewNums$></div>
			</div>
		</div>
