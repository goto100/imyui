function init() {
	$$("table.list tbody tr").each(function(row, i) {
		if (i % 2 == 0)
			row.addClassName("even");
	});
	
	new Effect.Fade("alert", {delay: 2});
}
document.observe("dom:loaded", init);
