<%
if Application("link")=empty then
	Dim LinkRS, Link
	Set LinkRS=Conn.Execute("SELECT * FROM Site_Link")
	Link="<ul>"
	Do Until LinkRS.EOF
		Link=Link+"<li><a href=""" & LinkRS("LinkURL") & """ title=""" & LinkRS("LinkIntro") & """ rel=""external""><img src=""images/link/" & LinkRS("LinkName") & ".gif"" alt=""" & LinkRS("LinkIntro") & """ /></a></li>"
		LinkRS.MoveNext
	Loop
	Link=Link+"</ul>"
	Application("link")=Link
end if
Response.Write(Application("link"))
%>