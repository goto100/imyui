<%
if Application("lastUpdatePic")=Empty then
	Dim LastUpdatePicRS, LastUpdatePic
	Set LastUpdatePicRS=Conn.Execute("SELECT Nav.NavCName, Cate.NavName, Cate.CateCName, Cate.CateURL, Update.* FROM Site_Nav AS Nav, Site_Cate AS Cate, Main_Update AS [Update] WHERE Update.UpdateNav=Nav.NavName AND Update.UpdateCate=Cate.CateName AND Update.UpdatePic<>Null AND Update.UpdatePic<>'' ORDER BY UpdateDate DESC")
	LastUpdatePic="<ul>" & VbCrLf
	Dim i2
	For i2=1 To 3
		LastUpdatePic=LastUpdatePic+"<li><img src=""images/update/" & LastUpdatePicRS("UpdatePic") & ".jpg"" alt=""" & LastUpdatePicRS("UpdatePic") & """ /><p class=""date"">" & LastUpdatePicRS("UpdateDate") & "&nbsp;"   & LastUpdatePicRS("NavCName") & "&nbsp;-&nbsp;" & LastUpdatePicRS("CateCName") & "</p><p>" & LastUpdatePicRS("UpdateInfo") & "</p>" & VbCrLf
	
		If IsNull(LastUpdatePicRS("UpdateURL")) Or LastUpdatePicRS("UpdateURL")="" Then
			LastUpdatePic=LastUpdatePic+"<a href=""" & LastUpdatePicRS("NavName") & "/" & LastUpdatePicRS("CateURL") & """ class=""more"">详细</a></li>" & VbCrLf
		Else
			LastUpdatePic=LastUpdatePic+"<a href=""" & LastUpdatePicRS("UpdateURL") & """ class=""more"">详细</a></li>" & VbCrLf
		End If
		LastUpdatePicRS.MoveNext
		If LastUpdatePicRS.EOF Then Exit For
	Next
	Set i2=Nothing
	LastUpdatePic=LastUpdatePic+"</ul>" & VbCrLf
	CloseRS LastUpdatePicRS
	Application("lastUpdatePic")=LastUpdatePic
end if
Response.Write(Application("lastUpdatePic"))
%>
