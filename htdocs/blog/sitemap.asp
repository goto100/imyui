﻿<!--#include file="const.asp" -->
<!--#include file="conn.asp" -->
<!--#include file="common/cache.asp" -->
<!--#include file="common/function.asp" -->
<%
'==================================
'  Google SiteMap for PJBlog
'  更新时间: 2005-12-1
'  FlowJZH@gmail.com
'  www.Aryl.net
'==================================

Sub Escape(ByRef s)
  s = Replace(s, "&", "&amp;")
  s = Replace(s, "'", "&apos;")
  s = Replace(s, """", "&quot;")
  s = Replace(s, "<", "&gt;")
  s = Replace(s, ">", "&lt;")  
End Sub

'读取Blog设置信息
getInfo(1)
  
Response.Charset = "UTF-8"
Response.ContentType="text/xml"
Response.Expires=60

Dim cate_ID,FeedRows
cate_ID=CheckStr(Request.QueryString("cateID"))
IF IsInteger(cate_ID) = False Then
  SQL="SELECT L.log_ID,L.log_PostTime FROM blog_Content AS L,blog_Category AS C WHERE C.cate_ID=L.log_cateID AND L.log_IsDraft=false and C.cate_Secret=false ORDER BY log_PostTime DESC"
Else
  SQL="SELECT L.log_ID,L.log_PostTime FROM blog_Content AS L,blog_Category AS C WHERE log_cateID="&cate_ID&" AND C.cate_ID=L.log_cateID AND L.log_IsDraft=false and C.cate_Secret=false ORDER BY log_PostTime DESC"
End IF

Dim RS,i
Set RS=Conn.ExeCute(SQL)
if RS.EOF then
  ReDim FeedRows(0,0)
Else
  FeedRows=RS.getrows()
End If
RS.close : Set RS=nothing
call CloseDB
%><?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.google.com/schemas/sitemap/0.84">
  <url>
    <loc><%=SiteURL%></loc>
    <lastmod><%=ISO8601(DateAdd("h",-1,Now))%></lastmod>
    <changefreq>always</changefreq>
    <priority>0.9</priority>
  </url>
<%
If UBound(FeedRows,1)>0 then
  Dim iPrior,dtNow

  dtNow = Now
  
  With Response
    For i=0 to UBound(FeedRows,2)
      iPrior = 0.5
      .Write "  <url>"
      .Write VbCrLf
      .Write "    <loc>"
      .Write SiteURL&"article.asp?id="&FeedRows(0,i)
      .Write "</loc>"
      .Write VbCrLf
      .Write "    <lastmod>"
      .Write ISO8601(FeedRows(1,i))
      .Write "</lastmod>"
      .Write VbCrLf
      .Write "    <changefreq>"
      If DateDiff("h", FeedRows(1,i), dtNow) < 24 Then
        .Write "hourly"
        iPrior = 0.8
      ElseIf DateDiff("d", FeedRows(1,i), dtNow) < 7 Then
        .Write "daily"
        iPrior = 0.7
      ElseIf DateDiff("ww", FeedRows(1,i), dtNow) < 4 Then
        .Write "weekly"
      ElseIf DateDiff("m", FeedRows(1,i), dtNow) < 12 Then
        .Write "monthly"
      Else
        .Write "yearly"       
      End If
      .Write "</changefreq>"
      .Write VbCrLf
      If iPrior <> 0.5 Then
        .Write "    <priority>"
        .Write iPrior
        .Write "</priority>"
        .Write VbCrLf
      End If
      .Write "  </url>"
      .Write VbCrLf
    Next
  End With
End If

Function ISO8601(DateTime)  
	Dim DateMonth,DateDay,DateHour,DateMinute,DateWeek,DateSecond

  DateTime = DateAdd("h",-8,DateTime)
	DateMonth=Month(DateTime)
	DateDay=Day(DateTime)
	DateHour=Hour(DateTime)
	DateMinute=Minute(DateTime)
	DateWeek=weekday(DateTime)
	DateSecond=Second(DateTime)
	If Len(DateMonth)<2 Then DateMonth="0"&DateMonth
	If Len(DateDay)<2 Then DateDay="0"&DateDay
	If Len(DateMinute)<2 Then DateMinute="0"&DateMinute
	If Len(DateHour)<2 Then DateHour="0"&DateHour	
	If Len(DateSecond)<2 Then DateSecond="0"&DateSecond
	ISO8601=Year(DateTime)&"-"&DateMonth&"-"&DateDay&"T"&DateHour&":"&DateMinute&":"&DateSecond&"Z"
End Function
%>
</urlset>