function init() {
	$("order-del").onclick = function() {
		return confirm("��ȷ��Ҫȡ���˶����𣿸ò������ɻָ���");
	}
}
document.observe("dom:loaded", init);
