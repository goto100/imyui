<%
function HTMLPage() {
	function getPath() {
		var pathDepth = pathInfo.match(/\//gi).length - 1 - PATHDEPTH;
		var path = pathInfo.substring(0, pathInfo.lastIndexOf("/"));
		var result = "", right = "";
		for (var i = 0; i < pathDepth; i++) {
			right = path.substring(path.lastIndexOf("/"));
			path = path.substring(0, path.lastIndexOf("/"));
			result = right + result;
		}
		if (result) return result.slice(1) + "/";
		else return "";
	}

	this.content = function() {
%>
<p><a href="javascript:history.go(-1)">Back</a></p>
<%
	}

	// HTMLPagebar
	this.outputPagebar = function(size, current, param) {
%>
	<div class="pagebar">
<%
		if (current != 1) {
%>
	<p class="first"><a href="?<%if(param) write(param + "&")%>p=1" title="首页">&lt;&lt;</p>
<%
		}
		if (current - 1 > 0) {
%>
	<p class="previous"><a href="?<%if(param) write(param + "&")%>p=<%=current-1%>" title="上一页">&lt;</p>
<%
		}
%>
	<ul>
<%
		for (var i = 0; i < size; i++) {
			if (i + 1 == current) {
%>
		<li class="active"><%=i+1%></li>
<%
			} else {
%>
		<li><a href="?<%if(param) write(param + "&")%>p=<%=i+1%>" title="<%=i+1%>"><%=i+1%></a></li>
<%
			}
		}
%>
	</ul>
<%
		if (current + 1 <= size) {
%>
	<p><a href="?<%if(param) write(param + "&")%>p=<%=current+1%>">&gt;</a></p>
<%
		}
		if (current != size) {
%>
	<p class="last"><a href="?<%if(param) write(param + "&")%>p=<%=size%>">&gt;&gt;</a></p>
<%
		}
%>
</div>
<%
	}
}

HTMLPage.Form = function() {
	var items = [];

	this.action = "";
	this.method = "post";

	this.addItem = function(type, name, title, rows) {
		var item = {"name":name,
			"title":title,
			"type":type,
			"rows":rows,
			"setValues":function(values, valueFlag, titleFlag) {
				this.values = values;
				this.valueFlag = valueFlag;
				this.titleFlag = titleFlag;
			}
		}
		if (this.value) item.value = this.value[item.name];
		if (this.source) {
			item.value = this.source.item[item.name].value;
			item.error = this.source.item[item.name].error;
		}
		items.push(item);
		return item;
	}

	this.addOutput = function(content) {
		items.push(content);
	}

	this.output = function() {
%>
<form action="<%=this.action%>" method="<%=this.method%>">
<%
		for (var i = 0; i < items.length; i++) {
			if (items[i].type != "hidden") {
%>
	<div class="formItem">
<%
			}
			if (items[i].title) {
%>
		<label><%=items[i].title%>：</label>
<%
			}
			switch (items[i].type) {
				case "text":
%>
		<input type="text" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "hidden":
%>
		<input type="hidden" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "password":
%>
		<input type="password" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "checkbox":
%>
		<input type="checkbox" name="<%=items[i].name%>" value="Ture"<%if (items[i].value) {%> checked="checked"<%}%> />
<%
					break;
				case "textarea":
%>
		<textarea name="<%=items[i].name%>" rows="<%=items[i].rows%>"><%=items[i].value%></textarea>
<%
					break;
				case "select":
%>
		<select name="<%=items[i].name%>">
<%
					for (var j = 0; j < items[i].values.length; j++) {
						var value = items[i].values[j][items[i].valueFlag];
						var title = items[i].values[j][items[i].titleFlag];
%>
			<option value="<%=value%>"<%if (items[i].value == value) {%> selected="selected"<%}%>><%=title%></option>
<%
					}
%>
		</select>
<%
					break;
				default:
					items[i]();
			}
			if (items[i].error) {
%>
		<p class="alert"><%=items[i].error%></p>
<%
			}
			if (items[i].type != "hidden") {
%>
	</div>
<%
			}
		}
%>
	<input type="submit" value="Submit" class="submit" />
</form>
<%
	}
}
%>
