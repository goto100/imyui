function init() {
	$("password-form").onsubmit = checkForm;
}
function checkForm() {
	var form = $("password-form");
	if ($F(form['comfirmPassword']) != $F(form['newPassword'])) {
		new Insertion.Bottom(form['comfirmPassword'].parentNode, "<p class=\"error msg\">���벻һ�£�</p>");

		return false;
	}
}
document.observe("dom:loaded", init);
