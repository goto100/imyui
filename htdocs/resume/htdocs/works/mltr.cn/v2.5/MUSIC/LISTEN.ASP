<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="music"
CateRoot="music"
Cate="listen"
%>
<!-- #include file="../header.asp" -->
<script type="text/javascript">
window.onload=function()
{
	switchCell(1)
}
</script>
<%
Dim SQLOrderby
Dim OrderbyName,OrderbyCount,OrderbyAlbum
OrderbyName=Orderby("name","MusicName",1)
OrderbyAlbum=Orderby("album","MusicAlbum",0)
OrderbyCount=Orderby("count","CountListen",0)
'试听内容连接
Dim ListenRS
SetRS ListenRS, Conn, "SELECT MusicName, MusicAlbum, Listen, CountListen FROM Music_Content WHERE Listen=TRUE ORDER BY " & SQLOrderby
%>
<div id="bodier">
	<div id="list">
		<ul class="pagebar">
<%
Dim i
For i=1 To ListenRS.PageCount
%>
		<li class="tab-off" id="navcell" onclick="switchCell(<%=i%>)" name="navcell"><%=i%></li>
<%
Next
%>
		<li class="total">共<%=ListenRS.PageCount%>页</li>
		</ul>
		<table class="list">
			<form method="post" id="listenform" target="_pop" action="listenshow.asp?listen=more">
			<thead>
				<tr>
					<th class="no">&nbsp;</td>
					<th class="select">&nbsp;</th>
					<th class="name"><a href="<%=OrderbyName%>">歌曲名称</a></th>
					<th class="album"><a href="<%=OrderbyAlbum%>">所属专辑</a></th>
					<th class="count"><a href="<%=OrderbyCount%>">点击</a></th>
					<th class="play">在线试听</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4">
						<input type="button" value="全选" onclick="SelectAll(this.form)"class="button" />
						<input type="button" value="清除" onclick="SelectCancelAll(this.form)" class="button" />
						<input type="button" value="反选" onclick="SelectOthers(this.form)" class="button" />
						<input type="submit" name="musiclisten" id="musiclisten" value="提交" class="button" />
					</td>
					<td colspan="2">总数：<%=ListenRS.RecordCount%></td>
				</tr>
			</tfoot>
<%
	For i=1 To ListenRS.PageCount
%>
			<tbody id="tb" name="tb">
<%
		Dim j
		For j=1 To ListenRS.PageSize
%>
				<tr<%=ChangeColor(j)%>>
					<td><%=j%></td>
					<td><input type="checkbox" name="musicname" id="musicname" value="<%=ListenRS("MusicName")%>" /></td>
					<td><%=ListenRS("MusicName")%></td>
					<td><%=ListenRS("MusicAlbum")%></td>
					<td><%=ListenRS("CountListen")%></td>
					<td><a href="#"><img src="../images/go.gif" class="config" alt="在线试听" onclick="window.open('listenshow.asp?listen=<%=Replace(ListenRS("MusicName"),"'","\'")%>','','width=300, height=380')" /></a></td>
				</tr>
<%
			ListenRS.MoveNext
			If ListenRS.EOF Then Exit For
		Next
%>
			</tbody>
<%
	Next
	Set i=Nothing
	Set j=Nothing
%>
			</form>
		</table>
	</div>
<script type="text/javascript">
ShowPopWindow();
</script>
</div>
<div id="sidebar">
<%
ShowContentCateList

ShowContentPanel "播放软件", "<p><a href=""http://www.microsoft.com/windows/windowsmedia/cn/mp10/default.aspx"" rel=""external"" ><img src=""../images/content_wmp10.gif"" alt=""Get Windows Media Player!"" /></a></p>"

ListenRS.Close
Set ListenRS=Nothing
Set OrderbyName=Nothing
Set OrderbyAlbum=Nothing
Set OrderbyCount=Nothing
Set SQLOrderby=Nothing
%>
</div>
<!-- #include file="../footer.asp" -->