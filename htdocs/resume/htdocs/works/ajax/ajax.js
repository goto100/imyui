var isIE = false;

function createXMLHttpRequest() {
	if (window.XMLHttpRequest) { // Not IE
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) { // IE
		isIE = true;
		return new ActiveXObject("Microsoft.XMLHttp");
	}
}

function outputComments() {
	var xmlHttp = createXMLHttpRequest();

	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) { // loaded
			if (xmlHttp.status == 200) { // no http error
				var items = xmlHttp.responseXML.getElementsByTagName("comment");

				var comm = document.getElementById("comments");
				var text = "";
				for (var i = 0; i < items.length; i++) {
					var id = items[i].getAttributeNode("id").nodeValue;
					var username = isIE ? items[i].getElementsByTagName("username")[0].text : items[i].getElementsByTagName("username")[0].textContent;
					var content = isIE ? items[i].getElementsByTagName("content")[0].text : items[i].getElementsByTagName("content")[0].textContent;
					text += ("<p class=\"id\">ID：" + id + "</p><p class=\"username\">名称：" + username + "</p><p class=\"content\">内容：" + content + "</p>");
				}
				comm.innerHTML = text;
			}
		}
	}
	xmlHttp.open("GET", "news.xml", true);
	xmlHttp.send(null);
}

function postComment() {
	var username = document.getElementsByName("username")[0].value;
	var content = document.getElementsByName("content")[0].value;

	var xmlHttp = createXMLHttpRequest();
	xmlHttp.open("GET", "ajax.asp?act=doadd&username=" + username + "&content=" + content, true);
	xmlHttp.send(null);

	// Refresh comments
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) { // loaded
			if (xmlHttp.status == 200) { // no http error
				outputComments();
			}
		}
	}
}

document.onload = outputComments();
