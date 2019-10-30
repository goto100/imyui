<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
Plugin="album"
CateRoot="album"
title="编辑EP内容"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="edit" Then
		If Request.Form("epcontent")=Empty Then
			ShowAlert "提交失败", "您的表单未填写完整，请填写完全进行提交", "backnorefresh", ""
		Else
			Dim EPUpdateRS
			Set EPUpdateRS=Conn.Execute("UPDATE Album_EP SET EPContent='" & CheckStr(Request.Form("epcontent")) & "'")
			Set EPUpdateRS=Nothing
	
			Session("LastPostTime")=Now()
			
			ShowAlert "提交成功", "您已修改EP，谢谢", "ep.asp", "back"
		End If
	Else
		Dim EPEditRS
		Set EPEditRS=Conn.Execute("SELECT * FROM Album_EP")
%>
<div id="bodier">
	<div id="form">
		<form action="epedit.asp?action=edit" method="post" id="epform" name="epform">
			<fieldset>
				<legend>编辑EP内容</legend>
				<textarea id="epcontent" name="epcontent"><%=EPEditRS("EPContent")%></textarea>
			</fieldset>
			<input type="submit" value="提交" class="button" />
		</form>
	</div>
</div>
<%
		CloseRS EPEditRS
	End If
End If
%>
<!-- #include file="../footer.asp" -->