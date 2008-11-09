function init() {
	var productRadios = $$("input[name=productId]");
	productRadios.each(function(element) {
		var product = element.up("li")
		product.onmouseover = function() {
			this.style.backgroundColor = "#EEEEEE";
		}
		product.onmouseout = function() {
			this.style.backgroundColor = "#FFFFFF";
		}
		product.onclick = function() {
			element.checked = true;
			element.onclick();
		}
		element.onclick = function() {
			$("form2").submit();
		}
	});
}
document.observe("dom:loaded", init);