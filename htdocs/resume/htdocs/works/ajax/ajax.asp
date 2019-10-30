<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
Response.Buffer = true;
Session.Timeout = 20;
Session.CodePage = 65001;

var username = Request.QueryString("username");
var content = Request.QueryString("content");

var xmlDom = new ActiveXObject("MSXML2.DomDocument");
xmlDom.async = false;
xmlDom.load(Server.MapPath("news.xml"));

var comments = xmlDom.documentElement.selectSingleNode("//news/comments");

if (Request.QueryString("act") == "doadd") {
	// Get last comment id
	var lastCommentId = parseInt(comments.lastChild.getAttributeNode("id").nodeValue);
	
	// New comment with id
	var newComment = xmlDom.createElement("comment");
	var commentId = xmlDom.createNode("attribute", "id", "");
	commentId.text = lastCommentId + 1;
	newComment.setAttributeNode(commentId);
	
	// comment's username and content
	var commentUsername = xmlDom.createElement("username");
	var commentContent = xmlDom.createElement("content");
	commentUsername.text = username;
	commentContent.text = content;
	newComment.appendChild(commentUsername);
	newComment.appendChild(commentContent);
	
	comments.appendChild(newComment);
	
	xmlDom = formatXML(xmlDom);
	
	xmlDom.save(Server.MapPath("news.xml"));
	
}

// Format XML file
function formatXML(objSource) {
	var stylesheet = new ActiveXObject("MSXML2.DomDocument");
	stylesheet.async = false;
	stylesheet.resolveExternals = false;
	stylesheet.loadXML("<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n"
		+ "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\">\r\n"
		+ "<xsl:output method=\"xml\"  omit-xml-declaration=\"yes\" indent=\"yes\"/>\r\n"
		+ "\t<xsl:template match=\"/ | @* | node()\">\r\n"
		+ "\t\t<xsl:copy>\r\n"
		+ "\t\t\t<xsl:apply-templates select=\"@* | node()\"/>\r\n"
		+ "\t\t</xsl:copy>\r\n"
		+ "\t</xsl:template>\r\n"
		+ "</xsl:stylesheet>\r\n");

	var result = objSource.transformNode(stylesheet);
	objSource.loadXML("<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n" + result);

	return objSource;
}
%>
