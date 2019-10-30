<%
if (typeof(Application(NAMESPACE + "cacheBbsAnns")) == "undefined" || search.cleancache == "do") {
	if (!bbsConn) {
		var bbsConn = new DBConn();
		bbsConn.dbPath = Server.MapPath("/../database/mltr.cn v2/bbs.mdb");
		bbsConn.open();
	}
	Application(NAMESPACE + "cacheBbsAnns") = bbsConn.query("SELECT title, boardid, id FROM Dv_BbsNews ORDER BY addtime DESC", 5, 1, true);
}
var anns = Application(NAMESPACE + "cacheBbsAnns");
%>
<ul>
<%
for (var i = 0; i < anns.ubound(2) + 1; i++) {
%>
	<li><a href="bbs/announcements.asp?action=showone&boardid=<%=anns.getItem(1, i)%>&amp;id=<%=anns.getItem(2, i)%>" title="<%=anns.getItem(0, i)%>"><%=anns.getItem(0, i)%></a></li>
<%
}
%>
</ul>