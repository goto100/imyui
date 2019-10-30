<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim GreatestName
GreatestName=Request.QueryString("greatest")

Dim GreatestShowRS
Set GreatestShowRS=Conn.Execute("SELECT * FROM Album_Greatest WHERE GreatestName='" & GreatestName & "'")

Plugin="album"
CateRoot="album"
Cate="greatest"
title=GreatestShowRS("GreatestName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="info">
<%
ShowContentH2 "专辑信息"
%>
		<div class="show">
			<img src="../resources/album/greatest/<%=GreatestShowRS("GreatestName")%>.jpg" alt="<%=GreatestShowRS("GreatestName")%>" class="show" />
			<ul>
				<li>专辑名称：<%=GreatestShowRS("GreatestName") & GreatestShowRS("GreatestPS")%></li>
				<li>中文译名：<%=GreatestShowRS("GreatestCName")%></li>
				<li>发行日期：<%=GreatestShowRS("GreatestDate")%></li>
				<li>发行地区：<%=GreatestShowRS("GreatestPlace")%></li>
				<li>全球销量：<%=GreatestShowRS("GreatestSale")%></li>
			</ul>
		</div>
	<%=UbbCode(GreatestShowRS("GreatestInfo"), 0, 0, 0, 0, "")%>
	</div>
	<div id="songlist">
<%
ShowContentH2 "歌曲列表"

Dim GrestestShowSongRS
SetRS GrestestShowSongRS, Conn, "SELECT * FROM [Album_GreatestSong] WHERE GreatestID=" & GreatestShowRS("GreatestID") & " ORDER BY MusicNum"
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
					<td>总数：<%=GrestestShowSongRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
Dim i
For i=1 To GrestestShowSongRS.RecordCount
%>
				<tr<%=ChangeColor(i)%>>
					<td><%=GrestestShowSongRS("MusicNum")%></td>
					<td><%=GrestestShowSongRS("MusicName")%></td>
					<td><a href="../music/lyricshow.asp?lyric=<%=GrestestShowSongRS("MusicName")%>"><img src="../images/go.gif" class="config" alt="查看歌词" /></a></td>
					<td><a href="../music/listenshow.asp?listen=<%=GrestestShowSongRS("MusicName")%>"><img src="../images/go.gif" class="config" alt="在线试听" /></a></td>
				</tr>
<%
	GrestestShowSongRS.MoveNext
Next
Set i=Nothing
%>
			</tbody>
		</table>
<%
CloseRS GrestestShowSongRS

CloseRS GreatestShowRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

ReDim liarray(2)
liarray(1)="<a href=""#greatestinfo"">专辑信息</a>"
liarray(2)="<a href=""#greatestsong"">歌曲列表</a>"

ShowContentPanel "跳转", liarray

Dim GreatestRS
SetRS GreatestRS, Conn, "SELECT GreatestName FROM Album_Greatest ORDER BY GreatestID DESC"
ReDim liarray(GreatestRS.RecordCount)
Dim j
For j=1 To GreatestRS.RecordCount
	liarray(j)="<a href=""greatestshow.asp?greatest=" & CheckStr(GreatestRS("GreatestName")) & """>" & GreatestRS("GreatestName") & "</a>"
	GreatestRS.MoveNext
Next
CloseRS GreatestRS
Set j=Nothing

ShowContentPanel "导航", liarray
%>
</div>
<!-- #include file="../footer.asp" -->