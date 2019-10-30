<!-- #include file = "common/classes/category.asp" -->
<!-- #include file = "common/classes/update.asp" -->
<%
if (typeof(Application(NAMESPACE + "cacheUpdates")) == "undefined" || search.cleancache == "do") {
	Update.conn = conn;
	Application(NAMESPACE + "cacheUpdates") = Update.getTextUpdates(5);
}
var updates = Application(NAMESPACE + "cacheUpdates");
%>
<ul>
<%
for (var i = 0; i < updates.ubound(2) + 1; i++) {
%>
	<li>
		<p class="date"><%=updates.getItem(2, i)%>&nbsp;<%=updates.getItem(7, i)%></p>
		<p><a href="<%=updates.getItem(8, i)%>"><%=updates.getItem(4, i)%></a></p>
	</li>
<%
}
%>
</ul>
