<!--#include file="common.asp" -->
<!--#include file="conn.asp" -->
<%
var conn = new ActiveXObject("ADODB.Connection");
conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + dbPath;
conn.Open();
var rs = new ActiveXObject("ADODB.Recordset");

if (String(Request.QueryString("id")) != "undefined") {
	rs = conn.Execute("SELECT TOP 1 id, title, date, content FROM [Article] WHERE id=" + Request.QueryString("id"));
	rs = transformArray(rs);
	rs = rs[0];

	header("examples", rs["title"] + " - 应用实例");
%>
<h2><%=rs["title"]%></h2>
<%=transformText(rs["content"])%>
<%
} else {
	header("examples", "应用实例");

	rs = conn.Execute("SELECT id, title FROM [Article] WHERE cateId=2 ORDER BY date DESC");
	rs = transformArray(rs);
	
	if (rs) {
%>
<ul><%for (var i = 0; i < rs.length; i++) {%>
	<li><a href="examples.asp?id=<%=rs[i]["id"]%>"><%=rs[i]["title"]%></a></li><%}%>
</ul>
<%
	} else {
%>
	<p>暂时没有！</p>
<%
	}
}

footer();
%>
