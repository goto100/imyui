<!--#include file="common.asp" -->
<!--#include file="conn.asp" -->
<%
var conn = new ActiveXObject("ADODB.Connection");
conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + dbPath;
conn.Open();
var rs = new ActiveXObject("ADODB.Recordset");

header("aboutus", "关于我们");
%>
<p>北京帕美智软件开发有限公司是一家专门从事复杂探区地震勘探成像技术研究和软件开发的高科技公司。最新推出的《基于层析反演的近地表建模和校正系统ToModel》软件包，专门针对我国西部复杂探区的近地表校正问题，具有理论算法先进、实用性强、紧密结合我国实际生产等特点，在运算效率和处理效果两个方面具有其它同类软件无法比拟的优势，推出半年来，立即得到了业界的一致认可和高度评价。帕美智以专心、专业的技术特长和服务理念，愿同国内、外各油田进行合作，铸就民族品牌，创造高质量地球物理勘探软件。</p>
<%
rs = conn.Execute("SELECT id, title, date FROM [Article] WHERE cateId=1 ORDER BY date DESC");
rs = transformArray(rs);

if (rs) {
%>
<marquee direction="up" scrollamount="2" onmouseover="this.stop()" onmouseout="this.start()">
	<ul><%for (var i = 0; i < rs.length; i++) {
					var date = rs[i]["date"];
			%>
		<li><a href="news.asp?id=<%=rs[i]["id"]%>"><%=rs[i]["title"]%></a></li><%}%>
	</ul>
</marquee>
<%
}

footer();
%>
