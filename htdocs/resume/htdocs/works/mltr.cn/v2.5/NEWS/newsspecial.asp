<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="news"
CateRoot="news"
Cate="special"
%>
<!-- #include file="../header.asp" -->
<%
'排序
Dim SQLOrderby
Dim OrderbyTitle, OrderbyDate, OrderbyComment, OrderbyCount
OrderbyTitle=Orderby("title", "SpecialTitle", 0)
OrderbyDate=Orderby("date", "SpecialDate", 2)
OrderbyCount=Orderby("count", "CountSpecial", 0)

Dim SpecialCateRS
SetRS SpecialCateRS, Conn, "SELECT * FROM News_Special ORDER BY " & SQLOrderby
%>
<div id="bodier">
	<div id="list">
<%
ShowPagebar 10, SpecialCateRS
%>
		<table class="list">
			<caption>专题列表</caption>
			<colgroup>
				<col class="no" />
				<col class="title" />
				<col class="date" />
				<col class="click" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" id="no">&nbsp;</th>
					<th scope="col" id="title"><a href="<%=OrderbyTitle%>">专题标题</a></th>
					<th scope="col" id="time"><a href="<%=OrderbyDate%>">发表日期</a></th>
					<th scope="col" id="count"><a href="<%=OrderbyCount%>">点击</a></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="3">&nbsp;</td>
					<td colspan="1">总数：<%=SpecialCateRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
Dim i
For i=1 To SpecialCateRS.PageSize
%>
				<tr<%=ChangeColor(i)%>>
					<th scope="row"><%=i%></td>
					<td><a href="<%=SpecialCateRS("SpecialURL")%>"><%=SpecialCateRS("SpecialTitle")%></a></td>
					<td><%=SpecialCateRS("SpecialDate")%></td>
					<td><%=SpecialCateRS("CountSpecial")%></td>
				</tr>
<%
	SpecialCateRS.MoveNext
	If SpecialCateRS.EOF Then Exit For
Next
Set i=Nothing
%>
			<tbody>
		</table>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->