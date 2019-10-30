<!-- #include file = "common/classes/category.asp" -->
<!-- #include file = "common/classes/update.asp" -->
<%
if (typeof(Application(NAMESPACE + "cachePicUpdates")) == "undefined" || search.cleancache == "do") {
	Update.conn = conn;
	Application(NAMESPACE + "cachePicUpdates") = Update.getPicUpdates(3);
}
var updates = Application(NAMESPACE + "cachePicUpdates");
%>
<ul>
<%
for (var i = 0; i < updates.ubound(2) + 1; i++) {
%>
	<li>
		<a href="<%=updates.getItem(8, i)%>"><img src="images/update/<%=updates.getItem(5, i)%>.jpg" alt="<%=updates.getItem(5, i)%>" /></a>
		<p class="date"><%=updates.getItem(2, i)%>&nbsp;<%=updates.getItem(7, i)%></p>
		<p><%=updates.getItem(4, i)%></p>
	</li>
<%
}
%>
</ul>
