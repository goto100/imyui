<%
Dim language : language = Request.Cookies("language")
if language = null or language = "" then language = "en"
Response.Redirect(language & "/default.asp")
%>