<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
Response.Buffer=True
Session.Timeout=20
Session.CodePage=65001

'网站内容主数据库
Const DbName="/../database/mltr.cn v2/mltrcn.mdb"
'网站新闻数据库
Const NewsDbName="/../database/mltr.cn v2/news.mdb"
'网站Cookie名称
Const CookieName="pfw"
'网站用户表
Const BBSDbName="/../database/mltr.cn v2/bbs.mdb"

Dim RSNumber
Dim StartTime:StartTime=Timer()

if Request.QueryString("cache")="clean" then
	Application.Contents.RemoveAll()
end if

'数据库连接
Dim Conn, NewsConn, BBSConn
'On Error Resume Next
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(DbName)
Conn.Open
Set NewsConn=Server.CreateObject("ADODB.Connection")
NewsConn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(NewsDbName)
NewsConn.Open
Set BBSConn=Server.CreateObject("ADODB.Connection")
BBSConn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(BBSDbName)
BBSConn.Open
If Err Then
	err.Clear
	Set Conn=Nothing
	Set BBSConn=Nothing
	Response.Write "Site Updating, Visite A Moment Later Please."
	Response.End
End If

'检查登陆状态
Dim UserName, UserPassword, UserIsPassed, UserValue
UserName=CheckStr(Request.Cookies(CookieName)("UserName"))
UserPassword=CheckStr(Request.Cookies(CookieName)("UserPassword"))
UserIsPassed=CheckStr(Request.Cookies(CookieName)("UserIsPassed"))
IF UserName<>Empty Then '存在Cookie，进行身份验证
	Dim CheckCookie
	Set CheckCookie=BBSConn.Execute("SELECT [UserName], [UserPassword] FROM [Dv_User] WHERE [UserName]='" & UserName & "' AND [UserPassword]='" & UserPassword & "'")
	IF (CheckCookie.EOF AND CheckCookie.BOF) Then '身份验证失败，清空Cookie
		Response.Cookies(CookieName)("UserName")=Empty
		Response.Cookies(CookieName)("UserPassword")=Empty
		Request.Cookies(CookieName)("UserIsPassed")=Empty
		Session("UserValue")=Empty
		UserName=Empty
		UserPassword=Empty
		UserIsPassed=Empty
		UserValue=Empty
	Elseif UserIsPassed="Passed" And CheckAdmin(UserName, UserPassword)=TRUE Then
		Session("UserValue")="Admin"
		UserValue=Session("UserValue")
	End If
	CloseRS CheckCookie
End IF

Dim Plugin '标示主栏目变量
Dim CateRoot
Dim Cate '标示次栏目变量
Dim title '页面Title
Dim headline

'系统设置读取
Dim ConfigRS
SetRS ConfigRS, Conn, "SELECT * FROM [Site_Config]"
Dim SiteName, SiteCName, SiteURL, SiteMail, SiteVersion, SiteFolder, SiteCopyYear, SiteTitle, SiteCheckSpam, SiteCommentLength, MusicListenFolder, PhotoFolder, NewsUpFileFolder, NewsUpFileSize, NewsUpFileType
SiteName=ConfigRS("SiteName")
SiteCName=ConfigRS("SiteCName")
SiteURL=ConfigRS("SiteURL")
SiteMail=ConfigRS("SiteMail")
SiteVersion=ConfigRS("SiteVersion")
SiteFolder=ConfigRS("SiteFolder")
SiteCopyYear=ConfigRS("SiteCopyYear")
SiteTitle=ConfigRS("SiteTitle")
SiteCheckSpam=ConfigRS("SiteCheckSpam")
SiteCommentLength=ConfigRS("SiteCommentLength")
MusicListenFolder=ConfigRS("MusicListenFolder")
PhotoFolder=ConfigRS("PhotoFolder")
NewsUpFileFolder=ConfigRS("NewsUpFileFolder")
NewsUpFileSize=ConfigRS("NewsUpFileSize")
NewsUpFileType=ConfigRS("NewsUpFileType")
CloseRS ConfigRS
%>