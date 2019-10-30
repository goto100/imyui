<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="music"
CateRoot="music"
Cate="lyric"
%>
<!-- #include file="../header.asp" -->
<%
Dim SQLOrderby
Dim OrderbyName, OrderbyCount, OrderbyAlbum
OrderbyName=Orderby("name", "MusicName", 1)
OrderbyAlbum=Orderby("album", "MusicAlbum", 0)
OrderbyCount=Orderby("count", "CountLyric", 0)

'歌词内容连接
Dim LyricRS
SetRS LyricRS, Conn, "SELECT MusicName, MusicAlbum, MusicLyric, CountLyric FROM Music_Content WHERE MusicLyric<>Null AND MusicLyric<>'' ORDER BY " & SQLOrderby
%>
<div id="bodier">
	<div id="list">
<%
ShowPagebar 10, LyricRS
%>
		<table class="list">
			<thead>
				<tr>
					<th class="no">&nbsp;</td>
					<th class="name"><a href="<%=OrderbyName%>">歌曲名称</a></th>
					<th class="album"><a href="<%=OrderbyAlbum%>">所属专辑</a></th>
					<th class="count"><a href="<%=OrderbyCount%>">点击</a></th>
					<th class="see">查看歌词</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td colspan="2">总数：<%=LyricRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
Dim i
For i=1 To LyricRS.PageSize
%>
				<tr<%=ChangeColor(i)%>>
					<td><%=i%></td>
					<td><%=LyricRS("MusicName")%></td>
					<td><%=LyricRS("MusicAlbum")%></td>
					<td><%=LyricRS("CountLyric")%></td>
					<td><a href="lyricshow.asp?lyric=<%=LyricRS("MusicName")%>"><img src="../images/go.gif" class="config" alt="查看歌词" /></a></td>
				</tr>
<%
	LyricRS.MoveNext
	If LyricRS.EOF Then Exit For
Next
Set i=Nothing
%>
			</tbody>
		</table>
	</div>
</div>
<%
CloseRS LyricRS
Set OrderbyName=Nothing
Set OrderbyAlbum=Nothing
Set OrderbyCount=Nothing
Set SQLOrderby=Nothing
%>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->