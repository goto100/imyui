<%
'--------------------
'Common Function
'--------------------
'ConnDatabase
Sub SetConn(conn, db)
	Set conn=Server.CreateObject("ADODB.Connection")
	conn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(db)
	conn.Open
	RSNumber=0
End Sub
'SetRS
Sub SetRS(rs, conn, sql)
	Set rs=Server.CreateObject("Adodb.Recordset")
	rs.Open sql, conn, 1, 3
	RSNumber=RSNumber+1
End Sub
'CloseRS
Sub CloseRS(rs)
	rs.Close
	Set rs=Nothing
End Sub
'查找用户ID
Function FindUserID(username)
	Dim RS
	Set RS=BBSConn.Execute("SELECT UserID FROM Dv_User WHERE UserName='" & username & "'")
	If RS.BOF And RS.EOF Then
		FindUserID=0
	Else
		FindUserID=RS("UserID")
	End If
	CloseRS RS
End Function

'用户登录
Function CheckUser(username, password)
	If username=Empty Or password=Empty Then
	'没有填写完整
	CheckUser="notenough"
	Else
		Dim tempUserLogin
		SetRS tempUserLogin, BBSConn, "SELECT UserName, UserPassword FROM Dv_User WHERE UserName='" & CheckStr(Request.Form("username")) & "' AND UserPassword='" & md5(Trim(CheckStr(Request.Form("password"))), 16) & "'"

		IF tempUserLogin.EOF AND tempUserLogin.BOF Then
		'用户名密码错误
		CheckUser="passwrong"
		Else
			Response.Cookies(CookieName)("UserName")=tempUserLogin("UserName")
			Response.Cookies(CookieName)("UserPassword")=tempUserLogin("UserPassword")
			Response.Cookies(CookieName)("UserIsPassed")="Passed"

			If CheckAdmin(username, password)=TRUE Then
				Session("UserValue")="Admin"
			End If

			'成功登陆
			CheckUser="succeful"
		End IF
		CloseRS tempUserLogin
	End If
End Function

'IsAdmin
Function CheckAdmin(username, password)
	Dim tempCheckAdmin
	Set tempCheckAdmin=BBSConn.Execute("SELECT username, password FROM Dv_Admin WHERE username='" & username & "' AND password='" & password & "'")
	If tempCheckAdmin.BOF And tempCheckAdmin.EOF Then
		CheckAdmin=False
	Else
		CheckAdmin=True
	End If
	CloseRS tempCheckAdmin
End Function
'返回QueryString
Function CheckQuery(strquery, whatstr)
	Dim query
	query=Request.ServerVariables("Query_String")
	If Right(query, 1)="&" Then
		query=Left(query, Len(query)-1)
	End If
	If InStr(query, strquery)>=1 Then
	Dim re
	Set re=New RegExp '建立一个新对像
	re.IgnoreCase=False '搜索是否区分大小写的
	re.Global=True '搜索是否应用于整个字符串
	re.Pattern=strquery & "=([^\&]*)"
	CheckQuery="?" & re.replace(query, strquery & "=" & whatstr)
	ElseIf query=Empty Then
		CheckQuery="?" & strquery & "=" & whatstr
	Else
		CheckQuery="?" & query & "&amp;" & strquery & "=" & whatstr
	End If
	Set query=Nothing
End Function

'下载文件
function DownloadFile(strFile)
	Response.Redirect strFile
End Function 
'排序
Function Orderby(inadd, insql, isdefault)
	If Request.QueryString("orderby")=inadd Then
		Orderby=CheckQuery("orderby", inadd & "desc")
		SQLOrderby=insql
	Elseif Request.QueryString("orderby")=inadd & "desc" Then
		Orderby=CheckQuery("orderby", inadd)
		SQLOrderby=insql & " DESC"
	Elseif Request.QueryString("orderby")<>Empty Then
		Orderby=CheckQuery("orderby", inadd)
	Elseif Request.QueryString("orderby")=Empty And isdefault=1 Then '默认的排序
		Orderby=CheckQuery("orderby", inadd & "desc")
		SQLOrderby=insql
	Elseif Request.QueryString("orderby")=Empty And isdefault=2 Then '默认的反向排序
		Orderby=CheckQuery("orderby", inadd)
		SQLOrderby=insql & " DESC"
	Else Orderby=CheckQuery("orderby", inadd)
	End If
End Function
'CheckStr
Function CheckStr(byVal Chkstr)
	Dim Str, re
	Str=Trim(Chkstr)
	IF isnull(Str) Then
		CheckStr = ""
		Exit Function 
	End IF
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True
	re.Pattern="(\r\n){3, }"
	str=re.Replace(str, "$1$1$1")
	set re=nothing

	Str = Replace(Str, "'", "''", 1, -1, 0)
	Str = Replace(Str, "select", "sel&#101;ct", 1, -1, 0)
	Str = Replace(Str, "join", "jo&#105;n", 1, -1, 0)
	Str = Replace(Str, "union", "un&#105;on", 1, -1, 0)
	Str = Replace(Str, "where", "wh&#101;re", 1, -1, 0)
	Str = Replace(Str, "insert", "ins&#101;rt", 1, -1, 0)
	Str = Replace(Str, "delete", "del&#101;te", 1, -1, 0)
	Str = Replace(Str, "update", "up&#100;ate", 1, -1, 0)
	Str = Replace(Str, "like", "lik&#101;", 1, -1, 0)
	Str = Replace(Str, "drop", "dro&#112;", 1, -1, 0)
	Str = Replace(Str, "create", "cr&#101;ate", 1, -1, 0)
	Str = Replace(Str, "modify", "mod&#105;fy", 1, -1, 0)
	Str = Replace(Str, "rename", "ren&#097;me", 1, -1, 0)
	Str = Replace(Str, "alter", "alt&#101;r", 1, -1, 0)
	Str = Replace(Str, "cast", "ca&#115;t", 1, -1, 0)
	CheckStr=Trim(Str)
End Function
'Reverse Stripped strings back
Function UnCheckStr(Str)
		Str=Replace(Str, "sel&#101;ct", "select", 1, -1, 0)
		Str=Replace(Str, "jo&#105;n", "join", 1, -1, 0)
		Str=Replace(Str, "un&#105;on", "union", 1, -1, 0)
		Str=Replace(Str, "wh&#101;re", "where", 1, -1, 0)
		Str=Replace(Str, "ins&#101;rt", "insert", 1, -1, 0)
		Str=Replace(Str, "del&#101;te", "delete", 1, -1, 0)
		Str=Replace(Str, "up&#100;ate", "update", 1, -1, 0)
		Str=Replace(Str, "lik&#101;", "like", 1, -1, 0)
		Str=Replace(Str, "dro&#112;", "drop", 1, -1, 0)
		Str=Replace(Str, "cr&#101;ate", "create", 1, -1, 0)
		Str=Replace(Str, "mod&#105;fy", "modify", 1, -1, 0)
		Str=Replace(Str, "ren&#097;me", "rename", 1, -1, 0)
		Str=Replace(Str, "alt&#101;r", "alter", 1, -1, 0)
		Str=Replace(Str, "ca&#115;t", "cast", 1, -1, 0)
		UnCheckStr=Str
End Function
'Encode text into HTML Format
Function HTMLEncode(byVal reString)
	Dim Str:Str=reString
	IF Not isnull(Str) Then
		Str=UnCheckStr(Str)
		Str = replace(Str, "&", "&amp;", 1, -1, 0)
		Str = replace(Str, ">", "&gt;", 1, -1, 0)
		Str = replace(Str, "<", "&lt;", 1, -1, 0)
		Str = Replace(Str, CHR(9), "&nbsp;&nbsp;", 1, -1, 0)
		Str = Replace(Str, CHR(34), "&quot;", 1, -1, 0)
		Str = Replace(Str, CHR(39), "&#39;", 1, -1, 0)
		Str = Replace(Str, CHR(13), "", 1, -1, 0)
		Str = Replace(Str, CHR(10), "<br />", 1, -1, 0)
		HTMLEncode = Str
	End IF
End Function
'Format Date Time
Function DateToStr(byRef DateTime, byVal ShowType, byVal TimeZone)
	Dim DateYear, DateMonth, DateDay, DateHour, DateMinute, DateSecond, DateAMPM
	DateToStr=ShowType
	DateYear=Year(DateTime)
	DateMonth=Month(DateTime)
	DateDay=Day(DateTime)
	DateHour=Hour(DateTime)
	DateMinute=Minute(DateTime)
	DateSecond=Second(DateTime)
	IF Len(DateMonth)<2 Then DateMonth="0" & DateMonth
	IF Len(DateDay)<2 Then DateDay="0" & DateDay
	If instr(ShowType,"AMPM")>0 Then
		If DateHour>12 Then
			DateToStr=Replace(DateToStr,"AMPM","PM")
			DateHour=DateHour-12
		Else
			DateToStr=Replace(DateToStr,"AMPM","AM")
		End IF
	ElseIF Len(DateHour)<2 Then
		DateHour="0" & DateHour	
	End IF
	IF Len(DateMinute)<2 Then DateMinute="0" & DateMinute
	IF Len(DateSecond)<2 Then DateSecond="0" & DateSecond

	DateToStr=Replace(DateToStr,"YYYY",DateYear)
	DateToStr=Replace(DateToStr,"YY",Right(DateYear,2))
	DateToStr=Replace(DateToStr,"MM",DateMonth)
	DateToStr=Replace(DateToStr,"DD",DateDay)
	DateToStr=Replace(DateToStr,"hh",DateHour)
	DateToStr=Replace(DateToStr,"mm",DateMinute)
	DateToStr=Replace(DateToStr,"ss",DateSecond)
	DateToStr=Replace(DateToStr,"TZD",TimeZone)
End Function
'RandomString
Function RandomString(Length)
	Dim i, tempS
	tempS = "abcdefghijklmnopqrstuvwxyz1234567890" 
	RandomString = ""
	If isNumeric(Length) = False Then 
		Exit Function 
	End If 
	For i = 1 To Length 
		Randomize
		RandomString = RandomString & Mid(tempS, Int((Len(tempS) * Rnd) + 1), 1)
	Next 
End Function
'ChangeColor
Function ChangeColor(i)
	If i/(2)=int(i/(2)) Then
		ChangeColor=" class=""c1"""
	Else ChangeColor=" class=""c2"""
	End If
End Function
'GetASPName
Function GetASPName()
	GetASPName=Request.ServerVariables("PATH_INFO")
	GetASPName=Left(GetASPName, Len(GetASPName)-4)
	GetASPName=Mid(GetASPName, InStrRev(GetASPName, "/")+1)
End Function

'--------------------
'Show Function
'--------------------
'PageBar
Sub ShowPagebar(intpagesize, strobj)
	If IsArray(strobj)=True Then
		Dim FilePageSize:FilePageSize=intpagesize '每页个数
		Dim FileThisPage '当前页
		If Request.QueryString("page")=Empty Then
			FileThisPage=1
		Else
			FileThisPage=Request.QueryString("page")
		End If
	Else
		strobj.PageSize=intpagesize
		If Request.QueryString("page")=Empty Then
			strobj.AbsolutePage=1
		Else
			strobj.AbsolutePage=Request.QueryString("page")
		End If
	End If
	Dim objPageSize, objThisPage, objPageCount
	Response.Write("<ul class=""pagebar"">")
	If IsArray(strobj)=True Then
		objThisPage=CInt(FileThisPage) '当前页
		objPageCount=UBound(strobj, 1) '总页数
	Else
		objThisPage=CInt(strobj.AbsolutePage) '当前页
		objPageCount=strobj.PageCount '总页数
	End If
	Dim ShowPageSize, StartPage, EndPage
	ShowPageSize=9
	If objPageCount<=ShowPageSize Then
		StartPage=1
		EndPage=objPageCount
	Else
		If objThisPage<=Int(ShowPageSize/2) Then
			StartPage=1
			EndPage=ShowPageSize
		ElseIf objThisPage>=objPageCount-Int(ShowPageSize/2) Then
			StartPage=objPageCount-ShowPageSize+1
			EndPage=objPageCount
		Else
			StartPage=objThisPage-Int(ShowPageSize/2)
			EndPage=objThisPage+Int(ShowPageSize/2)
		End If
	End If
	If objThisPage-1>0 Then
		Response.Write("<li class=""first""><a href=""" & CheckQuery("page", 1) & """ title=""第一页"">&lt;&lt;</a></li>")
		Response.Write("<li class=""previous""><a href=""" & CheckQuery("page", objThisPage-1) & """ title=""上一页"">&lt;</a></li>")
	Else
		Response.Write("<li class=""first"">&lt;&lt;</li>")
		Response.Write("<li class=""previous"">&lt;</li>")
	End If
	Dim i
	For i=StartPage To EndPage
		If i=CInt(objThisPage) Then
			Response.Write("<li class=""on"">" & i & "</li>")
		Else
			Response.Write("<li><a href=""" & CheckQuery("page", i) & """ title=""第" & i & "页"">" & i & "</a></li>")
		End If
	Next
	Set i=Nothing
	If objThisPage+1<=objPageCount Then
		Response.Write("<li class=""next""><a href=""" & CheckQuery("page", objThisPage+1) & """ title=""下一页"">&gt;</a></li>")
		Response.Write("<li class=""end""><a href=""" & CheckQuery("page", objPageCount) & """ title=""最后一页"">&gt;&gt;</a></li>")
	Else
		Response.Write("<li class=""next"">&gt;</li>")
		Response.Write("<li class=""end"">&gt;&gt;</li>")
	End If
	Response.Write("<li class=""total"">共" & objPageCount & "页</li>")
	Response.Write("</ul>")
End Sub
'Comment
Sub ShowComment(strrs)
	Response.Write("<dt>")
		If strRS("UserID")=0 Then
			Response.Write("<span class=""comm_name"">*" & strrs("UserName") & "</span>")
		Else
			Response.Write("<span class=""comm_name""><a href=""../bbs/dispuser.asp?id=" & strrs("UserID") & """>" & strrs("UserName") & "</a></span>")
		End If
		Response.Write("<span class=""comm_time"">" & strrs("CommentTime") & "</span>" &_
			"<span class=""comm_ip"">IP:" & strrs("UserIP") & "</span>" &_
			"<a href=""javascript:doquote('quote_" & strrs("CommentID") & "','" & strrs("UserName") & "')"" onFocus=""if(this.blur)this.blur()"">"&_
			"<img src=""../images/content_quote.gif"" title=""引用评论"" class=""quote"" /></a>")
		If UserValue="Admin" Then
		Response.Write("<a href=""newscomment.asp?action=del&amp;newsID=" & strrs("NewsID") & "&amp;commentID=" & strrs("CommentID") & """>"&_
			"<img src=""../images/content_del.gif"" title=""删除评论"" class=""del"" /></a>")
		End If
		Response.Write("</dt>" & VbCrLf & "<dd id=""quote_" & strrs("CommentID") & """>" & UbbCode(strrs("CommentContent"), 0, 0, 0, 0, "") & "</dd>" & VbCrLf)
		strrs.MoveNext
End Sub
'Message
Sub ShowAlert(title, content, url, str)
	Select Case content
		Case "novalue"
			content="您没有权限执行此项操作，请返回"
			url="backnorefresh"
	End Select
	Select Case url
		Case "backrefresh" url=Request.ServerVariables("http_referer")
		Case "backnorefresh" url="javascript:history.go(-1);"
		Case "main" url="/main.asp"
	End Select
	If str=Empty Or str="back" Then
		str="返回"
	End If
	Response.Write("<div class=""alert"">" & VbCrLf &_
	"<h2>" & title & "</h2>" & VbCrLf &_
	"<p>" & content & "</p>" & VbCrLf &_
	"<p class=""botton""><a href=""" & url & """>" & str & "</a></p>" & VbCrLf &_
	"</div>" & VbCrLf &_
	"<script type=""text/javascript"">refresh('" & url & "', 5);</script>")
End Sub
'Headline2
Sub ShowContentH2(strH2)
	Response.Write("<h2>" & strH2)
	Response.Write("<a href=""#bodier"" class=""gotop"" title=""回到顶部""><img src=""../images/gotop.gif"" alt=""回到顶部"" /></a></h2>")
End Sub
'ContentCateList
Sub ShowContentCateList
	Response.Write("<div class=""catelist"">" & VbCrLf &_
	"<ul>" & VbCrLf)
	Do Until CateListRS.EOF
		If CateListRS("CateName")=Cate Then
			Response.Write("<li class=""active"">" &_
			"<a href=""" & Replace(CateListRS("CateURL"), "&", "&amp;") & """ title=""" & CateListRS("CateCName") & """>" & CateListRS("CateCName") & "</a>" &_
			"</li>" & VbCrLf)
		Else
			Response.Write("<li>" &_
			"<a href=""" & Replace(CateListRS("CateURL"), "&", "&amp;") & """ title=""" & CateListRS("CateCName") & """>" & CateListRS("CateCName") & "</a>" &_
			"</li>" & VbCrLf)
		End If
		CateListRS.MoveNext
	Loop
	Response.Write("</ul>" & VbCrLf &_
	"</div>" & VbCrLf)
End Sub
'ContentPanel
Sub ShowContentPanel(title, content)
	Response.Write("<div class=""panel"">" & VbCrLf &_
	"<h3>" & title & "</h3>" & VbCrLf)
	If IsArray(content)=TRUE Then
		Response.Write("<ul>" & VbCrLf)
		Dim i
		For i=1 To UBound(content)
			Response.Write("<li" & ChangeColor(i) & ">" & VbCrLf &_
			content(i) & VbCrLf &_
			"</li>" & VbCrLf)
		Next
		Response.Write("</ul>" & VbCrLf)
	Else
		Response.Write(content)
	End If
	Response.Write("</div>" & VbCrLf)
	Set i=Nothing
End Sub
'Index
Sub ShowIndex
	Response.Write("<div id=""bodier""><div class=""index"">" & VbCrLf & "<img src=""../images/index/index_" & NavRS("NavID") & ".jpg"" alt=""" & NavRS("NavCName") & """ />" & VbCrLf & "</div>" & VbCrLf & "<div class=""catelist"">" & VbCrLf & "<ul>" & VbCrLf)
	Do Until CateListRS.EOF
		Response.Write("<li>" & VbCrLf & "<a href=""" & CateListRS("CateURL") & """><img src=""../images/cate/" & NavRS("NavID") & CateListRS("CateID") & ".gif"" alt=""" & CateListRS("CateCName") & """ /></a>" & VbCrLf & "</li>" & VbCrLf)
		CateListRS.MoveNext
	Loop
	Response.Write("</ul></div></div>")
End Sub
%>