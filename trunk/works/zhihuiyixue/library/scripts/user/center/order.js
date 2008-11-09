function init() {
	$("order-del").onclick = function() {
		return confirm("您确定要取消此订单吗？该操作不可恢复。");
	}
}
document.observe("dom:loaded", init);
