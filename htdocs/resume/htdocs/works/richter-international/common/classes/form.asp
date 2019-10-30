<%
function Form() {
	////////// Attributes //////////////////////////////
	// Private //////////
	var submits = [];
	var items = [];

	// Public //////////
	this.mode = ""; // add, edit, check
	this.action = "";
	this.table = "";
	this.secCode = "";

	this.item = {};

	////////// Methods //////////////////////////////
	// Private //////////

	// Actions on submit
	function submit(conn, mode, table, input) {
		var sql = {};
		for (var i = 0; i < items.length; i++) {
			if (items[i].submit == "sign") {
				var where = "";
				switch (items[i].type) {
					case "string":
						where = "[" + items[i].name + "] = '" + input[items[i].name] + "'";
						break;
					case "number":
						where = "[" + items[i].name + "] = " + input[items[i].name];
						break;
				}
			} else if (items[i].submit) {
				switch (items[i].type) {
					case "string":
						sql[items[i].name] = input[items[i].name];
						break;
					case "number":
						if (input[items[i].name]) sql[items[i].name] = parseInt(input[items[i].name]);
						break;
					case "bool":
						sql[items[i].name] = checkBool(input[items[i].name]);
						break;
				}
			}
		}
		for (var i = 0; i < submits.length; i++) {
			sql[submits[i].name] = submits[i].value;
		}
		if (mode == "add") conn.insert(table, sql);
		if (mode == "edit") conn.update(table, sql, where);
	}

	// Public //////////

	// Add item
	this.addItem = function(submit, name, type, must, emptyError) {
		var item = {
				"submit":submit
			, "name":name
			, "type":type
			, "emptyOk":must? false:true
			, "emptyError":emptyError
			, "setMinLength":function(length, error) {
				this.minLength = length;
				this.tooShortError = error;
			}
			, "setMaxLength":function(length, error) {
				this.maxLength = length;
				this.tooLongError = error;
			}
			, "setMatch":function(match, error) {
				this.match = match;
				this.notMatchError = error;
			}
			, "setValues":function(values, error) {
				this.values = values;
				this.wrongValueError = error;
			}
		};
		items.push(item);
		this.item[item.name] = item;
		return item;
	}

	// Add submit
	this.addSubmit = function(name, value) {
		submits.push({"name":name, "value":value});
	}

	// Check form
	this.check = function(input) {
		var haveError = false;

		for (var i = 0; i < items.length; i++) {
			var item = items[i];
			item.value = input[item.name];

			if (item.emptyOk == false && !item.value) { // Empty
				item.error = item.emptyError;
				haveError = true;
			} else if (item.value && item.minLength != null && item.value.length < item.minLength) { // Too short
				item.error = item.tooShortError;
				haveError = true;
			} else if (item.value && item.maxLength != null && item.value.length > item.maxLength) { // Too long
				item.error = item.tooLongError;
				haveError = true;
			} else if (item.value && item.values != null) {
				var tmp = false;
				for (var j = 0; j < item.values.length; j++) {
					if (item.value == item.values[j].value) {
						tmp = true;
						j = item.values.length;
					}
				}
				if (!tmp) {
					item.error = item.wrongValueError;
					haveError = true;
				}
			} else if (item.value && item.match && !item.value.match(item.match)) {
				item.error = item.notMatchError;
				haveError = true;
			}
		}

		if (haveError) return false;
		else return true;
	}

	// Do
	this.submit = function(input) {
		if (this.check(input)) {
			if (this.mode == "add" || this.mode == "edit") submit(this.conn, this.mode, this.table, input);
			return true;
		} else return false;
	}

}
%>
