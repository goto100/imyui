<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
title="编辑TopNews"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("TopNewsTitle")=Empty Or Request.Form("TopNewsPic")=Empty Or Request.Form("TopNewsURL")=Empty Or Request.Form("TopNewsIntro")=Empty Then
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		ElseIf DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
			ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。","backnorefresh", ""
			Session("LastPostTime")=Now()
		Else
			Dim EditRS
			Set EditRS=Conn.Execute("UPDATE Main_Content SET TopNewsTitle='" & Request.Form("TopNewsTitle") & "', TopNewsPic='" & Request.Form("TopNewsPic") & "', TopNewsURL='" & Request.Form("TopNewsURL") & "', TopNewsIntro='" & Request.Form("TopNewsIntro") & "'")
			Set EditRS=Nothing
	
			'Session("LastPostTime")=Now()

			ShowAlert "提交成功", "您已" & title & "，谢谢", "main", "返回首页"
		End If
	Else
		Dim TopNewsRS
		Set TopNewsRS=Conn.Execute("SELECT TopNewsTitle, TopNewsPic, TopNewsURL, TopNewsIntro FROM Main_Content")
%>
<div id="bodier">
	<div id="form">
		<form method="post" action="?action=post">
			<table class="form">
				<colgroup>
					<col class="name" />
					<col class="content" />
				</colgroup>
				<tfoot>
					<tr>
						<td colspan="2"><input type="submit" name="Submit" value="提交" class="button" /></td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td><label for="TopNewsTitle">标题</label></td>
						<td><input type="text" value="<%=TopNewsRS("TopNewsTitle")%>" size="20" maxlength="20" name="TopNewsTitle" id="TopNewsTitle" class="text" /></td>
					</tr>
					<tr>
						<td><label for="TopNewsPic">图片名称</label></td>
						<td><input type="text" value="<%=TopNewsRS("TopNewsPic")%>" size="10" maxlength="10" name="TopNewsPic" id="TopNewsPic" class="text" /></td>
					</tr>
					<tr>
						<td><label for="TopNewsURL">链接地址</label></td>
						<td><input type="text" value="<%=TopNewsRS("TopNewsURL")%>" size="80" maxlength="80" name="TopNewsURL" id="TopNewsURL" class="text" /></td>
					</tr>
					<tr>
						<td><label for="TopNewsIntro">介绍</label></td>
						<td><input type="text" value="<%=TopNewsRS("TopNewsIntro")%>" size="80" maxlength="80" name="TopNewsIntro" id="TopNewsIntro" class="text" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<%
		CloseRS TopNewsRS
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->