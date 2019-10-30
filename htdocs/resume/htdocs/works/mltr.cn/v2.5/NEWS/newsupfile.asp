<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/upfile.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
body{margin:0;padding:0;}
</style>
</head>
<body>
<%
IF Request.QueryString("action")="upload" Then
	Dim upl
	Set upl=Server.CreateObject("Scripting.FileSystemObject")
	Dim D_Name, F_Name
	'建立月份文件夹
	D_Name="month_" & DateToStr(Now(), "YYYYMM", "")
	IF upl.FolderExists(ConfigRS("NewsUpFileFolder" & D_Name))=False Then
		upl.CreateFolder ConfigRS("NewsUpFileFolder" & D_Name)
	End IF
	Dim FileUP
	Set FileUP=New Upload_File
	FileUP.GetDate(-1)
	Dim F_File
	Set F_File=FileUP.File("File")
	F_Name=Left(DateToStr(Now(), "DD_hhmmss", "") & "_" & RandomString(4) & RemoveSpecialChars(F_File.FileName), 120)
	IF F_File.FileSize > Int(NewsUpFileSize) Then
		Response.Write("<a href='javascript:history.go(-1);'>超出文件大小限制。返回</a>")
	ElseIF IsvalidFile(UCase(F_File.FileExt)) = False Then
		Response.Write("<a href='javascript:history.go(-1);'>不允许此文件类型。返回</a>")
	Else
		F_File.SaveToFile NewsUpFileFolder & D_Name & "/" & F_Name
		Select Case F_File.FileExt
		Case "gif","jpg","bmp","png","tif"
			Response.Write("<script type=""text/javascript"">parent.newsform.newscontent.value+='\n[img]" & NewsUpFileFolder & D_Name & "/" & F_Name & "[/img]'</script>")
		Case "swf"
			Response.Write("<script type=""text/javascript"">parent.newsform.newscontent.value+='\n[swf]" & NewsUpFileFolder & D_Name & "/" & F_Name & "[/swf]'</script>")
		Case "wma","mp3","avi","wmv","asf"
			Response.Write("<script type=""text/javascript"">parent.newsform.newscontent.value+='\n[wmp]" & NewsUpFileFolder & D_Name & "/" & F_Name & "[/wmp]'</script>")
		Case "ra","rm","rmvb"
			Response.Write("<script type=""text/javascript"">parent.newsform.newscontent.value+='\n[rm]" & NewsUpFileFolder & D_Name & "/" & F_Name & "[/rm]'</script>")
		Case "mov"
			Response.Write("<script type=""text/javascript"">parent.newsform.newscontent.value+='\n[qt]" & NewsUpFileFolder & D_Name & "/" & F_Name & "[/qt]'</script>")
		Case Else
			Response.Write("<script type=""text/javascript"">parent.newsform.message.value+='\n[file=" & NewsUpFileFolder & D_Name & "/" & F_Name & "]Click to Download[/file]'</script>")
		End Select
		Response.Write("<a href='javascript:history.go(-1);'>文件已上传。返回</a>")
	End IF
	Set FileUP=Nothing
	Set upl=Nothing
Else
	Response.Write("<form enctype=""multipart/form-data"" method=""post"" action=""newsupfile.asp?action=upload""><td><input type=""File"" name=""File" id=""File"" style=""font-size:12px;"" size=""50""><input type=""Submit"" name=""Submit"" value=""Upload"" class=""button"" ></td></form>")
End if

'Check File name
Function RemoveSpecialChars(str)
	Dim re
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="[^_\.a-zA-Z\d]"
	RemoveSpecialChars=re.Replace(str,"")
	set re=nothing
End Function

'Check upload file types
Function IsvalidFile(File_Type)
	Dim GName,UP_FileType
	UP_FileType=Split(NewsUpFileType, ",")
	IsvalidFile = False
	For Each GName in UP_FileType
		If File_Type = GName Then
			IsvalidFile = True
			Exit For
		End If
	Next
End Function
%></tr></table>
</body>
</html>
