<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
title="编辑Music内容"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	Dim MusicName
	MusicName=Request.QueryString("musicname")

	If Request.QueryString("action")="edit" Then
		If Request.Form("musicname")=Empty Then
			ShowAlert "提交失败", "您的表单未填写完整，请填写完全进行提交", "backnorefresh", ""
		Else
			Dim MusicUpdateRS
			Set MusicUpdateRS=Conn.Execute("UPDATE Music_Content SET MusicName='" & CheckStr(Request.Form("musicname")) & "', MusicCName='" & CheckStr(Request.Form("musiccname")) & "', MusicAlbum='" & CheckStr(Request.Form("musicalbum")) & "', MusicAuthor='" & CheckStr(Request.Form("musicauthor")) & "', MusicLyric='" & CheckStr(Request.Form("musiclyric")) & "', MusicCopy='" & CheckStr(Request.Form("musiccopy")) & "', Listen=" & CBool(Request.Form("listen")) & " WHERE MusicName='" & MusicName & "'")
			Set MusicUpdateRS=Nothing
	
			Session("LastPostTime")=Now()
			
			ShowAlert "提交成功", "您已修改Music，谢谢", "music.asp", "back"
		End If
	Else
		Dim MusicEditRS
		Set MusicEditRS=Conn.Execute("SELECT * FROM Music_Content WHERE MusicName='" & MusicName & "'")
%>
<div id="bodier">
	<div id="form">
		<form action="musicedit.asp?action=edit&amp;musicname=<%=CheckStr(MusicEditRS("MusicName"))%>" method="post">
			<table class="form">
				<colgroup>
					<col class="name" />
					<col class="content" />
				</colgroup>
				<tfoot>
					<tr>
						<td colspan="2"><input type="submit" value="提交" class="button" /></td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td></td>
						<td><input type="text" name="musiccname" value="<%=MusicEditRS("MusicCName")%>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="musicalbum" value="<%=MusicEditRS("MusicAlbum")%>" /></td>
					</tr>
					<tr>
						<td></td>
						<td>
			
<%
If MusicEditRS("Listen")=True Then
%>
						<input type="checkbox" name="listen" value="1" checked="checked" />
<%
Else
%>
						<input type="checkbox" name="listen" value="1" />
<%
End If
%>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="musicauthor" value="<%=MusicEditRS("MusicAuthor")%>" /></td>
					</tr>
					<tr>
						<td></td>
						<td><textarea id="musiclyric" name="musiclyric"><%=MusicEditRS("MusicLyric")%></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" name="musiccopy" value="<%=MusicEditRS("MusicCopy")%>" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
<%
		CloseRS MusicEditRS
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->