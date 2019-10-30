<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim MusicName
MusicName=Request.QueryString("lyric")

Dim LyricShowRS
Set LyricShowRS=Conn.Execute("SELECT * FROM Music_Content WHERE MusicName='" & CheckStr(MusicName) & "'")

Plugin="music"
CateRoot="music"
Cate="lyric"
title=LyricShowRS("MusicName")
%>
<!-- #include file="../header.asp" -->
<%
Dim CountUp
Set CountUp=Conn.Execute("UPDATE Music_Content SET CountLyric=CountLyric+1 WHERE MusicName='" & CheckStr(MusicName) & "'")
Set CountUp=Nothing
%>
<div id="bodier">
	<div id="content">
<%
If LyricShowRS("MusicLyric")<>Empty Then
	Response.Write(UbbCode(LyricShowRS("MusicAuthor"), 0, 0, 0, 0, "") &_
	UbbCode(LyricShowRS("MusicLyric"), 0, 0, 0, 0, "") &_
	"<p class=""inscribe"">" & LyricShowRS("MusicCopy") & "</p>")
Else
	ShowAlert "出现错误","没有找到本歌曲歌词，如果您选择的是某支歌曲的不同版本，请点击原版歌曲名称进行查看，谢谢","backnorefresh", ""
End If
%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList

ShowContentPanel "跳转", "<p><a href=""#"" onclick=""window.open('listenshow.asp?listen=" & Replace(MusicName, "'", "\'") & "','','width=300, height=380')"">收听本歌曲</a></p>"

Set MusicName=Nothing
CloseRS LyricShowRS
%>
</div>
<!-- #include file="../footer.asp" -->