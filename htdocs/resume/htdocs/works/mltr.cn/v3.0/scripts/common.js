window.onload = function() {
	var anchors = document.getElementsByTagName("a");
	for (var i = 0; i < anchors.length; i++) {
		if (anchors[i].href.indexOf("delete=do") != -1) {
			anchors[i].onclick = function() {
				return confirm("确定要删除么？");
			}
		}
	}
}