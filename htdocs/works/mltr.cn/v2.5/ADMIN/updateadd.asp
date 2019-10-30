<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
title="添加更新"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("UpdateNav")=Empty Or Request.Form("UpdateCate")=Empty Or Request.Form("UpdateInfo")=Empty Then
			'内容未填写完整
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		ElseIf DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
			'灌水
			ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。","backnorefresh", ""
			Session("LastPostTime")=Now()
		Else
			Dim UpdateRS
			Set UpdateRS=Conn.Execute("INSERT INTO Main_Update (UpdateNav, UpdateCate, UpdateURL, UpdateInfo, UpdatePic) VALUES ('" & Request.Form("UpdateNav") & "', '" & Request.Form("UpdateCate") & "', '" & Request.Form("UpdateURL") & "', '" & CheckStr(Request.Form("UpdateInfo")) & "', '" & Request.Form("UpdatePic") & "')")
			Set UpdateRS=Nothing
	
			'Session("LastPostTime")=Now()

			ShowAlert "提交成功", "您已发布更新，谢谢", "main", "返回首页"
		End If
	Else
%>
<style type="text/css">
	form#updatepost input#nav, form#updatepost input#cate{width:80px;}
	form#updatepost input#url{width:90%;}
	form#updatepost textarea#info{width:90%;height:50px;}
	form#updatepost input#pic{width:90%;}
</style>
<div id="bodier">
	<div id="form">
		<form method="post" action="?action=post" id="updatepost">
			<fieldset>主栏目<input type="text" name="UpdateNav" id="UpdateNav" class="text" />
			次栏目<input type="text" name="UpdateCate" id="UpdateCate" class="text" /></fieldset>
			<fieldset>链接<input type="text" name="UpdateURL" id="UpdateURL" class="text" /></fieldset>
			<fieldset>信息<textarea name="UpdateInfo" id="UpdateInfo"></textarea></fieldset>
			<fieldset>图片<input type="text" name="UpdatePic" id="UpdatePic" class="text" />
			</fieldset>
			<input type="submit" name="Submit" value="提交" class="button" />
		</form>
	</div>
</div>
<%
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->