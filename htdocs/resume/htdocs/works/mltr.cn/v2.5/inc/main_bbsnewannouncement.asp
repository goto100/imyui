<%
if Application("newAnnouncement")=Empty then
	dim NewAnnouncement
	Dim NewAnnouncementRS
	Set NewAnnouncementRS=BBSConn.Execute("SELECT TOP 5 title, boardid, id FROM Dv_BbsNews ORDER BY addtime DESC")
	NewAnnouncement="<ul>" & VbCrLf
	Do Until NewAnnouncementRS.EOF
		NewAnnouncement=NewAnnouncement+"<li><a href=""bbs/announcements.asp?action=showone&boardid=" & NewAnnouncementRS("boardid") & "&id=" & NewAnnouncementRS("id") & """ title=""" & HTMLEncode(NewAnnouncementRS("title")) & """ rel=""external"">" & HTMLEncode(NewAnnouncementRS("title")) & "</a></li>" & VbCrLf
		NewAnnouncementRS.MoveNext
	Loop
	NewAnnouncement=NewAnnouncement+"</ul>" & VbCrLf
	CloseRS NewAnnouncementRS
	Application("newAnnouncement")=NewAnnouncement
end if
Response.Write(Application("newAnnouncement"))
%>