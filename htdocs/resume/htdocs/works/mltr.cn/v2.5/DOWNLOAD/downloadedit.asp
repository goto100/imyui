<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<%
if Request.QueryString("act")="submit" then
	Conn.Execute("UPDATE Download_Content SET CateName='"&Request.Form("CateName")&"', DownloadName='"&Request.Form("DownloadName")&"', DownloadFrom='"&Request.Form("DownloadFrom")&"', DownloadLink='"&Request.Form("DownloadLink")&"', DownloadInfo='"&Request.Form("DownloadInfo")&"', DownloadURL='"&Request.Form("DownloadURL")&"' WHERE DownloadName='"&Request.QueryString("downloadname")&"' AND CateName='"&Request.QueryString("catename")&"'")
	Response.Write("Done")
elseif Request.QueryString("act")="delete" then
	Conn.Execute("DELETE Download_Content WHERE DownloadName='"&Request.QueryString("downloadname")&"' AND CateName='"&Request.QueryString("catename")&"'")
	Response.Write("Done")
else
	dim downloadRS
	downloadRS = Conn.Execute("SELECT * FROM Download_Content WHERE DownloadName='"&Request.QueryString("downloadname")&"' AND CateName='"&Request.QueryString("catename")&"'")
%>
	<form method="post" action="?act=submit&amp;catename=<%=Request.QueryString("catename")%>&amp;downloadname=<%=Request.QueryString("downloadname")%>"><br />
	CateName<input type="text" name="CateName" value="<%=downloadRS("CateName")%>" /><br />
	DownloadName<input type="text" name="DownloadName" value="<%=HTMLEncode(downloadRS("DownloadName"))%>" /><br />
	DownloadFrom<input type="text" name="DownloadFrom" value="<%=HTMLEncode(downloadRS("DownloadFrom"))%>" /><br />
	DownloadLink<input type="text" name="DownloadLink" value="<%=HTMLEncode(downloadRS("DownloadLink"))%>" /><br />
	DownloadInfo<input type="text" name="DownloadInfo" value="<%=HTMLEncode(downloadRS("DownloadInfo"))%>" /><br />
	DownloadURL<input type="text" name="DownloadURL" value="<%=HTMLEncode(downloadRS("DownloadURL"))%>" /><br />
	<input type="submit" />
</form>
<a href="?act=delete&amp;catename=<%=Request.QueryString("catename")%>&amp;downloadname=<%=Request.QueryString("downloadname")%>">Delete This</a>
<%
end if
%>