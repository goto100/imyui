<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Plugin="shop"
CateRoot="shop"
title="修改订单"
%>
<!-- #include file="../header.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.Form("del")="1" Then
		Dim OrderDel
		Set OrderDel=ShopConn.Execute("DELETE * FROM Shop_Order WHERE OrderID=" & Request.Form("orderid"))
		Set OrderDel=Nothing
		ShowAlert "删除成功", "您已成功删除一个订单", "news.asp?cate=news", "back"
	ElseIf Request.QueryString("action")="post" Then
		If Trim(Request.Form("orderrealname"))=Empty Or Trim(Request.Form("ordergoodsamount"))=Empty Or Trim(Request.Form("orderdeliver"))=Empty Then
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		Else
			Dim OrderEditRS, strSQL
			strSQL="OrderFactPrice=" & Request.Form("orderfactprice") & "," &_
			" OrderState=" & CheckStr(Request.Form("orderstate")) & "," &_
			" OrderRealName='" & CheckStr(Request.Form("orderrealname")) & "'," &_
			" OrderUserPhone='" & CheckStr(Request.Form("orderuserphone")) & "'," &_
			" OrderUserEmail='" & CheckStr(Request.Form("orderuseremail")) & "'," &_
			" OrderUserQQ='" & Request.Form("orderuserqq") & "'," &_
			" OrderUserZipCode='" & CheckStr(Request.Form("orderuserzipcode")) & "'," &_
			" OrderUserAddress='" & CheckStr(Request.Form("orderuseraddress")) & "'," &_
			" OrderGoodsAmount=" & CheckStr(Request.Form("ordergoodsamount")) & "," &_
			" OrderDeliver=" & CheckStr(Request.Form("orderdeliver")) & "," &_
			" OrderRemark='" & CheckStr(Request.Form("orderremark")) & "'"
			Set OrderEditRS=ShopConn.Execute("UPDATE Shop_Order SET " & strSQL & " WHERE OrderID=" & Request.Form("orderid"))
			Set OrderEditRS=Nothing
			Set strSQL=Nothing
			
			ShowAlert "提交成功", "您已修改订单，谢谢", "orderview.asp?orderid=" & Request.Form("orderid"), "back"
		End If
	Else
		Dim OrderRS
		Set OrderRS=ShopConn.Execute("SELECT [Order].*, [Goods].GoodsID AS GoodsID, [Goods].GoodsName, [Cate].CateID AS CateID FROM Shop_Order AS [Order], Shop_Goods AS [Goods], Shop_Cate AS [Cate] WHERE [Order].GoodsID=[Goods].GoodsID AND [Goods].CateID=[Cate].CateID And [Order].OrderID=" & Request.QueryString("orderid"))
		Dim FormMode, FormAction, GoodsID, GoodsName
		
		FormMode="Edit"
		FormAction="?action=post"
		GoodsID=ShowGoodsID(OrderRS("CateID"), OrderRS("GoodsID"))
		GoodsName=OrderRS("GoodsName")
%>
<div id="bodier">
	<div id="form">
		<!-- #include file="inc/orderform.asp" -->
	</div>
</div>
<%
	End If
End If
%>
<!-- #include file="../footer.asp" -->
