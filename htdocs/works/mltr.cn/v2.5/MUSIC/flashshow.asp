<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim FlashShowRS
Set FlashShowRS=Conn.Execute("SELECT FlashID, FlashName FROM Music_Flash WHERE FlashID='" & Request.QueryString("flashid") & "'")

Plugin="music"
CateRoot="music"
Cate="flash"
title=FlashShowRS("FlashName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="content">
		<script type="text/javascript">
			ShowSwf("../resources/music/flash/<%=FlashShowRS("FlashID")%>.swf", 560, 400)
		</script>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

ShowContentPanel "跳转", "<p><a href=""../show.asp?swf=resources/music/flash/" & FlashShowRS("FlashID") & ".swf"">全屏播放</a></p>"

CloseRS FlashShowRS
%>
</div>
<!-- #include file="../footer.asp" -->