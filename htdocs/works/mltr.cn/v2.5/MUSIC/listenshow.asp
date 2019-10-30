<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="music"
CateRoot="music"
Cate="listen"
%>
<%
Dim MusicName, CountUp
Dim MusicURL
If Request.QueryString("listen")="more" Then
	Dim FSO, TX, AsxName
	AsxName=RandomString(5)
	Set FSO=Server.CreateObject("Scripting.FileSystemObject")
	Set TX=FSO.OpenTextFile(Server.MapPath("../" & MusicListenFolder & AsxName & ".asx"), 2, True)
	MusicName=Split(Request.Form("musicname"), ", ", -1, 1)
	TX.Write("<ASX VERSION=""3.0"">")
		Dim i
		For i=0 To ubound(MusicName)
		Set CountUp=Conn.Execute("UPDATE Music_Content SET CountListen=CountListen+1 WHERE MusicName='" & CheckStr(MusicName(i)) & "'")
		TX.Write("<ENTRY><ref href=""" & SiteURL & "resources/music/listen/" & MusicName(i) & ".wma""/></ENTRY>")
	Next
	Set i=Nothing
	TX.Write("</ASX>")
	MusicURL=SiteURL & MusicListenFolder & AsxName & ".asx"
	Set AsxName=Nothing
	TX.Close
	Set TX=Nothing
	Set FSO=Nothing
Else
	MusicName=Request.QueryString("listen")
	Set CountUp=Conn.Execute("UPDATE Music_Content SET CountListen=CountListen+1 WHERE MusicName='" & CheckStr(MusicName) & "' AND Listen=TRUE")
	MusicURL="../resources/music/listen/" & MusicName & ".wma"
End If

Set CountUp=Nothing
%>
<html>
<head>
<style type="text/css">
body{width:300px;height:380px;text-align:center;background:  url("../css/images/content_listenbox.gif") no-repeat top center;margin:0 auto;padding:30px 13px 37px 13px;}
div#musicplayer{height:313px;background:  url("../css/images/content_listenfinal.gif") no-repeat bottom center;margin:0;padding:0;}
div#musicplayer object{width:274px;height:159px;}
div#musicplayer embed{width:274px;height:159px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body oncontextmenu="self.event.returnValue=false;">
<div id="musicplayer">
	<object classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6">
		<param name="url" value="<%=MusicURL%>" />
		<param name="autostart" value="true" />
		<param name="enablecontextmenu" value="false">
		<embed autostart="true" src="<%=MusicURL%>" />
	</object>
</div>
</body>
</html>
<%
Set MusicURL=Nothing
%>
