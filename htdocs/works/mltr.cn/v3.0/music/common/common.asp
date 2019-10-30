<!-- #include file = "../../common/common.asp" -->
<!-- #include file = "classes/appmusic.asp" -->
<%
var appMusic = new AppMusic();
appMusic.conn = conn;

page.category.id = "music";
page.category.name = "音乐";
page.category.addCategory("listen", "在线试听", "index.asp?listen");
page.category.addCategory("lyric", "歌词", "index.asp");
page.category.addCategory("flash", "迈闪", "flash.asp");
%>