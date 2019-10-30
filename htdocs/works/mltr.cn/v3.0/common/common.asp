<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<%
Response.Buffer = true;
Session.Timeout = 20;
Session.CodePage = 65001;

// Golbal //////////////////////////////
var DEBUGMODE = true;
var NAMESPACE = "mltrcnv3";
var PATHDEPTH = 3;
%>
<!-- #include file = "functions.asp" -->
<!-- #include file = "classes/dbconn.asp" -->
<!-- #include file = "classes/user.asp" -->
<!-- #include file = "classes/htmlpage.asp" -->
<%
var search = getSearchs();
var input = getInputs();


var conn = new DBConn();
conn.dbPath = Server.MapPath("/../database/v3_mltrcn.mdb");
conn.open();

var user = new User();
user.checkCookie();

var page = new HTMLPage();
page.load();

page.addStyle("common");
page.addScript("common");
%>