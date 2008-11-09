function init() {
/*
$$("ul.accordion").each(foldBox);

	$("sales-special-books-pagebar").down(".previous").onclick = function() {

		new Ajax.Updater($("sales-special-books").down("ul"), "sales-special-books.html", {method: "get", charset: "gb2312"});

		return false;
	}
	$("sales-special-books-pagebar").down(".next").onclick = function() {
		new Ajax.Updater($("sales-special-books").down("ul"), "sales-special-books2.html", {method: "get", charset: "gb2312"});

		return false;
	}*/
}
function foldBox(element, i) {
	element.select(".accordionitem").each(foldBoxItem);
	element.down(".accordionitem").down(".accordionlabel").onclick();
}
function foldBoxItem(element, i) {
	element.down(".accordionlabel").onclick = function() {
		$(this).up().siblings().each(function(element) {
			element.down(".accordioncontent").visualEffect("blindUp", {duration: 0.4});
		});
		$(this).next(".accordioncontent").visualEffect("blindDown", {duration: 0.4});
	}
}
document.observe("dom:loaded", init);
