<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="shop"
CateRoot="shop"
If Request.QueryString("goodsid")<>Empty Then
	title="提交订单 - 填写订单内容"
ElseIf Request.QueryString("action")="check" Then
	title="提交订单 - 确认订单内容"
Else
	title="提交订单"
End If
%>
<!-- #include file="../header.asp" -->
<%
Dim GoodsRS
Set GoodsRS=ShopConn.Execute("SELECT Goods.*, Cate.CateID AS CateID" &_
	" FROM Shop_Goods AS Goods, Shop_Cate AS Cate" &_
	" WHERE Goods.CateID=Cate.CateID AND GoodsID=" & Request("goodsid"))

If Request.QueryString("action")="post" Then
	If Trim(Request.Form("orderrealname"))=Empty Or Trim(Request.Form("ordergoodsamount"))=Empty Or Trim(Request.Form("orderdeliver"))=Empty Then
		ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
	ElseIf DateDiff("s", Session("LastPostTime"), Now())<SiteCheckSpam Then
		ShowAlert "提交失败","请不要在<em>" & SiteCheckSpam & "</em>秒内连续提交。","backnorefresh", ""
		Session("LastPostTime")=Now()
	Else
		Dim OrderPostRS
		Set OrderPostRS=ShopConn.Execute("INSERT INTO Shop_Order (" &_
			"OrderUserName, " &_
			"OrderRealName, " &_
			"OrderUserID, " &_
			"OrderUserZipCode, " &_
			"OrderUserAddress, " &_
			"OrderUserPhone, " &_
			"OrderUserEmail, " &_
			"OrderUserQQ, " &_
			"OrderRemark, " &_
			"OrderDeliver, " &_
			"GoodsID, " &_
			"OrderGoodsAmount" &_
			") VALUES (" &_
			"'" & Request.Form("orderusername") & "', " &_
			"'" & Request.Form("orderrealname") & "', " &_
			FindUserID(Request.Form("orderusername")) & ", " &_
			"'" & Request.Form("orderuserzipcode") & "', " &_
			"'" & Request.Form("orderuseraddress") & "', " &_
			"'" & Request.Form("orderuserphone") & "', " &_
			"'" & Request.Form("orderuseremail") & "', " &_
			"'" & Request.Form("orderuserqq") & "', " &_
			"'" & Request.Form("orderremark") & "', " &_
			CInt(Request.Form("orderdeliver")) & ", " &_
			CInt(Request.Form("goodsid")) & ", " &_
			CInt(Request.Form("ordergoodsamount")) &_
			")")
		Set OrderPostRS=Nothing
		Session("LastPostTime")=Now()

		Dim OrderRS
		Set OrderRS=ShopConn.Execute("SELECT TOP 1 OrderID, GoodsID, OrderGoodsAmount, OrderDeliver, OrderTime FROM Shop_Order WHERE OrderRealName='" & Request.Form("orderrealname") & "' ORDER BY OrderID DESC")
%>
<div id="bodier">
	<div id="content">
		<h3 class="important">恭喜您，订单提交成功</h3>
		<p class="msg">您的订单号为：<strong><%=ShowOrderID(OrderRS)%></strong>。您需要支付：<%=ShowOrderPriceShow(OrderRS("GoodsID"), OrderRS("OrderGoodsAmount"), OrderRS("OrderDeliver"))%></p>
		<p>请牢记您的订单号。</p>
		<ul>
			<li>对于邮政汇款的用户，请在汇款单附言中写明您的订单号；</li>
			<li>对于银行汇款且有手机的用户，汇款后请尽快发送您的订单号及汇款银行（农业或者建设）至手机短信<em class="mophone">13871462147</em>；</li>
			<li>对于银行汇款且没有手机的用户，请尽快上网发送您的订单号及汇款银行（农业或者建设）至电子邮件<a href="mailto:shop@mltr.cn" class="email">shop[at]mltr.cn</a>。</li>
		</ul>
		<p>若您很久没有收到所购物品，请查看本站相关公告。</p>
	</div>
</div>
<%
		Set OrderRS=Nothing
	End If
ElseIf Request.QueryString("action")="check" Then
	If Trim(Request.Form("orderrealname"))=Empty Or Trim(Request.Form("ordergoodsamount"))=Empty Or Trim(Request.Form("orderdeliver"))=Empty Then
		ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
	Else
%>
<div id="bodier">
	<div id="content">
		<form method="post" action="?action=post">
			<h3 class="important"><em>第二步：</em>请确认订单内容。</h3>
			<h3>订单信息</h3>
			<ul>
				<li>订单金额：<%=ShowOrderPriceShow(GoodsRS("GoodsID"), CInt(Request.Form("ordergoodsamount")), Request.Form("orderdeliver"))%></li>
			</ul>
			<h3>用户信息</h3>
			<ul>
				<li class="orderusername">
					网站帐号：
<%
		If Request.Form("orderusername")=Empty Then
			Response.Write("未填写")
		ElseIf FindUserID(Request.Form("orderusername"))=0 Then
			Response.Write("<em>未找到用户" & Request.Form("orderusername") & "</em>")
		Else 
			Response.Write("<em>" & Request.Form("orderusername") & "</em>")
%>
					<input type="hidden" name="orderusername" value="<%=Request.Form("orderusername")%>" />
<%
		End If
%>
				</li>
				<li class="orderrealname">
					真实姓名：<%=Request.Form("orderrealname")%>
				</li>
				<li class="orderuserphone">
					联系电话：<%=ShowString(Request.Form("orderuserphone"))%>
				</li>
				<li class="orderuseremail">
					E'Mail：<%=ShowString(Request.Form("orderuseremail"))%>
				</li>
				<li class="orderuserqq">
					QQ：<%=ShowString(Request.Form("orderuserqq"))%>
				</li>
				<li class="orderuserzipcode">
					邮政编码：<%=ShowString(Request.Form("orderuserzipcode"))%>
				</li>
				<li class="orderuseraddress">
					送货地址：<%=ShowString(Request.Form("orderuseraddress"))%>
				</li>
			</ul>
	
			<h3>商品信息</h3>
			<ul>
				<li class="goodsnum">
					商品编号：<%=ShowGoodsID(GoodsRS("CateID"), GoodsRS("GoodsID"))%>
				</li>
				<li class="goodsname">
					商品名称：<%=GoodsRS("GoodsName")%>
				</li>
				<li class="ordergoodsamount">
					购买数量：<%=Request.Form("ordergoodsamount")%>
				</li>
				<li class="orderdeliver">
					送货方式：<%=ShowDeliver(Request.Form("orderdeliver"))%>
				</li>
			</ul>
			<h3>其它说明</h3>
			<p class="orderremark">
					<%=ShowString(Request.Form("orderremark"))%>
			</p>
			<input type="hidden" name="orderrealname" value="<%=Request.Form("orderrealname")%>" />
			<input type="hidden" name="orderuserphone" value="<%=Request.Form("orderuserphone")%>" />
			<input type="hidden" name="orderuseremail" value="<%=Request.Form("orderuseremail")%>" />
			<input type="hidden" name="orderuserqq" value="<%=Request.Form("orderuserqq")%>" />
			<input type="hidden" name="orderuserzipcode" value="<%=Request.Form("orderuserzipcode")%>" />
			<input type="hidden" name="orderuseraddress" value="<%=Request.Form("orderuseraddress")%>" />
			<input type="hidden" name="goodsid" value="<%=Request.Form("goodsid")%>" />
			<input type="hidden" name="ordergoodsamount" value="<%=Request.Form("ordergoodsamount")%>" />
			<input type="hidden" name="orderdeliver" value="<%=Request.Form("orderdeliver")%>" />
			<input type="hidden" name="orderremark" value="<%=Request.Form("orderremark")%>" />
			<input type="submit" class="button" value="确认" />
			<input type="button" class="button" value="修改" onclick="javascript:history.go(-1);" />
		</form>
	</div>
</div>
<%
	End If
ElseIf Request.QueryString("goodsid")<>Empty Then
	Dim FormMode, FormAction, GoodsID, GoodsName
	FormMode="Post"
	FormAction="?action=check"
	GoodsID=ShowGoodsID(GoodsRS("CateID"), Request.QueryString("goodsid"))
	GoodsName=GoodsRS("GoodsName")
%>
<div id="bodier">
	<div id="form">
		<h3 class="important"><em>第一步：</em>请填写订单内容。</h3>
		<!-- #include file="inc/orderform.asp" -->
	</div>
</div>
<%
End If
%>
<!-- #include file="../footer.asp" -->
