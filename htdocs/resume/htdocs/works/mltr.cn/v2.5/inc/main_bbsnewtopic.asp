<%
if Application("newTopic")=Empty then
	dim NewTopic
	Dim NewTopicRS
	Set NewTopicRS=BBSConn.Execute("SELECT TOP 10 * FROM DV_Topic WHERE BoardID<>444 ORDER BY DateAndTime DESC")
	NewTopic="<ul>" & VbCrLf
	Do Until NewTopicRS.EOF
		NewTopic=NewTopic+"<li><img src=""bbs/skins/default/topicface/" & NewTopicRS("Expression") & """ /><a href=""bbs/dispbbs.asp?boardid=" & NewTopicRS("BoardID") & "&amp;ID=" & NewTopicRS("TopicID") & """ title=""" & HTMLEncode(NewTopicRS("Title")) & """ rel=""external"">" & HTMLEncode(NewTopicRS("Title")) & "</a></li>" & VbCrLf
		NewTopicRS.MoveNext
	Loop
	NewTopic=NewTopic+"</ul>" & VbCrLf
	CloseRS NewTopicRS
	Application("newTopic")=NewTopic
end if
Response.Write(Application("newTopic"))
%>