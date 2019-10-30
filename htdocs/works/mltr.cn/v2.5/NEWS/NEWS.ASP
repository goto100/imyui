<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="news"
CateRoot="news"
Cate=Request.QueryString("cate")
%>
<!-- #include file="../header.asp" -->
<%
'排序
Dim SQLOrderby
Dim OrderbyTitle, OrderbyTime, OrderbyComment, OrderbyCount
OrderbyTitle=Orderby("title", "NewsTitle", 0)
OrderbyTime=Orderby("time", "NewsTime", 2)
OrderbyComment=Orderby("comment", "CountComment", 0)
OrderbyCount=Orderby("count", "CountNews", 0)

If Cate<>Empty Then
	'读取新闻分类
	Dim NewsCateRS
	Set NewsCateRS=NewsConn.Execute("SELECT * FROM News_Cate WHERE CateName='" & Cate & "'")
	
	'新闻读取
	Dim NewsRS
	SetRS NewsRS, NewsConn, "SELECT NewsID, NewsTitle, NewsTime, CountComment, CountNews FROM News_Content WHERE CateName='" & NewsCateRS("CateName") & "' ORDER BY " & SQLOrderby
Else
	'无栏目新闻读取
	SetRS NewsRS, NewsConn, "SELECT NewsID, NewsTitle, NewsTime, CountComment, CountNews FROM News_Content ORDER BY " & SQLOrderby
End If

%>
<div id="bodier">
	<div id="pagebar">
<%
ShowPagebar 10, NewsRS
%>
	</div>
	<div id="list">
		<table class="list">
			<caption>新闻列表</caption>
			<colgroup>
				<col class="no" />
				<col class="title" />
				<col class="time" />
				<col class="comment" />
				<col class="count" />
			</colgroup>
			<thead>
				<tr>
					<th class="no">&nbsp;</th>
					<th class="title"><a href="<%=OrderbyTitle%>">新闻标题</a></th>
					<th class="time"><a href="<%=OrderbyTime%>">发表日期</a></th>
					<th class="comment"><a href="<%=OrderbyComment%>">评</a></th>
					<th class="count"><a href="<%=OrderbyCount%>">点击</a></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td colspan="2">总数：<%=NewsRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
Dim i
For i=1 To NewsRS.PageSize
%>
				<tr<%=ChangeColor(i)%>>
					<td><%=i%></td>
					<td><a href="newsshow.asp?newsid=<%=NewsRS("NewsID")%>"><%=NewsRS("NewsTitle")%></a></td>
					<td><%=left(NewsRS("NewsTime"), InStr(NewsRS("NewsTime"), " "))%></td>
					<td><%=NewsRS("CountComment")%></td>
					<td><%=NewsRS("CountNews")%></td>
				</tr>
<%
	NewsRS.MoveNext
	If NewsRS.EOF Then Exit For
Next
Set i=Nothing
%>
			<tbody>
		</table>
	</div>
</div>
<div id="sidebar">
<%
ShowContentH2 "页面功能"

ShowContentCateList

If UserValue="Admin" Then
	ShowContentPanel "管理员", "<p><a href=""newspost.asp"">发布</a></p>"
End If
%>
</div>
<!-- #include file="../footer.asp" -->