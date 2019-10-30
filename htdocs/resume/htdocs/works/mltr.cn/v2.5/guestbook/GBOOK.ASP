<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
title="留言本"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
<%
Dim GBookConn
SetConn GBookConn, "/../database/gbook2.mdb"
Dim GBookRS
SetRS GBookRS, GBookConn, "SELECT * FROM GBook_Content ORDER BY GBookTime DESC"

ShowPagebar 10, GBookRS

Dim i
For i=1 To GBookRS.PageSize
%>
		<div class="comment">
			<h4><span class="name"><%=GBookRS("GBookAuthor")%></span>
<%
	If GBookRS("GBookQQ")<>0 Or GBookRS("GBookQQ")<>Empty Then
%>
				<span class="qq"><a href="http://wpa.qq.com/msgrd?V=1&Uin=<%=GBookRS("GBookQQ")%>&Site=<%=SiteName%>&Menu=yes" rel="external"><img src="http://wpa.qq.com/pa?p=1:<%=GBookRS("GBookQQ")%>:1" alt="发送QQ消息"></a></span>
<%
	End If
	If GBookRS("GBookHomePage")<>Empty Then
%>
				<span class="homepage"><a href="<%=GBookRS("GBookHomePage")%>" title="<%=GBookRS("GBookHomePage")%>" rel="external">主页</a></span>
<%
	End If
	If GBookRS("GBookEMail")<>Empty Then
%>
				<span class="email"><a href="mailto:<%=GBookRS("GBookEMail")%>" title="<%=GBookRS("GBookEMail")%>" class="email">邮箱</a></span>
<%
	End If
%>
			<span class="time"><%=GBookRS("GBookTime")%></span><span class="ip"><%=GBookRS("GBookIP")%></span>
			</h4>
			<div>
				<p><%=GBookRS("GBookTitle")%></p>
				<%=UbbCode(GBookRS("GBookContent"), 0, 0, 0, 0, "")%>
			</div>
<%
If GBookRS("ReplyContent")<>Empty Then
%>
			<div class="reply">
				<em>站长回复</em><%=UbbCode(GBookRS("ReplyContent"), 0, 0, 0, 0, "")%>
			</div>
<%
End If
%>
		</div>
<%
	GBookRS.MoveNext
	If GBookRS.EOF Then Exit For
Next
%>
		<p class="msg">共<em><%=GBookRS.RecordCount%></em>条留言，欢迎发表！</p>
</div>
<ul id="cate">
	<li id="thiscate"><a href="gbook.asp">查看留言</a></li>
	<li><a href="gbookpost.asp">发表留言</a></li>
</ul>
</div>
<!-- #include file="../footer.asp" -->