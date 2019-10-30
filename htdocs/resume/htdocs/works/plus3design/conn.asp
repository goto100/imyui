<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<script language="vbscript" runat="server">
dim vbs_crlf : vbs_crlf = chrB(13) & chrB(10)
function vbs_inStrB(p1, p2, p3, p4)
	vbs_inStrB = InStrB(p1, p2, p3, p4)
end function
function vbs_midB(p1, p2, p3)
	vbs_midB = MidB(p1, p2, p3)
end function
function vbs_lenB(param)
	vbs_lenB = LenB(param)
end function
</script>
<%
// Initialization
Response.Buffer = true;
Session.Timeout = 20;
Server.ScriptTimeOut = 90;
Session.CodePage = 65001;
Response.Charset = "utf-8";

var page = {content: function() {}, sidebar: function() {}};
%>
<!--#include file="common/common.asp" -->
<!--#include file="common/database/DBAccess.asp" -->
<%
function UploaderFile() {
	var stream = null;
	var start = null;

	this.name = null;
	this.contentType = null;
	this.size = 0;

	this.setStreamSource = function(fileStream, fileStart) {
		stream = fileStream;
		start = fileStart;
	}

	this.saveAs = function(path) {
		var builtStream = new ActiveXObject("ADODB.Stream");
		builtStream.Type = 1;
		builtStream.Mode = 3;
		builtStream.Open();
		stream.Position = start;
		stream.CopyTo(builtStream, this.size);
		builtStream.SaveToFile(Server.MapPath(path), 2);
		builtStream.Close();
		delete builtStream;
	}
}

// Request.QueryString
function getSearch() {
	var search = {}
	var e = new Enumerator(Request.QueryString);
	for (var i = 0, item, names = []; !e.atEnd(); e.moveNext()) {
		item = e.item();
		names = String(item).split("&");
		search[names[names.length - 1]] = String(Request.QueryString(item));
		if (names.length > 1) for (var j = 0; j < names.length - 1; j++) {
			search[i++] = names[j];
			search[names[j]] = null;
		}
		search[i++] = names[names.length - 1];
	}
	return search;
}

function getDataInput() {
	if (Request.TotalBytes < 1) return false;
	var charset = String(Request.ServerVariables("HTTP_ACCEPT_CHARSET"));
	charset = charset.substr(0, charset.indexOf(","));
	if (!charset) charset = "UTF-8";
	var input = {}
	var dataStream = new ActiveXObject("ADODB.Stream");
	dataStream.Type = 1;
	dataStream.Mode = 3;
	dataStream.Open();
	dataStream.Write(Request.BinaryRead(Request.TotalBytes));
	dataStream.Position = 0;
	var requestData = dataStream.Read();

	var formStart = 1;
	var formEnd = vbs_lenB(requestData);
	var start = vbs_midB(requestData, 1, vbs_inStrB(1, requestData, vbs_crlf, 0) - 1); // First line
	var startLength = vbs_lenB(start);
	formStart += startLength + 1;

	var infoEnd = 0;
	var stream = new ActiveXObject("ADODB.Stream");
	while (formStart + 10 < formEnd) {
		infoEnd = vbs_inStrB(formStart, requestData, vbs_crlf + vbs_crlf, 0) + 3;
		stream.Type = 1;
		stream.Mode = 3;
		stream.Open();
		dataStream.Position = formStart;
		dataStream.CopyTo(stream, infoEnd - formStart);
		stream.Position = 0;
		stream.Type = 2;
		stream.Charset = charset;
		var info = stream.ReadText();
		stream.Close();
		formStart = vbs_inStrB(infoEnd, requestData, start, 0);
		var findStart = info.indexOf("name=\"", 22) + 6;
		var findEnd = info.indexOf("\"", findStart);
		var formName = info.substr(findStart, findEnd - findStart);
		if (info.indexOf("filename=\"", 45) > 0) { // A file
			var file = new UploaderFile();
			file.setStreamSource(dataStream, infoEnd);
			findStart = info.indexOf("filename=\"", findEnd) + 10;
			findEnd = info.indexOf("\"", findStart);
			file.name = info.substr(findStart, findEnd - findStart); // Name
			findStart = info.indexOf("Content-Type: ", findEnd) + 14;
			findEnd = info.indexOf("\r", findStart);
			file.contentType = info.substr(findStart, findEnd - findStart); // Content type
			file.size = formStart - infoEnd - 3; // Size

			if (!input[formName]) input[formName] = [];
			input[formName].push(file);
		} else { // A form item
			stream.Type = 1;
			stream.Mode = 3;
			stream.Open();
			dataStream.Position = infoEnd; 
			dataStream.CopyTo(stream, formStart - infoEnd - 3);
			stream.Position = 0;
			stream.Type = 2;
			stream.Charset = charset;
			var formValue = stream.ReadText();
			stream.Close();
			if (!input[formName]) input[formName] = formValue;
			else input[formName] += ", " + formValue;
		}
		formStart = formStart + startLength + 1;
	}
	delete requestData;
	delete stream;
	return input;
}

// Request.Form
function getInput() {
	var input = {}
	if (String(Request.ServerVariables("CONTENT_TYPE")).substr(0, 19) == "multipart/form-data") {
		input = getDataInput();
	} else {
		var name;
		var e = new Enumerator(Request.Form);
		for (var i = 0; !e.atEnd(); e.moveNext(), i++) {
			name = String(e.item());
			input[name] = String(Request.Form(name));
		}
	}
	return input;
}



var conn = new DBAccess(Server.MapPath("/../database/plus3design/plus3design.mdb"));
conn.open();

var search = getSearch();
var input = getInput();
%>