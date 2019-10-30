<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="download"
CateRoot="download"
Cate=Request.QueryString("cate")
%>
<!-- #include file="../header.asp" -->
<%
Dim SQLOrderby
Dim OrderbyName, OrderbyFrom, OrderbyDate, OrderbyCount
OrderbyName=Orderby("name", "DownloadName", 0)
OrderbyFrom=Orderby("from", "DownloadFrom", 0)
OrderbyDate=Orderby("date", "DownloadDate", 2)
OrderbyCount=Orderby("count", "CountDownload", 0)

Dim DownloadRS
SetRS DownloadRS, Conn, "SELECT * FROM Download_Content WHERE CateName= '" & cate & "' ORDER BY " & SQLOrderby
%>
<div id="bodier">
<%
If DownloadRS.BOF And DownloadRS.EOF Then
%>
	<p class="warning">即将推出&nbsp;敬请期待</p>
<%
Else
%>
	<div id="pagebar">
<%
ShowPagebar 10, DownloadRS
%>
	</div>
	<div id="list">
		<p class="note">请不要在新窗口中打开链接，直接点击链接或点击右键选择“使用Flashget下载即可正常下载。”</p>
		<table class="list">
			<thead>
				<tr>
					<th class="no">&nbsp;</td>
					<th class="name"><a href="<%=OrderbyName%>">下载名称</a></th>
					<th class="from"><a href="<%=OrderbyFrom%>">来源</a></th>
					<th class="date"><a href="<%=OrderbyDate%>">添加日期</a></th>
					<th class="count"><a href="<%=OrderbyCount%>">点击</a></th>
					<th class="download">点击下载</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4">&nbsp;</td>
					<td colspan="2">总数：<%=DownloadRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
		Dim i
		For i=1 To DownloadRS.PageSize
%>
				<tr<%=ChangeColor(i)%>>
					<td><%=i%></td>
					<td><%=DownloadRS("DownloadName")%><%if UserValue="Admin" then%> <a href="downloadedit.asp?catename=<%=Request.QueryString("cate")%>&amp;downloadname=<%=DownloadRS("DownloadName")%>">edit</a><%end if%></td>
					<td><a href="<%=DownloadRS("DownloadLink")%>"><%=DownloadRS("DownloadFrom")%></a></td>
					<td><%=DownloadRS("DownloadDate")%></td>
					<td><%=DownloadRS("CountDownload")%></td>
					<td><a href="downloadshow.asp?<%=cate%>=<%=Server.URLEncode(DownloadRS("DownloadName"))%>"><img src="../images/go.gif" class="config" alt="下载" /></a></td>
				</tr>
<%
		If DownloadRS("DownloadInfo")<>Empty Then
%>
				<tr class="note">
					<td colspan="6"><%=DownloadRS("DownloadInfo")%></td>
				</tr>
<%
		End If
		DownloadRS.MoveNext
		If DownloadRS.EOF Then Exit For
	Next
	Set i=Nothing
%>
			</tbody>
		</table>
<%
	CloseRS DownloadRS
	Set OrderbyName=Nothing
	Set OrderbyFrom=Nothing
	Set OrderbyDate=Nothing
	Set OrderbyCount=Nothing
	Set SQLOrderby=Nothing
End If
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

ShowContentPanel "下载软件", "<p><a href=""http://www.flashget.com/"" rel=""external"" ><img src=""../images/content_flashget.gif"" alt=""Get FlashGet!"" /></a></p>"
ShowContentPanel "播放软件", "<p><a href=""http://www.microsoft.com/windows/windowsmedia/cn/mp10/default.aspx"" rel=""external"" ><img src=""../images/content_wmp10.gif"" alt=""Get Windows Media Player!"" /></a><a href=""http://www.real.com/"" rel=""external"" ><img src=""../images/content_real.gif"" alt=""Get RealPlayer!"" /></a></p>"
%>
</div>
<!-- #include file="../footer.asp" -->