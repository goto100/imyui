<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
plugin="link"
title="添加链接"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("LinkID")=Empty Or Request.Form("LinkName")=Empty Or Request.Form("LinkURL")=Empty Or Request.Form("LinkIntro")=Empty Then
			'内容未填写完整
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		ElseIf DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
			'灌水
			ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。","backnorefresh", ""
			Session("LastPostTime")=Now()
		Else
			Dim UpdateRS
			Set UpdateRS=Conn.Execute("INSERT INTO Site_Link (LinkID, LinkName, LinkURL, LinkIntro) VALUES (" & Request.Form("LinkID") & ", '" & Request.Form("name") & "', '" & Request.Form("LinkURL") & "', '" & Request.Form("LinkIntro") & "')")
			Set UpdateRS=Nothing
	
			'Session("LastPostTime")=Now()

			ShowAlert "提交成功", "您已" & title & "，谢谢", "main", "返回首页"
		End If
	Else
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
						<td><label for="LinkID">ID</label></td>
						<td><input type="text" name="LinkID" id="idLinkID" class="text" /></td>
					</tr>
					<tr>
						<td><label for="LinkName">名称</label></td>
						<td><input type="text" name="LinkName" id="LinkName" class="text" /></td>
					</tr>
					<tr>
						<td><label for="LinkURL">地址</label></td>
						<td><input type="text" name="LinkURL" id="LinkURL" class="text" /></td>
					</tr>
					<tr>
						<td><label for="LinkIntro">介绍</label></td>
						<td><textarea name="LinkIntro" id="LinkIntro"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<%
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->