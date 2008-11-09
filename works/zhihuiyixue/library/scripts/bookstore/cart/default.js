function init() {
	$$("#cart-content input").each(checkNum);
	$$("#cart-content .remove").each(confirmDelete);
}
function confirmDelete(element, i) {
	element.onclick = function() {
		if (confirm("您确定要将此商品从您的购物车中移除吗？") == false)
			return false;
		element.up("tr").hide();
	}
}
function checkNum(element, i) {
	element.observe("keyup", function(event) {
		element.value = element.getValue().replace(/\D+/g, '');
	});
	if (document.all)
		element.observe("mousewheel", changeNum);
	var old = document.onmousewheel;
	element.onmouseover = function() {
		if (document.all)
			document.onmousewheel = function() { return false; };
	};
	element.onmouseout = function() {
		document.onmousewheel = old;
	};
}
function changeNum(event) {
	var n = 0;
	if (event.wheelDelta <= 0 || event.detail > 0)
		n--;
	else
		n++;
	var element = event.element();
	var value = Number(element.getValue()) + n;
	element.value = value < 1? 1 : value;
}
document.observe("dom:loaded", init);