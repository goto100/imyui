<%
Const ShopDbName="/../database/mltr.cn v2/shop.mdb"

Dim ShopConn
Set ShopConn=Server.CreateObject("ADODB.Connection")
ShopConn.ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath(ShopDbName)
ShopConn.Open
If Err Then
	err.Clear
	Set ShopConn=Nothing
	Response.Write "Read Database Error."
	Response.End
End If

Dim ShopConfigRS
Set ShopConfigRS=ShopConn.Execute("SELECT * FROM Shop_Config")

Function ShowEdit(attribute, avalue)
	If avalue=Empty Then Exit Function
	If attribute=Empty Then attribute="value"
	ShowEdit=" " & attribute & "=""" & avalue & """"
End Function
Function ShowGoodsID(cateid, goodsid)
	ShowGoodsID=cateid & "-" & String(3-Len(goodsid), "0") & goodsid
End Function
Function ShowOrderPrice(id, num, deliver)
	Dim rs
	Set rs=ShopConn.Execute("SELECT GoodsFavorNum, GoodsFavorPrice, GoodsPrice, GoodsPostPrice, GoodsFastPostPrice FROM Shop_Goods WHERE GoodsID=" & id)
	If num>=rs("GoodsFavorNum") Then
		ShowOrderPrice=num * rs("GoodsFavorPrice")
	Else
		ShowOrderPrice=num * rs("GoodsPrice")
	End If
	Select Case deliver
		Case 1 ShowOrderPrice=ShowOrderPrice+rs("GoodsPostPrice")
		Case 2 ShowOrderPrice=ShowOrderPrice+rs("GoodsFastPostPrice")
	End Select
End Function

Function ShowOrderPriceShow(id, num, deliver)
	Dim rs
	Set rs=ShopConn.Execute("SELECT GoodsFavorNum, GoodsFavorPrice, GoodsPrice, GoodsPostPrice, GoodsFastPostPrice FROM Shop_Goods WHERE GoodsID=" & id)
	If num>=rs("GoodsFavorNum") Then
		ShowOrderPriceShow="<em>" & num & "</em>(数量)*" & "<em>" & FormatCurrency(rs("GoodsFavorPrice")) & "</em>(优惠价)"
	Else
		ShowOrderPriceShow="<em>" & num & "</em>(数量)*" & "<em>" & FormatCurrency(rs("GoodsPrice")) & "</em>(单价)"
	End If
	Select Case deliver
		Case 1 ShowOrderPriceShow=ShowOrderPriceShow & "+" & "<em>" & FormatCurrency(rs("GoodsPostPrice")) & "</em>(邮费)"
		Case 2 ShowOrderPriceShow=ShowOrderPriceShow & "+" & "<em>" & FormatCurrency(rs("GoodsFastPostPrice")) & "</em>(快递费)"
	End Select
	ShowOrderPriceShow="" & ShowOrderPriceShow & "=" & "<strong>" & FormatCurrency(ShowOrderPrice(id, num, deliver)) & "</strong>"
End Function

Function ShowOrderID(rs)
	ShowOrderID=DateToStr(rs("OrderTime"), "YYMMDD", "") & rs("OrderID")
End Function
Function ShowDeliver(id)
	Select Case id
		Case 1 ShowDeliver="邮购"
		Case 2 ShowDeliver="快递"
		Case 3 ShowDeliver="上门取货"
	End Select
End Function
Function ShowOrderState(id)
	Select Case id
		Case 0 ShowOrderState="未交款"
		Case 1 ShowOrderState="未出货"
		Case 2 ShowOrderState="已出货"
		Case 3 ShowOrderState="已作废"
	End Select
End Function
Function ShowString(rs)
	If rs=Empty Then ShowString="未填写" Else ShowString=rs
End Function
%>