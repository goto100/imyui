<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="music"
CateRoot="music"
Cate="flash"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="list">
<%
Dim FlashRS
SetRS FlashRS, Conn, "SELECT FlashID, FlashName, FlashAuthor, FlashDate FROM Music_Flash ORDER BY FlashDate"

Do Until FlashRS.EOF
%>
		<div class="show">
			<h3><%=FlashRS("FlashName")%></h3>
			<a href="flashshow.asp?flashid=<%=FlashRS("FlashID")%>"><img src="../resources/music/flash/<%=FlashRS("FlashID")%>.jpg" alt="<%=FlashRS("FlashName")%>" class="show" /></a>
			<ul>
				<li>作者：<%=FlashRS("FlashAuthor")%></li>
				<li>添加日期：<%=FlashRS("FlashDate")%></li>
			</ul>
			<a href="flashshow.asp?flashid=<%=FlashRS("FlashID")%>" class="more">查看</a>
		</div>
<%
	FlashRS.MoveNext
Loop

CloseRS FlashRS
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
%>
</div>
<!-- #include file="../footer.asp" -->