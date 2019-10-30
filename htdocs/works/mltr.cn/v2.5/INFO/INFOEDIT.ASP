<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
title="编辑Info内容"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	Dim InfoName
	InfoName=Request.QueryString("info")

	If Request.QueryString("action")="edit" Then
		If Request.Form("infocontent")=Empty Then
			ShowAlert "提交失败", "您的表单未填写完整，请填写完全进行提交", "backnorefresh", ""
		Else
			Dim InfoUpdateRS
			Set InfoUpdateRS=Conn.Execute("UPDATE Info_Content SET InfoContent='" & CheckStr(Request.Form("infocontent")) & "' WHERE InfoName='" & InfoName & "'")
			Set InfoUpdateRS=Nothing
	
			Session("LastPostTime")=Now()
			
			ShowAlert "提交成功", "您已修改Info，谢谢", "infoshow.asp?info=" & InfoName & "", "back"
		End If
	Else
		Dim InfoEditRS
		Set InfoEditRS=Conn.Execute("SELECT * FROM Info_Content WHERE InfoName='" & InfoName & "'")
%>
<div id="form">
	<form action="infoedit.asp?action=edit&amp;info=<%=CheckStr(InfoEditRS("InfoName"))%>" method="post">
		<fieldset id="config">
		<textarea id="infocontent" name="infocontent"><%=InfoEditRS("InfoContent")%></textarea>
		</fieldset>
		<input type="submit" value="提交" class="button" />
	</form>
</div>
<%
		CloseRS InfoEditRS
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->