<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim AlbumName
AlbumName=Request.QueryString("album")

Dim AlbumShowRS
Set AlbumShowRS=Conn.Execute("SELECT * FROM Album_Album WHERE AlbumName='" & AlbumName & "'")

Plugin="album"
CateRoot="album"
Cate="album"
title=AlbumShowRS("AlbumName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="info">
<%
ShowContentH2 "专辑信息"
%>
		<div class="show">
			<img src="../resources/album/album/<%=AlbumShowRS("AlbumName")%>.jpg" alt="<%=AlbumShowRS("AlbumName")%>" class="show" />
			<ul>
				<li>专辑名称：<%=AlbumShowRS("AlbumName") & AlbumShowRS("AlbumPS")%></li>
				<li>中文译名：<%=AlbumShowRS("AlbumCName")%></li>
				<li>发行日期：<%=AlbumShowRS("AlbumDate")%></li>
				<li>发行地区：<%=AlbumShowRS("AlbumPlace")%></li>
				<li>全球销量：<%=AlbumShowRS("AlbumSale")%></li>
			</ul>
		</div>
	<%=UbbCode(AlbumShowRS("AlbumInfo"), 0, 0, 0, 0, "")%>
	</div>
	<div id="songlist">
<%
ShowContentH2 "歌曲列表"

Dim AlbumShowSongRS
SetRS AlbumShowSongRS, Conn, "SELECT * FROM Album_AlbumSong WHERE AlbumID=" & AlbumShowRS("AlbumID") & " ORDER BY MusicNum"
%>
		<table class="list">
		<thead>
			<tr>
				<th class="no">&nbsp;</th>
				<th class="name">歌曲名称</th>
				<th class="lyric">查看歌词</th>
				<th class="listen">在线试听</th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="3">&nbsp;</td>
				<td>总数：<%=AlbumShowSongRS.RecordCount%></td>
			</tr>
		</tfoot>
		<tbody>
<%
Dim i
For i=1 To AlbumShowSongRS.RecordCount
%>
				<tr<%=ChangeColor(i)%>>
					<td><%=AlbumShowSongRS("MusicNum")%></td>
					<td><%=AlbumShowSongRS("MusicName")%></td>
					<td><a href="../music/lyricshow.asp?lyric=<%=AlbumShowSongRS("MusicName")%>"><img src="../images/go.gif" class="config" alt="查看歌词" /></a></td>
					<td><a href="../music/listenshow.asp?listen=<%=AlbumShowSongRS("MusicName")%>"><img src="../images/go.gif" class="config" alt="在线试听" /></a></td>
				</tr>
<%
	AlbumShowSongRS.MoveNext
Next
Set i=Nothing
%>
			</tbody>
		</table>
	</div>
<%
CloseRS AlbumShowSongRS

If AlbumShowRS("AlbumIntro")<>Empty Then
%>
	<div id="intro">
<%
ShowContentH2 "专辑介绍"
%>
		<%="<div class=""intro"">" & UbbCode(AlbumShowRS("AlbumIntro"), 0, 0, 0, 0, "") & "</div>"%>
		<%=UbbCode(AlbumShowRS("AlbumContent"), 0, 0, 0, 0, "")%>
	</div>
<%
End If
CloseRS AlbumShowRS
%>
</div>
<div id="sidebar">
<%
ShowContentCateList

ReDim liarray(3)
liarray(1)="<a href=""#albuminfo"">专辑信息</a>"
liarray(2)="<a href=""#albumsong"">歌曲列表</a>"
liarray(3)="<a href=""#albumintro"">专辑介绍</a>"

ShowContentPanel "跳转", liarray

Dim AlbumRS
SetRS AlbumRS, Conn, "SELECT AlbumName FROM Album_Album ORDER BY AlbumID DESC"
ReDim liarray(AlbumRS.RecordCount)
Dim j
For j=1 To AlbumRS.RecordCount
	liarray(j)="<a href=""albumshow.asp?album=" & CheckStr(AlbumRS("AlbumName")) & """>" & AlbumRS("AlbumName") & "</a>"
	AlbumRS.MoveNext
Next
CloseRS AlbumRS
Set j=Nothing

ShowContentPanel "导航", liarray
%>
</div>
<!-- #include file="../footer.asp" -->