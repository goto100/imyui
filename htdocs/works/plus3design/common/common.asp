<%
// Return object's expando names
Object.prototype.getExpandoNames = function() {
	var names = [];
	var obj = new this.constructor();
	for (var i in this) if ((obj[i] != this[i]) || (typeof obj[i] != typeof this[i])) names.push(i);
	delete obj;
	return names;
}

// DateTime Output function
Date.prototype.format = function(format, timezone) {
	if (!format)	format = "yyyy-MM-dd HH:mm:ss";
	if (isNaN(timezone)) timezone = - (this.getTimezoneOffset() / 60) * 100;

	this.setMinutes(this.getMinutes() + timezone * 0.6);

	var tYear = this.getUTCFullYear();
	var tMonth = this.getUTCMonth() + 1;
	var tDate = this.getUTCDate();
	var tHour = this.getUTCHours();
	var tHour12 = tHour > 12 ? tHour - 12 : tHour;
	var tMinute = this.getUTCMinutes();
	var tSecond = this.getUTCSeconds();

	// Year
	format = format.replace(/([^\\]|^)yyyy/g, "$1" + tYear);
	format = format.replace(/([^\\]|^)yy/g, "$1" + tYear.toString().slice(-2));
	// Month
	format = format.replace(/([^\\]|^)MM/g, "$1" + (tMonth < 10? "0" : "") + tMonth);
	format = format.replace(/([^\\]|^)M/g, "$1" + tMonth);
	// Date
	format = format.replace(/([^\\]|^)dd/g, "$1" + (tDate < 10? "0" : "") + tDate);
	format = format.replace(/([^\\]|^)d/g, "$1" + tDate);
	// Hour
	format = format.replace(/([^\\]|^)HH/g, "$1" + (tHour < 10? "0" : "") + tHour);
	format = format.replace(/([^\\]|^)hh/g, "$1" + tHour);
	format = format.replace(/([^\\]|^)H/g, "$1" + (tHour12 < 10? "0" + tHour12 : tHour12));
	format = format.replace(/([^\\]|^)h/g, "$1" + tHour12);
	// Minute
	format = format.replace(/([^\\]|^)mm/g, "$1" + (tMinute < 10? "0" : "") + tMinute);
	// Second
	format = format.replace(/([^\\]|^)ss/g, "$1" + (tSecond < 10? "0" : "") + tSecond);

	this.setMinutes(this.getMinutes() - timezone * 0.6);

	return format;
}

// Create date from a GMT date
Date.fromGMT = function(gmtDate) {
	var date = new Date(gmtDate);
	date.setMinutes(date.getMinutes() - date.getTimezoneOffset());
	return date;
}

// Random string
String.random = function(length, seed) {
	if (!seed) seed = "abcdefghijklmnopqrstuvwxyz1234567890";
	var result = "";
	for (var i = 0; i < length;) {
		var pos = Math.round((Math.random() * seed.length));
		if(pos >= 0 && pos < seed.length){
			result += seed.charAt(pos);
			i++;
		}
	}
	return result;
}

// Simple write
function write(content) {
	Response.Write(content);
}

// Simple write
function writeln(content) {
	Response.Write(content + "<br />");
}

// Output message on halt on
function outputErrorMsg(err) {
	Response.Write(err);
	Response.End();
}

/*
	// Transform path to absolute
	function transformToAbsolutePath(path) {
		if (path.substr(0, 1) == "/") return path.substr(0, path.lastIndexOf("/"));

		var pathInfoArr = String(Request.ServerVariables("PATH_INFO")).substr(1).split("/").slice(0, PATH_DEPTH);
		path = path.substr(0, path.lastIndexOf("/"));
		var result = "";
		var pathArr = path.split("/");
		for (var i = 0; i < PATH_DEPTH; i++) if (pathArr[0] == "..") {
			pathInfoArr.pop();
			pathArr.shift();
		}
		for (var i = 0; i < pathInfoArr.length; i++) result += pathInfoArr[i] + "/";
		for (var i = 0; i < pathArr.length; i++) if (pathArr[i]) result += pathArr[i] + "/";

		return result.slice(0, -1);
	}

	// Get path
	function getPath(pathInfo, depth) {
		var pathDepth = pathInfo.match(/\//gi).length - 1 - depth;
		var path = pathInfo.substring(0, pathInfo.lastIndexOf("/"));
		var result = "", right = "";
		for (var i = 0; i < pathDepth; i++) {
			right = path.substring(path.lastIndexOf("/"));
			path = path.substring(0, path.lastIndexOf("/"));
			result = right + result;
		}
		result = result.slice(1) + "/";
		return result == "/"? "" : result;
	}

*/
function test() {
	write("!")
}
%>
