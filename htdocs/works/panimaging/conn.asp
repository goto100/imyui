<%
var dbPath = Server.MapPath("/../database/panimaging/article.mdb");

function transformText(text) {
	
	return text;
}

function transformArray(rs) {
	var labels = rs.Fields;
	rs = rs.getRows();
	
	var result = [];
	var rows = rs.ubound(2);
	var cols = rs.ubound(1);
	for (var i = 0; i <= rows; i++) {
		result[i] = [];
		for (var j = 0; j <= cols; j++) {
			result[i][labels(j).Name] = rs.getItem(j, i);
		}
	}
	return result;
}

function checkSQL(str) {
	return String(str).replace(/\'/ig, "''");
}
%>
