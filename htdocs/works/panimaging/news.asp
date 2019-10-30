<!--#include file="common.asp" -->
<!--#include file="conn.asp" -->
<%
var conn = new ActiveXObject("ADODB.Connection");
conn.ConnectionString = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source=" + dbPath;
conn.Open();
var rs = new ActiveXObject("ADODB.Recordset");

if (String(Request.QueryString("id")) != "undefined") {
	rs = conn.Execute("SELECT TOP 1 id, title, date, content FROM [Article] WHERE id=" + Request.QueryString("id"));
	rs = transformArray(rs);
	rs = rs[0];

	header("news", rs["title"] + " - 最新动态");
%>
<h2><%=rs["title"]%></h2>
<%=transformText(rs["content"])%>
<%
} else {
	header("news", "最新动态");

	rs = conn.Execute("SELECT id, title, date FROM [Article] WHERE cateId=1 ORDER BY date DESC");
	rs = transformArray(rs);
	
	if (rs) {
%>
<table>
	<thead>
		<tr>
			<th scope="col">标题</th>
			<th scope="col">日期</th>
		</tr>
	</thead>
	<tbody><%for (var i = 0; i < rs.length; i++) {
		var date = new Date(rs[i]["date"]);
	%>
	<tr>
		<td><a href="news.asp?id=<%=rs[i]["id"]%>"><%=rs[i]["title"]%></a></td>
		<td><%=getDateTimeString("YY-MM-DD", date)%></td>
	</tr><%}%>
	</tbody>
</table>
<%
	} else {
%>
	<p>暂时没有新闻！</p>
<%
	}
}

footer();

function getDateTimeString(strFormat, objDate){
	var t = [];
	t["weekday_0"] = "Sunday";
	t["weekday_1"] = "Monday";
	t["weekday_2"] = "Tuesday";
	t["weekday_3"] = "Wednesday";
	t["weekday_4"] = "Thursday";
	t["weekday_5"] = "Friday";
	t["weekday_6"] = "Saturday";
	t["weekday_abbr_0"] ="Sun";
	t["weekday_abbr_1"] = "Mon";
	t["weekday_abbr_2"] = "Tue";
	t["weekday_abbr_3"] = "Wed";
	t["weekday_abbr_4"] = "Thu";
	t["weekday_abbr_5"] = "Fri";
	t["weekday_abbr_6"] = "Sat";
	t["month_1"] = "January";
	t["month_2"] = "February";
	t["month_3"] = "March";
	t["month_4"] = "April";
	t["month_5"] = "May";
	t["month_6"] = "June";
	t["month_7"] = "July";
	t["month_8"] = "August";
	t["month_9"] = "September";
	t["month_10"] = "October";
	t["month_11"] = "November";
	t["month_12"] = "December";
	t["month_abbr_1"] = "Jan";
	t["month_abbr_2"] = "Feb";
	t["month_abbr_3"] = "Mar";
	t["month_abbr_4"] = "Apr";
	t["month_abbr_5"] = "May";
	t["month_abbr_6"] = "Jun";
	t["month_abbr_7"] = "Jul";
	t["month_abbr_8"] = "Aug";
	t["month_abbr_9"] = "Sep";
	t["month_abbr_10"] = "Oct";
	t["month_abbr_11"] = "Nov";
	t["month_abbr_12"] = "Dec";

	if (objDate == undefined) {
		objDate = new Date();
	}
	if (strFormat == undefined || strFormat == "") {
		strFormat="YY-MM-DD hh:ii:ss";
	}
	var tYear = objDate.getFullYear();
	var tMonth = objDate.getMonth()+1;
	var tDate = objDate.getDate();
	var tDay = objDate.getDay();
	var tHour = objDate.getHours();
	var tHour12 = tHour>12 ? tHour-12 : tHour;
	var tMinute = objDate.getMinutes();
	var tSecond = objDate.getSeconds();
	var tAMPM = tHour>12 ? "PM" : "AM";
	var tZone = objDate.getTimezoneOffset();
	if (tZone == 0) {
		tZone = "Z";
	} else {
		tZone = Math.abs(Math.round(tZone/60));
		tZone = (objDate.getTimezoneOffset() <0 ? "-":"+") + (tZone<10 ? "0"+tZone : tZone);
	}

	// Year
	strFormat = strFormat.replace(/([^\\]|^)YY/g, "$1" + tYear);
	strFormat = strFormat.replace(/([^\\]|^)yy/g, "$1" + tYear.toString().substr(0,2));
	// Month
	if(tMonth<10){
		strFormat=strFormat.replace(/([^\\]|^)MM/g,"$1"+"0"+tMonth);
	}else{
		strFormat=strFormat.replace(/([^\\]|^)MM/g,"$1"+tMonth);
	}
	strFormat=strFormat.replace(/([^\\]|^)mm/g,"$1"+tMonth);
	// Date
	if(tDate<10){
		strFormat=strFormat.replace(/([^\\]|^)DD/g,"$1"+"0"+tDate);
	}else{
		strFormat=strFormat.replace(/([^\\]|^)DD/g,"$1"+tDate);
	}
	strFormat=strFormat.replace(/([^\\]|^)dd/g,"$1"+tDate);
	// Hour
	if(tHour<10){
		strFormat=strFormat.replace(/([^\\]|^)hh/g,"$1"+"0"+tHour);
	}else{
		strFormat=strFormat.replace(/([^\\]|^)hh/g,"$1"+tHour);
	}
	strFormat=strFormat.replace(/([^\\]|^)HH/g,"$1"+tHour);
	strFormat=strFormat.replace(/([^\\]|^)H/g,"$1"+tHour12);
	strFormat=strFormat.replace(/([^\\]|^)h/g,"$1"+(tHour12<10 ? "0"+tHour12 : tHour12));
	// Minute
	if(tMinute<10){
		strFormat=strFormat.replace(/([^\\]|^)ii/g,"$1"+"0"+tMinute);
	}else{
		strFormat=strFormat.replace(/([^\\]|^)ii/g,"$1"+tMinute);
	}
	strFormat=strFormat.replace(/([^\\]|^)II/g,"$1"+tMinute);
	// second
	if(tSecond<10){
		strFormat=strFormat.replace(/([^\\]|^)ss/g,"$1"+"0"+tSecond);
	}else{
		strFormat=strFormat.replace(/([^\\]|^)ss/g,"$1"+tSecond);
	}
	strFormat=strFormat.replace(/([^\\]|^)SS/g,"$1"+tSecond);
	// AM PM
	strFormat=strFormat.replace(/([^\\]|^)A/g,"$1"+tAMPM);
	strFormat=strFormat.replace(/([^\\]|^)a/g,"$1"+tAMPM.toLowerCase());
	// Time Zone Offset
	strFormat=strFormat.replace(/([^\\]|^)Z/g,"$1"+tZone+"00");
	strFormat=strFormat.replace(/([^\\]|^)z/g,"$1"+tZone);
	// Month & Weekday Names
	strFormat=strFormat.replace(/([^\w]|^)M([^\w]|$)/g,"$1"+t["month_"+tMonth]+"$2");
	strFormat=strFormat.replace(/([^\w]|^)m([^\w]|$)/g,"$1"+t["month_abbr_"+tMonth]+"$2");
	strFormat=strFormat.replace(/([^\w]|^)W([^\w]|$)/g,"$1"+t["weekday_"+tDay]+"$2");
	strFormat=strFormat.replace(/([^\w]|^)w([^\w]|$)/g,"$1"+t["weekday_abbr_"+tDay]+"$2");

	return strFormat;
}

%>
