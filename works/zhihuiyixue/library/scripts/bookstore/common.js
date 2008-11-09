function init() {
	$$("div.cart .added").each(function(element) {
		element.visualEffect("highlight", {startcolor: "#ffff00", duration: 1});
	});
}
document.observe("dom:loaded", init);