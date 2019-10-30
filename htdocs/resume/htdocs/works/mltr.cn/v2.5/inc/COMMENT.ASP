<%
Dim tempConn
SetConn tempConn, "/../database/news.mdb"


'发布评论子程序
Sub CommentPost(keyname)
	Dim tempuserid, tempusername
	If (UserIsPassed<>"Passed" And Request.Form("username")=Empty) Or Request.Form("message")=Empty Then
		'内容未填写完整
		ShowAlert "提交失败","您的用户名或评论内容至少有一样没有填写，请填写完全进行提交","backnorefresh", ""
		Exit Sub
	Elseif DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
		'灌水
		ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。评论","backnorefresh", ""
		Session("LastPostTime")=Now()
		Exit Sub
	Elseif Len(Request.Form("message"))>SiteCommentLength Then
		'评论太长
		ShowAlert "提交失败","您的评论过长，请限制在500字之内","backnorefresh", ""
		Exit Sub
	Elseif Request.Form("username")<>Empty And Request.Form("password")=Empty Then
		If FindUserID(Request.Form("UserName"))<>0 Then
			ShowAlert "提交失败","您所使用的用户名已被注册，请登录、另起新名或注册新帐号","backnorefresh", ""
			Exit Sub
		Else
			tempuserid=0
			tempusername=Request.Form("UserName")
		End If
	Elseif Request.Form("username")<>Empty And Request.Form("password")<>Empty Then
		'是否成功登陆，密码正确或错误
		If CheckUser(Request.Form("UserName"), Request.Form("Password"))="passwrong" Then
			ShowAlert "提交失败","您用户名或密码错误，请核对后重新发表","backnorefresh", ""
			Exit Sub
		Else
			tempuserid=FindUserID(Request.Form("UserName"))
			tempusername=Request.Form("UserName")
		End If
	Elseif UserIsPassed="Passed" Then
		tempuserid=FindUserID(UserName)
		tempusername=UserName
	End If

	'评论内容写入
	Dim tempCommentRS
	Set tempCommentRS=tempConn.Execute("INSERT INTO " & keyname & "_Comment (" & keyname & "ID, commentcontent, UserID, UserName, UserIP) VALUES (" & Request.Form(LCase(keyname & "ID")) & ", '" & Request.Form("message") & "', " & tempuserid & ", '" & tempusername & "', '" & Request.ServerVariables("REMOTE_ADDR") & "')")

	'统计评论数量
	Dim tempCommentCount
	SetRS tempCommentCount, tempConn, "SELECT " & keyname & "ID FROM " & keyname & "_Comment WHERE " & keyname &"ID=" & Request.Form(LCase(keyname & "ID"))

	'评论数量+1
	Dim CountUp
	Set CountUp=tempConn.Execute("UPDATE " & keyname & "_Content SET CountComment=" & tempCommentCount.RecordCount & " WHERE " & keyname & "ID=" & Request.Form(LCase(keyname & "ID")))

	Session("LastPostTime")=Now()

	ShowAlert "提交成功","您已发布评论，谢谢","backrefresh", ""
End Sub

'删除评论子程序
Sub CommentDel(keyname)
	If UserValue<>"Admin" Then
		ShowAlert "删除失败","您没有权限执行这个操作","backnorefresh", ""
	Else
		Dim CommentDel
		Set CommentDel=tempConn.Execute("DELETE * FROM " & keyname & "_Comment WHERE CommentID=" & Request.QueryString("CommentID"))
		Set CommentDel=Nothing

		'统计评论数量
		Dim tempCommentCount
		Set tempCommentCount=tempConn.Execute("SELECT " & keyname & "ID FROM " & keyname & "_Comment WHERE " & keyname & "ID=" & Request.QueryString("" & keyname & "ID"))

		'评论数量-1
		Dim CountDown
		Set CountDown=tempConn.Execute("UPDATE " & keyname & "_Content SET CountComment=" & tempCommentCount.RecordCount & " WHERE " & keyname & "ID=" & Request.QueryString(keyname & "ID"))

		ShowAlert "删除成功","您已成功删除一条评论","backrefresh", ""

		CloseRS tempCommentCount
		Set CountDown=Nothing
	End If
End Sub
%>