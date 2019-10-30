<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
Plugin="news"
CateRoot="news"
title="编辑新闻"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.Form("del")="1" Then
		'删除新闻
		Dim NewsDel
		Set NewsDel=NewsConn.Execute("DELETE * FROM News_Content WHERE NewsID=" & Request.Form("NewsID"))
		Set NewsDel=Nothing
	
		'删除本条新闻所有评论
		Dim DelCommentAll
		Set DelCommentAll=NewsConn.Execute("DELETE * FROM News_Comment WHERE NewsID=" & Request.Form("newsid"))
	
		ShowAlert "删除成功", "您已成功删除一条新闻", "news.asp?cate=news", "back"
	ElseIf Request.QueryString("action")="edit" Then
		'编辑新闻
		If Request.Form("catename")="0" Or Request.Form("newstitle")=Empty Or Request.Form("newsfrom")=Empty Or Request.Form("newscontent")=Empty Then
			'内容未填写完整
			ShowAlert "提交失败", "您的表单未填写完整，请填写完全进行提交", "backnorefresh", "back"
		Else
			'新闻内容更新
			Dim NewsUpdateRS, strSQL
			strSQL="CateName='" & Request.Form("catename") & "', NewsTitle='" & CheckStr(Request.Form("newstitle")) & "', NewsFrom='" & CheckStr(Request.Form("newsfrom")) & "', NewsURL='" & CheckStr(Request.Form("newsurl")) & "', NewsIntro='" & CheckStr(Request.Form("newsintro")) & "', NewsContent='" & CheckStr(Request.Form("newscontent")) & "'"
			If Request.Form("postagain")="1" Then
				strSQL=strSQL & ", NewsTime='" & now() & "'"
			End If
			Set NewsUpdateRS=NewsConn.Execute("UPDATE News_Content SET " & strSQL & " WHERE NewsID=" & Request.Form("newsid"))
			Set NewsUpdateRS=Nothing
			Set strSQL=Nothing
	
			Session("LastPostTime")=Now()
			
			ShowAlert "提交成功", "您已修改新闻，谢谢", "newsshow.asp?newsid=" & Session("newsid"), "back"
		End If
	Else
		'编辑表单
		Dim NewsEditRS
		Set NewsEditRS=NewsConn.Execute("SELECT * FROM News_Content WHERE NewsID=" & Request.QueryString("NewsID"))
	
		Dim FormMode, FormAction, CateName, NewsTitle, NewsFrom, NewsURL, NewsIntro, NewsContent
		
		FormMode="Edit"
		FormAction="newsedit.asp?action=edit"
		CateName=NewsEditRS("CateName")
		NewsTitle=NewsEditRS("NewsTitle")
		NewsFrom=NewsEditRS("NewsFrom")
		NewsURL=NewsEditRS("NewsURL")
		NewsIntro=NewsEditRS("NewsIntro")
		NewsContent=NewsEditRS("NewsContent")
		Session("newsid")=Request.QueryString("newsid")
%>
<div id="bodier">
	<div id="form">
		<!-- #include file="newsform.asp" -->
	</div>
</div>
<%
		CloseRS NewsEditRS
	End If
End If
%>
<!-- #include file="../footer.asp" -->