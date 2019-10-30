<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
if Request.QueryString("act")="submit" then
	Conn.Execute("INSERT INTO Download_Content (CateName, DownloadName, DownloadFrom, DownloadLink, DownloadInfo, DownloadURL) VALUES ('" & Request.Form("CateName") & "', '" & Request.Form("DownloadName") & "', '" & Request.Form("DownloadFrom") & "', '" & Request.Form("DownloadLink") & "', '" & Request.Form("DownloadInfo") & "', '" & Request.Form("DownloadURL") & "')")
	Response.Write("Done")
else
%>
	<form method="post" action="?act=submit"><br />
	CateName<input type="text" name="CateName" /><br />
	DownloadName<input type="text" name="DownloadName" /><br />
	DownloadFrom<input type="text" name="DownloadFrom" /><br />
	DownloadLink<input type="text" name="DownloadLink" /><br />
	DownloadInfo<input type="text" name="DownloadInfo" /><br />
	DownloadURL<input type="text" name="DownloadURL" /><br />
	<input type="submit" />
</form>
<%
end if
%>