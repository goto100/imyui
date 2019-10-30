<!-- #include file="common.asp" -->
<!-- #include file="inc/function.asp" -->
<!-- #include file="inc/md5.asp" -->
<%
title="登陆本站"
%>
<!-- #include file="header.asp" -->
<%
IF Request.QueryString("action")="login" Then
	IF CheckUser(Request.Form("UserName"), Request.Form("Password"))="notenough" Then
		ShowAlert "登录失败", "您的用户名或密码至少有一样没有填写，请填写完全进行登陆", "backnorefresh", ""
	Elseif CheckUser(Request.Form("UserName"), Request.Form("Password"))="passwrong" Then
		ShowAlert "登陆失败", "您用户名或密码错误，请核对后重新登陆", "backnorefresh", ""
	Elseif CheckUser(Request.Form("UserName"), Request.Form("Password"))="succeful" Then
		Select Case Request.Form("cookietime")
			Case 1
				Response.Cookies(CookieName).Expires=Date+1
			Case 2
				Response.Cookies(CookieName).Expires=Date+31
			Case 3
				Response.Cookies(CookieName).Expires=Date+365
		End Select
		ShowAlert "登陆成功", "您已成功登陆，谢谢","main", ""
	End IF
%>
<%
ElseIF Request.QueryString("action")="logout" Then
Response.Cookies(CookieName)("UserName")=Empty
Response.Cookies(CookieName)("UserPassword")=Empty
Response.Cookies(CookieName)("UserIsPassed")=Empty
Session("UserValue")=Empty
'成功登出
ShowAlert "登出成功", "您已成功登出，欢迎再次登陆","backrefresh", ""
Else
%>
<div id="bodier">
	<div id="form">
		<form method="post" action="?action=login">
			<table class="form">
				<colgroup>
					<col class="name" />
					<col class="content" />
				</colgroup>
				<tfoot>
					<tr>
						<td colspan="2"><input type="submit" name="login" value="登陆" class="button" /></td>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<td><label for="form_username">请输入您的用户名</label></td>
						<td><input name="username" type="text" class="text" id="form_username" /></td>
					</tr>
					<tr>
						<td><label for="form_password">请输入您的密码</label></td>
						<td><input type="password" name="password" id="form_password" class="text" /></td>
					</tr>
					<tr>
						<td>
							Cookie 选项：						
							<p class="note">请选择你的 Cookie 保存时间，下次访问可以方便输入。</p>
						</td>
						<td>
							<ul>
								<li><input type="radio" name="cookietime" id="form_cookietime0" value="0" checked="checked" /><label for="form_cookietime0">不保存，关闭浏览器即失效</label></li>
								<li><input type="radio" name="cookietime" id="form_cookietime1" value="1" /><label for="form_cookietime1">保存1天</label></li>
								<li><input type="radio" name="cookietime" id="form_cookietime2" value="2" /><label for="form_cookietime2">保存1个月</label></li>
								<li><input type="radio" name="cookietime" id="form_cookietime3" value="3" /><label for="form_cookietime3">保存1年</label></li>
							</ul>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<%
End IF
%>
<!-- #include file="footer.asp" -->
