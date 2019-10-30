<%
if (typeof(Application(NAMESPACE + "cacheBbsTopics")) == "undefined" || search.cleancache == "do") {
	if (!bbsConn) {
		var bbsConn = new DBConn();
		bbsConn.dbPath = Server.MapPath("/../database/bbs.mdb");
		bbsConn.open();
	}
	Application(NAMESPACE + "cacheBbsTopics") = bbsConn.query("SELECT TopicId, Title, BoardID, Expression FROM DV_Topic WHERE BoardID<>444 ORDER BY DateAndTime DESC", 10, 1, true);
}
var topics = Application(NAMESPACE + "cacheBbsTopics");
%>
<ul>
<%
for (var i = 0; i < topics.ubound(2) + 1; i++) {
%>
	<li>
		<img src="bbs/skins/default/topicface/<%=topics.getItem(3, i)%>" />
		<a href="bbs/dispbbs.asp?boardid=<%=topics.getItem(2, i)%>&amp;ID=<%=topics.getItem(0, i)%>" title="<%=topics.getItem(1, i)%>"><%=topics.getItem(1, i)%></a>
	</li>
<%
}
%>
</ul>