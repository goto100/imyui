<%
function User() {
	////////// Attributes //////////////////////////////
	// Private //////////

	// Public //////////
	this.id = 0;
	this.name = "";
	this.email = "";
	this.password = "";

	this.loggedIn = false;

	this.group = {};	
	this.group.id = 1; // Default a guest

	////////// Methods //////////////////////////////
	// Private //////////

	// Get IP
	function getIP() {
    var strIP = String(Request.ServerVariables("HTTP_X_FORWARDED_FOR")).replace(/[^0-9\.,]/g, "");
    if(strIP.length < 7) strIP = String(Request.ServerVariables("REMOTE_ADDR")).replace(/[^0-9\.,]/g, "");
    if(strIP.indexOf(",") > 7) strIP = strIP.substr(0, strIP.indexOf(","));
    return strIP;
	}

	// Fill user
	this.fill = function(value) {
		this.id = value["id"];
		this.name = value["name"];
		this.password = value["password"];
		this.group.id = value["groupId"];
		this.ip = getIP();
		if (value["groupId"] == 1) this.isAdmin = true;
	}

	// Check when visit
	this.checkCookie = function() {
		if (getSiteSession("userLoggedIn")) {
			this.login(getSiteSession("memberId"), getSiteSession("memberPassword"));
		} else if (getSiteCookie("remState")) {
			this.login(parseInt(getSiteCookie("memberId")), getSiteCookie("memberPassword"), true);
		} else {
			this.logout();
			this.ip = getIP();
		}
	}

	// Login
	this.login = function(user, codedPassword, remState) {
		var bbsConn = new DBConn();
		bbsConn.dbPath = Server.MapPath("/../database/bbs.mdb");
		bbsConn.open();
		var sql = "SELECT TOP 1 UserId AS id, UserName AS name, UserPassword, UserGroupID AS groupId FROM [Dv_User]";
		if (typeof(user) == "number") sql += " WHERE userId = " + user;
		else if (typeof(user) == "string") sql += " WHERE userName = '" + user + "'";
		var tmpA = bbsConn.query(sql, 1);
		bbsConn.close();

		if (tmpA != null) {
			if (codedPassword == tmpA["UserPassword"]) {
				setSiteSession("userLoggedIn", true);
				setSiteSession("memberId", tmpA["id"]);
				setSiteSession("memberPassword", tmpA["UserPassword"]);
				if (remState) {
					var tDate = new Date();
					tDate.setTime(tDate.getTime() + 365 * 864E5);
					setSiteCookie("remState", true, tDate);
					setSiteCookie("memberId", tmpA["id"], tDate);
					setSiteCookie("memberPassword", tmpA["UserPassword"], tDate);
				}
				this.loggedIn = true;
				this.fill(tmpA);
				return 1;
			} else return 0;
		} else {
			this.logout();
			return -1;
		}
	}

	// Logout
	this.logout = function() {
    this.loggedIn=false;
		removeSiteSession("userLoggedIn");
		removeSiteSession("memberId");
		removeSiteSession("memberPassword");
		removeSiteCookie("remState");
		removeSiteCookie("memberId");
		removeSiteCookie("memberPassword");
	}
}
%>
