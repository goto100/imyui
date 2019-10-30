<%
if Application("lastNews")=Empty then
	Dim LastNewsRS
	Set LastNewsRS=NewsConn.Execute("SELECT TOP 4 Content.NewsID, Content.NewsTitle, Content.NewsTime, Cate.CateID, Cate.CateCName, Cate.CateName FROM News_Content AS Content, News_Cate AS Cate WHERE Content.CateName=Cate.CateName ORDER BY NewsTime DESC")
	dim LastNews
	LastNews="<ul>" & VbCrLf
	Do Until LastNewsRS.EOF
		LastNews=LastNews+"<li><p class=""date"">" & LastNewsRS("NewsTime") & "</p><p><a href=""news/news.asp?cate="& LastNewsRS("CateName") &""">" & LastNewsRS("CateCName") & "</a>&nbsp;-&nbsp;<a href=""news/newsshow.asp?newsid=" & LastNewsRS("NewsID") & """>" & LastNewsRS("NewsTitle") & "</a></p></li>" & VbCrLf
		LastNewsRS.MoveNext
	Loop
	LastNews=LastNews+"</ul>" & VbCrLf
	CloseRS LastNewsRS
	Application("lastNews") = LastNews
end if
Response.Write(Application("lastNews"))
%>
