<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
title="编辑更新"
%>
<!-- #include file="../header.asp" -->
<%
Dim UpdateID
UpdateID=Request.QueryString("updateid")

If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="edit" Then
		If Request.Form("UpdateInfo")=Empty Or Request.Form("UpdateNav")=Empty Or Request.Form("UpdateCate")=Empty Then
			ShowAlert "提交失败", "您的表单未填写完整，请填写完全进行提交", "backnorefresh", ""
		Else
			Dim UpdateUpdateRS
			Set UpdateUpdateRS=Conn.Execute("UPDATE Main_Update SET UpdateNav='" & CheckStr(Request.Form("updatenav")) & "', UpdateCate='" & CheckStr(Request.Form("updatecate")) & "', UpdateDate=#" & CheckStr(Request.Form("updatedate")) & "#, UpdateURL='" & CheckStr(Request.Form("updateurl")) & "', UpdatePic='" & CheckStr(Request.Form("updatepic")) & "', UpdateInfo='" & CheckStr(Request.Form("updateinfo")) & "' WHERE UpdateID=" & UpdateID)
			Set UpdateUpdateRS=Nothing
	
			Session("LastPostTime")=Now()
			
			ShowAlert "提交成功", "您已修改更新，谢谢", "main", "back"
		End If
	Else
		Dim UpdateEditRS
		Set UpdateEditRS=Conn.Execute("SELECT * FROM Main_Update WHERE UpdateID=" & UpdateID)
%>
<style type="text/css">
	form#musicform textarea#musiccontent{width:100%;height:500px;}
</style>
<div id="form">
	<form method="post" action="updateedit.asp?action=edit&amp;updateid=<%=UpdateEditRS("UpdateID")%>" id="updatepost">
		<fieldset>主栏目<input type="text" name="updatenav" id="updatenav" class="text" value="<%=UpdateEditRS("UpdateNav")%>" />
		次栏目<input type="text" name="updatecate" id="updatecate" class="text" value="<%=UpdateEditRS("UpdateCate")%>" /></fieldset>
		<fieldset>日期<input type="text" name="updatedate" id="updatedate" class="text" value="<%=UpdateEditRS("UpdateDate")%>" />链接<input type="text" name="updateurl" id="updateurl" class="text" value="<%=UpdateEditRS("UpdateURL")%>" /></fieldset>
		<fieldset>信息<textarea name="updateinfo" id="updateinfo"><%=UpdateEditRS("UpdateInfo")%></textarea></fieldset>
		<fieldset>图片<input type="text" name="updatepic" id="updatepic" class="text" value="<%=UpdateEditRS("UpdatePic")%>" />
		</fieldset>
		<input type="submit" name="Submit" value="提交" class="button" />
	</form>
</div>
<%
		CloseRS UpdateEditRS
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->