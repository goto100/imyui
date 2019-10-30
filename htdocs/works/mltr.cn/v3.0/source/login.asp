<!-- #include file = "../common/common.asp" -->
<!-- #include file = "../common/md5.asp" -->
<%
if (search.logout != null) {
	user.logout();
	page.id = "logoutSuccess";
} else if (search.submit != null) {
	var result = user.login(input.username, MD5(input.password, 16), input.remState);
	if (result == 1) page.id = "success";
	else if (result == 0) page.id = "passwordWrong";
	else if (result == -1) page.id = "noUser";
} else {
	page.id = "form";
}

%>