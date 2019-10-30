<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
Plugin="news"
CateRoot="news"
title="新闻评论"
%>
<!-- #include file="../header.asp" -->
<!-- #include file="../inc/comment.asp" -->
<%
If Request.QueryString("action")="post" Then
	CommentPost "News"
Elseif Request.QueryString("action")="del" Then
	CommentDel "News"
End If
%>
</div>
<!-- #include file="../footer.asp" -->