<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="shop"
CateRoot="shop"
title="订单列表"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
%>
	<div id="pagebar">
<%
	Dim SQLOrderby
	Dim OrderbyID, OrderbyGoodsID, OrderbyOrderGoodsAmount, OrderbyOrderRealName, OrderbyOrderDeliver, OrderbyOrderTime, OrderbyOrderState
	OrderbyID=Orderby("orderid", "OrderID", 0)
	OrderbyGoodsID=Orderby("goodsid", "GoodsID", 0)
	OrderbyOrderGoodsAmount=Orderby("ordergoodsamount", "OrderGoodsAmount", 0)
	OrderbyOrderRealName=Orderby("orderrealname", "OrderRealName", 0)
	OrderbyOrderDeliver=Orderby("orderdeliver", "OrderDeliver", 0)
	OrderbyOrderTime=Orderby("ordertime", "OrderTime", 2)
	OrderbyOrderState=Orderby("orderstate", "OrderState", 0)
	
	Dim OrderRS
	SetRS OrderRS, ShopConn, "SELECT * FROM Shop_Order ORDER BY " & SQLOrderby

	ShowPagebar 10, OrderRS
%>
	</div>
	<div id="list">
		<table class="list">
			<caption>订单列表</caption>
			<colgroup>
				<col />
				<col />
				<col />
				<col />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th><a href="<%=OrderbyID%>">订单号</a></th>
					<th><a href="<%=OrderbyGoodsID%>">商品编号</a></th>
					<th><a href="<%=OrderbyOrderGoodsAmount%>">购买数量</a></th>
					<th><a href="<%=OrderbyOrderRealName%>">真实姓名</a></th>
					<th><a href="<%=OrderbyOrderDeliver%>">送货方式</a></th>
					<th><a href="<%=OrderbyOrderTime%>">提交时间</a></th>
					<th><a href="<%=OrderbyOrderState%>">状态</a></th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5">&nbsp;</td>
					<td colspan="2">总数：<%=OrderRS.RecordCount%></td>
				</tr>
			</tfoot>
			<tbody>
<%
	Dim i
	For i=1 To OrderRS.PageSize
%>
				<tr<%=ChangeColor(i)%>>
					<td><a href="orderview.asp?orderid=<%=OrderRS("OrderID")%>"><%=ShowOrderID(OrderRS)%></a></td>
					<td><a href="goodsview.asp?goodsid=<%=OrderRS("GoodsID")%>"><%=OrderRS("GoodsID")%></a></td>
					<td><%=OrderRS("OrderGoodsAmount")%></td>
					<td><%=OrderRS("OrderRealName")%></td>
					<td><%=ShowDeliver(OrderRS("OrderDeliver"))%></td>
					<td><%=OrderRS("OrderTime")%></td>
					<td><%=ShowOrderState(OrderRS("OrderState"))%></td>
				</tr>
<%
		OrderRS.MoveNext
		If OrderRS.EOF Then Exit For
	Next
	Set i=Nothing
%>
			<tbody>
		</table>
	</div>
<%
End If
%>
</div>
<!-- #include file="../footer.asp" -->
