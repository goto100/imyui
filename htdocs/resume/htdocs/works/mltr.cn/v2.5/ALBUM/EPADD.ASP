<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
If Request.QueryString("action")="post" Then
	Dim pic, piclink, AlbumID, EPName, EPYear, EPPlace, EPSong, EPIntro
	If Request.Form("pic")="1" Then
		pic=TRUE
	Else
		pic=FALSE
	End If
	If Request.Form("piclink")="1" Then
		piclink=TRUE
	Else
		piclink=FALSE
	End IF
	AlbumID=Request.Form("albumid")
	EPName=Request.Form("epname")
	EPYear=Request.Form("epyear")
	EPPlace=Request.Form("epplace")
	EPSong=Request.Form("epsong")
	EPIntro=Request.Form("epintro")
	
	Dim EPRS
	Set EPRS=Conn.Execute("INSERT INTO Album_EP (AlbumID, EPName, EPYear, EPPlace, EPSong, EPIntro, Pic, PicLink) VALUES (" & AlbumID & ", '" & CheckStr(EPName) & "', '" & CheckStr(EPYear) & "', '" & CheckStr(EPPlace) & "', '" & CheckStr(EPSong) & "', '" & CheckStr(EPIntro) & "', " & pic & ", " & PicLink & ")")
	Set EPRS=Nothing

	Response.Redirect("epadd.asp")
Else
%>
<div id="bodier">
	<div id="form">
		<form method="post" action="epadd.asp?action=post">
			<table>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="submit" value="提交" class="button" />
						</td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td>有否封面图片</td>
						<td><input type="checkbox" name="pic" value="1" /></td>
					</tr>
					<tr>
						<td>封面连接</td>
						<td><input type="text" name="piclink" value="1" /></td>
					</tr>
					<tr>
						<td>所属专辑</td>
						<td><input type="text" name="albumid" id="albumid" class="text" value="0" /></td>
					</tr>
					<tr>
						<td>专辑名称</td>
						<td><input type="text" name="epname" id="epname" class="text" /></td>
					</tr>
					<tr>
						<td>年份</td>
						<td><input type="text" class="text" name="epyear" /></td>
					</tr>
					<tr>
						<td>地点</td>
						<td><input type="text" class="text" name="epplace" /></td>
					</tr>
					<tr>
						<td>歌曲列表</td>
						<td><textarea name="epsong"></textarea></td>
					</tr>
					<tr>
						<td>介绍</td>
						<td><textarea name="epintro"></textarea></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<%
End If
%>
