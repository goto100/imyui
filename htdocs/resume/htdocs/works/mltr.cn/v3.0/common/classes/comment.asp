<!-- #include file = "form.asp" -->
<%
var Comment = {};
Comment.tableName = "Comments";

Comment.getComments = function() {
	var sql = "SELECT id, content, userId, userName, date, ip FROM [" +  Comment.tableName+ "]";
	if (this.whereStr) sql += " WHERE " + Comment.whereStr;
	sql += " ORDER BY date DESC";
	var tmpA = Comment.conn.query(sql);
	if (tmpA) {
		for (var i = 0; i < tmpA.length; i++) {
			tmpA[i].user = {"id":tmpA[i].userId, "name":tmpA[i].userName};
		}
		return tmpA;
	}
}

Comment.add = function() {
	var form = new Form();
	form.conn = Comment.conn;
	form.mode = "add";
	form.table = "Comments";

	if (Comment.flag) form.addItem(true, Comment.flag.name, Comment.flag.type, true);
	if (!user.loggedIn) form.addItem(true, "userName", "string", true, "昵称必填");
	form.addItem(true, "content", "string", true, "内容必填");
	form.addSubmit("date", new Date());
	form.addSubmit("ip", user.ip);
	if (user.loggedIn) {
		form.addSubmit("userId", user.id);
		form.addSubmit("userName", user.name);
	}

	if (form.submit(input) == true) return true;
	else Comment.form = form;
}
%>