<%
if Application("lastUpdate")=Empty then
	Dim LastUpdateRS
	Set LastUpdateRS=Conn.Execute("SELECT Nav.NavCName, Cate.NavName, Cate.CateCName, Cate.CateURL, Update.* FROM Site_Nav AS Nav, Site_Cate AS Cate, Main_Update AS [Update] WHERE Update.UpdateNav=Nav.NavName AND Update.UpdateCate=Cate.CateName AND Cate.NavName=Nav.NavName ORDER BY UpdateDate DESC")
	Dim LastUpdate
	LastUpdate="<ul>" & VbCrLf
	Dim i1
	For i1=1 To 5
		LastUpdate=LastUpdate+"<li><p class=""date"">" & LastUpdateRS("UpdateDate") & "&nbsp;"   & LastUpdateRS("NavCName") & "&nbsp;-&nbsp;" & LastUpdateRS("CateCName") & "</p><p>" & VbCrLf
		If IsNull(LastUpdateRS("UpdateURL")) Or LastUpdateRS("UpdateURL")="" Then
			LastUpdate=LastUpdate+"<a href=""" & LastUpdateRS("NavName") & "/" & LastUpdateRS("CateURL") & """>" & VbCrLf
		Else
			LastUpdate=LastUpdate+"<a href=""" & LastUpdateRS("UpdateURL") & """>" & VbCrLf
		End If
		LastUpdate=LastUpdate+LastUpdateRS("UpdateInfo") & "</a></p></li>" & VbCrLf
		LastUpdateRS.MoveNext
		If LastUpdateRS.EOF Then Exit For
	Next
	Set i1=Nothing
	LastUpdate=LastUpdate+"</ul>"
	CloseRS LastUpdateRS
	Application("lastUpdate")=LastUpdate
End If
Response.Write(Application("lastUpdate"))
%>
