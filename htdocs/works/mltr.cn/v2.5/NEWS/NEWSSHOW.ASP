<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim NewsID
NewsID=Request.QueryString("newsid")

'新闻内容读取
Dim NewsShowRS
SetRS NewsShowRS, NewsConn, "SELECT News.*, Cate.CateName FROM News_Content AS News, News_Cate AS Cate WHERE News.CateName=Cate.CateName AND News.NewsID=" & NewsID

Dim NewsNearRS, NewsPreviousID, NewsPreviousTitle, NewsNextID, NewsNextTitle
SetRS NewsNearRS, NewsConn, "SELECT Top 1 NewsID, NewsTitle FROM News_Content WHERE NewsTime<#" & NewsShowRS("NewsTime") & "# AND CateName='" & NewsShowRS("News.CateName") & "' ORDER BY NewsTime DESC"
If Not (NewsNearRS.BOF And NewsNearRS.EOF) Then
	NewsPreviousID=NewsNearRS("NewsID")
	NewsPreviousTitle=NewsNearRS("NewsTitle")
End If
SetRS NewsNearRS, NewsConn, "SELECT Top 1 NewsID, NewsTitle FROM News_Content WHERE NewsTime>#" & NewsShowRS("NewsTime") & "# AND CateName='" & NewsShowRS("News.CateName") & "' ORDER BY NewsTime"
If Not (NewsNearRS.BOF And NewsNearRS.EOF) Then
	NewsNextID=NewsNearRS("NewsID")
	NewsNextTitle=NewsNearRS("NewsTitle")
End If

CloseRS NewsNearRS

'评论读取
Dim NewsCommentRS
SetRS NewsCommentRS, NewsConn, "SELECT * FROM News_Comment WHERE NewsID=" & NewsID & " ORDER BY CommentID"

'计数+1
Dim CountUp
Set CountUp=NewsConn.Execute("UPDATE News_Content SET CountNews=CountNews+1 WHERE NewsID=" & NewsShowRS("newsID"))

Plugin="news"
CateRoot="news"
Cate=NewsShowRS("News.CateName")
title=NewsShowRS("NewsTitle")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
<%
If NewsShowRS("NewsIntro")<>Empty Then
%>
		<div class="intro">
			<%=UbbCode(NewsShowRS("NewsIntro"), 0, 0, 0, 0, "")%>
		</div>
<%
End If
%>
	<%=Replace(UbbCode(NewsShowRS("NewsContent"), 0, 0, 0, 0, ""), "$upfolder$", "../upload/")%>
	</div>
	<div id="commentlist">
<%
CloseRS NewsShowRS
ShowContentH2 "相关评论"
If NewsCommentRS.BOF And NewsCommentRS.EOF Then
%>
		<p class="msg">本新闻暂无评论，欢迎发表！</p>
<%
Else
%>
		<dl class="comment">
<%
	Do Until NewsCommentRS.EOF
		ShowComment NewsCommentRS
	Loop
%>
		</dl>
		<p class="msg">本新闻共有<em><%=NewsCommentRS.RecordCount%></em>条评论，欢迎发表！</p>
<%
End If
CloseRS NewsCommentRS
%>
	</div>
	<div id="commentpost">
<%
ShowContentH2 "发表评论"
%>
		<fieldset id="postcomment">
			<form name="inputform" method="post" action="newscomment.asp?action=post">
<%
If UserIsPassed="Passed" Then
%>
				<span class="login">账号：<em><%=UserName%></em></span>
<%
Else
%>
				<span class="login">账号：<input type="text" name="username" id="username" class="text" />&nbsp;密码：<input type="password" name="password" id="password" class="text" /></span>
<%
End If
%>
				<textarea name="message" id="message"></textarea>
				<input type="hidden" name="newsid" id="newsid" value="<%=NewsID%>" />
				<input type="submit" value="提交" class="button" />
				<input type="reset" value="重置" class="button" />
			</form>
		</fieldset>
	</div>
</div>
<div id="sidebar">
<%
ShowContentH2 "页面功能"

ShowContentCateList

ReDim liarray(3)
liarray(1)="<a href=""#content"">新闻内容</a>"
liarray(2)="<a href=""#commentlist"">相关评论</a>"
liarray(3)="<a href=""#commentpost"">发表评论</a>"

ShowContentPanel "跳转", liarray

If NewsPreviousID=Empty Then
	ShowContentPanel "导航", "<p><a href=""?newsid=" & NewsNextID & """ title=""" & NewsNextTitle & """>下一条新闻</a><p>"
ElseIf NewsNextID=Empty Then
	ShowContentPanel "导航", "<p><a href=""?newsid=" & NewsPreviousID & """ title=""" & NewsPreviousTitle & """>上一条新闻</a></p>"
Else
	ReDim liarray(2)
	liarray(1)="<a href=""?newsid=" & NewsPreviousID & """ title=""" & NewsPreviousTitle & """>上一条新闻</a>"
	liarray(2)="<a href=""?newsid=" & NewsNextID & """ title=""" & NewsNextTitle & """>下一条新闻</a>"
	ShowContentPanel "导航", liarray
End If

If UserValue="Admin" Then
	ShowContentPanel "管理员", "<p><a href=""newsedit.asp?newsID=" & NewsID & """>编辑</a></p>"
End If

Set NewsID=Nothing
%>
</div>
<!-- #include file="../footer.asp" -->