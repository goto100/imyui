<%
if Application("bbsInfo")=Empty then
	Dim BBSInfoRS
	Set BBSInfoRS=BBSConn.Execute("SELECT * FROM Dv_Setup")
	Dim BBSInfo
	BBSInfo="<dl>" &_
		"<dt>主题总数</dt><dd>" & BBSInfoRS("Forum_TopicNum") & "</dd>" &_
		"<dt>论坛贴数</dt><dd>" & BBSInfoRS("Forum_PostNum") & "</dd>" &_
		"<dt>注册人数</dt><dd>" & BBSInfoRS("Forum_UserNum") & "</dd>" &_
		"<dt>新进会员</dt><dd>" & BBSInfoRS("Forum_LastUser") & "</dd>" &_
		"<dt>今日帖数</dt><dd>" & BBSInfoRS("Forum_TodayNum") & "</dd>" &_
		"<dt>昨日贴数</dt><dd>" & BBSInfoRS("Forum_YesterdayNum") & "</dd>" &_
		"<dt>高峰贴数</dt><dd>" & BBSInfoRS("Forum_MaxPostNum") & "</dd>" &_
		"</dl>" & VbCrLf
	CloseRS BBSInfoRS
	Application("bbsInfo")=BBSInfo
end if
Response.Write(Application("bbsInfo"))

%>