<%
function User() {
	////////// Attributes //////////////////////////////
	// Private //////////

	// Public //////////
	this.isAdmin = Session("isAdmin") == true? true : false;

	// Login
	this.login = function(password) {
		if (password == "admin888" || Session("isAdmin") == true) {
			Session("isAdmin") = true;
			return true;
		} else return false;
	}

	// Logout
	this.logout = function() {
		Session.Contents.Remove("isAdmin");
	}
}
%>
