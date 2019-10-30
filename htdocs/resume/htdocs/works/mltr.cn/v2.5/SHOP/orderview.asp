<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="shop"
CateRoot="shop"

Dim OrderRS
Set OrderRS=ShopConn.Execute("SELECT [Order].*, [Goods].GoodsID AS GoodsID, [Goods].GoodsName, [Goods].GoodsFavorPrice, [Goods].GoodsFavorNum, [Goods].GoodsPrice, [Goods].GoodsPostPrice, [Goods].GoodsFastPostPrice, [Cate].CateID AS CateID FROM Shop_Order AS [Order], Shop_Goods AS [Goods], Shop_Cate AS [Cate] WHERE [Order].GoodsID=[Goods].GoodsID AND [Goods].CateID=[Cate].CateID AND [Order].OrderID=" & Request.QueryString("orderid"))
title="查看订单 - " & ShowOrderID(OrderRS)
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
<%
If UserValue="Admin" Then
%>
	<div id="edit"><p class="msg"><a href="orderedit.asp?orderid=<%=OrderRS("OrderID")%>">编辑</a></p></div>
<%
End If
%>
	<div id="content">
		<h3>订单信息</h3>
		<ul>
			<li>订单号：<%=ShowOrderID(OrderRS)%></li>
			<li>订单金额：<%=ShowOrderPriceShow(OrderRS("GoodsID"), OrderRS("OrderGoodsAmount"), OrderRS("OrderDeliver"))%></li>
			<li>订单状态：<strong><%=ShowOrderState(OrderRS("OrderState"))%></strong></li>
		</ul>
		<h3>用户信息</h3>
		<ul>
			<li>网站帐号：<%=ShowString(OrderRS("OrderUserName"))%></li>
			<li>真实姓名：<%=OrderRS("orderrealname")%></li>
			<li>联系电话：<%=ShowString(OrderRS("OrderUserPhone"))%></li>
			<li>E'Mail：<%=ShowString(OrderRS("OrderUserEmail"))%></li>
			<li>QQ：<%=ShowString(OrderRS("OrderUserQQ"))%></li>
			<li>邮政编码：<%=ShowString(OrderRS("OrderUserZipCode"))%></li>
			<li>送货地址：<%=ShowString(OrderRS("OrderUserAddress"))%></li>
		</ul>
		<h3>商品信息</h3>
		<ul>
			<li>商品编号：<%=ShowGoodsID(OrderRS("CateID"), OrderRS("GoodsID"))%></li>
			<li>商品名称：<%=OrderRS("GoodsName")%></li>
			<li>购买数量：<%=OrderRS("OrderGoodsAmount")%></li>
			<li>送货方式：<%=ShowDeliver(OrderRS("OrderDeliver"))%></li>
		</ul>
		<h3>其他信息</h3>
		<p>其它说明：<%=ShowString(OrderRS("OrderRemark"))%></p>
	</div>
</div>
<!-- #include file="../footer.asp" -->
