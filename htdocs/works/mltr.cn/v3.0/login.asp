<!-- #include file = "source/login.asp" -->
<%
page.category.id = "login";
page.category.name = "登录";
page.headline = "登录";

switch (page.id) {
	case "form":
		page.content = function() {
%>
<div id="form">
	<form action="?submit" method="post">
		<div class="formItem">
			<label for="form_username">请输入您的用户名：</label><input type="text" name="username" id="form_username" />
		</div>
		<div class="formItem">
			<label for="form_password">请输入您的密码：</label><input type="password" name="password" id="form_password" />
		</div>
		<div class="formItem">
			<label for="form_remState">下次访问时记住登录状态：</label><input type="checkbox" name="remState" id="form_remState" />
		</div>
		<input type="submit" class="submit" value="登陆" />
	</form>
</div>
<%
		}
		page.output();
		break;
	case "success":
		page.outputMsg("登陆成功");
		break;
	case "passwordWrong":
		page.outputMsg("密码错误");
		break;
	case "noUser":
		page.outputMsg("无此用户");
		break;
	case "logoutSuccess":
		page.outputMsg("登出成功");
		break;
}
%>
