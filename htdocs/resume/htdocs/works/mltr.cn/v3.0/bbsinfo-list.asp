<%
if (typeof(Application(NAMESPACE + "cacheBbsInfo")) == "undefined" || search.cleancache == "do") {
	if (!bbsConn) {
		var bbsConn = new DBConn();
		bbsConn.dbPath = Server.MapPath("/../database/bbs.mdb");
		bbsConn.open();
	}
	Application(NAMESPACE + "cacheBbsInfo") = bbsConn.query("SELECT Forum_TopicNum, Forum_PostNum, Forum_UserNum, Forum_LastUser, Forum_TodayNum, Forum_YesterdayNum, Forum_MaxPostNum FROM Dv_Setup", 1, null, true);
}
var info = Application(NAMESPACE + "cacheBbsInfo");
%>
<dl>
	<dt>主题总数</dt><dd><%=info.getItem(0, 0)%></dd>
	<dt>论坛贴数</dt><dd><%=info.getItem(1, 0)%></dd>
	<dt>注册人数</dt><dd><%=info.getItem(2, 0)%></dd>
	<dt>新进会员</dt><dd><%=info.getItem(3, 0)%></dd>
	<dt>今日帖数</dt><dd><%=info.getItem(4, 0)%></dd>
	<dt>昨日贴数</dt><dd><%=info.getItem(5, 0)%></dd>
	<dt>高峰贴数</dt><dd><%=info.getItem(6, 0)%></dd>
</dl>
