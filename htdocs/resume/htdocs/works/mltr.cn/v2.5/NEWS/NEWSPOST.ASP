<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
Plugin="news"
CateRoot="news"
title="发布新闻"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败","novalue","backnorefresh", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("catename")="0" Or Request.Form("newstitle")=Empty Or Request.Form("newsfrom")=Empty Or Request.Form("newscontent")=Empty Then
			'内容未填写完整
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		ElseIf DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
			'灌水
			ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。","backnorefresh", ""
			Session("LastPostTime")=Now()
		Else
			'新闻内容写入
			Dim NewsPostRS
			Set NewsPostRS=NewsConn.Execute("INSERT INTO News_Content (CateName, NewsTitle, NewsFrom, NewsURL, NewsIntro, NewsContent) VALUES ('" & Request.Form("catename") & "', '" & Request.Form("newstitle") & "', '" & Request.Form("newsfrom") & "', '" & Request.Form("newsurl") & "', '" & CheckStr(Request.Form("newsintro")) & "', '" & CheckStr(Request.Form("newscontent")) & "')")
			Set NewsPostRS=Nothing
	
			Session("LastPostTime")=Now()

			ShowAlert "提交成功", "您已发布新闻，谢谢", "news.asp?cate=" & Request.Form("catename"), "back"

		End If
	Else
		Dim FormMode, FormAction, CateName, NewsTitle, NewsFrom, NewsURL, NewsIntro, NewsContent
		
		FormMode="Add"
		FormAction="newspost.asp?action=post"
		NewsFrom=SiteName
%>
<div id="bodier">
	<div id="form">
		<!-- #include file="newsform.asp" -->
	</div>
</div>
<%
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->