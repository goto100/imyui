base2.DOM.bind(document);

function Datagrid() {
	this.selections; // All checkbox each row with this.selections.all
	this.records;
}
Datagrid.bind = function(node) {
	base2.lang.extend(node, new Datagrid());

	node.selections = node.querySelectorAll("table tbody td.selection input");
	node.selections.all = node.querySelector("table thead th.selection input");
	node.selections.all.datagrid = this;
	node.records = node.querySelectorAll("table tbody tr");

	node.selections.forEach(function(input) { // Select row
		input.onclick = function() {
			var row = base2.DOM.bind(this.parentNode.parentNode);
			this.checked? row.classList.add("selected") : row.classList.remove("selected");
		}
		input.onclick();
	});
	node.selections.all.onclick = function() { // Select All
		var checked = this.checked;
		node.selections.forEach(function(input) {
			if (!input.disabled) {
				input.checked = checked;
				input.onclick();
			}
		});
	}
}
Datagrid.prototype.select = function(className) {
	if (!className) {
		this.selections.forEach(function(input) {
			input.checked = false;
		});
	} else {
		this.select();
		this.querySelectorAll("tr." + className + " td.selection input").forEach(function(input) {
			input.checked = true;
		});
	}
}


document.addEventListener("DOMContentLoaded", function() {
	var datagrid = document.querySelector("#customers-list");
	Datagrid.bind(datagrid);
	var selections = document.querySelectorAll("p.selection a");
	selections.forEach(function(selection) {
		selection.onclick = function() {
			name = this.href.slice(this.href.lastIndexOf("#") + 1);
			datagrid.select(name);
			return false;
		}
	});
}, false);