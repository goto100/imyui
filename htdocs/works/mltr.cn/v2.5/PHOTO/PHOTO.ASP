<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="photo"
CateRoot="photo"
Cate=Request.QueryString("cate")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="list">
<%
PhotoFolder="../" & PhotoFolder & Cate & "/"
Dim FilePageSize:FilePageSize=12
Dim FSO, FileObj
Set FSO=CreateObject("Scripting.FileSystemObject")
Set FileObj=FSO.GetFolder(server.MapPath(PhotoFolder))

Dim i, j, k, file
Dim FileArray
ReDim FileArray(0)
i=0
For Each file In FileObj.Files
	FileArray(i)=file.Name
	i=i+1
	ReDim Preserve FileArray(i)
Next

Dim FileTotal:FileTotal=UBound(FileArray)-1

Dim FilePageCount:FilePageCount=Int(FileTotal/FilePageSize)+1
Dim FilePageArray
ReDim FilePageArray(FilePageCount, FilePageSize)

i=0
Do Until i>FileTotal
	For j=0 To FilePageCount-1
		For k=0 To FilePageSize-1
			FilePageArray(j, k)=FileArray(i)
			i=i+1
			If i>FileTotal Then Exit For
		Next
		If i>FileTotal Then Exit For
	Next
Loop

Dim FileThisPage
FileThisPage=Request.QueryString("page")
If FileThisPage=Empty Then
	FileThisPage=1
End If

ShowPagebar FilePageSize, FilePageArray
For i=0 To FilePageSize
	If FilePageArray(FileThisPage-1, i)=Empty Then Exit For
%>
				<a href="../show.asp?pic=<%=PhotoFolder & FilePageArray(FileThisPage-1, i)%>"><img src="<%=PhotoFolder & FilePageArray(FileThisPage-1, i)%>" onload="javascript:changesize(this, 150, 150);" /></a>
<%
Next
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->