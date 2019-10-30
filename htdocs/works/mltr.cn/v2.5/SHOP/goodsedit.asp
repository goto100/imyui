<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
title="修改商品"
%>
<!-- #include file="../header.asp" -->
<!-- #include file="common.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.Form("del")="1" Then
		Dim GoodsDel
		Set GoodsDel=GoodsConn.Execute("DELETE * FROM Shop_Goods WHERE GoodsID=" & Request.Form("GoodsID"))
		Set GoodsDel=Nothing
		ShowAlert "删除成功", "您已成功删除一件商品", "", ""
	ElseIf Request.QueryString("action")="post" Then
		If Request.Form("goodscateid")="0" Or Request.Form("goodsname")=Empty Or Request.Form("goodsprice")=Empty Then
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		Else
			Dim GoodsUpdateRS, strSQL
			strSQL="CateID=" & Request.Form("cateid") & "," &_
			" GoodsName='" & CheckStr(Request.Form("goodsname")) & "'," &_
			" GoodsSummary='" & CheckStr(Request.Form("goodssummary")) & "'," &_
			" GoodsIntro='" & CheckStr(Request.Form("goodsintro")) & "'," &_
			" GoodsInfo='" & CheckStr(Request.Form("goodsinfo")) & "'," &_
			" GoodsDate=#" & Request.Form("goodsdate") & "#," &_
			" GoodsPic='" & CheckStr(Request.Form("goodspic")) & "'," &_
			" GoodsPrice=" & CheckStr(Request.Form("goodsprice")) & "," &_
			" GoodsFavorPrice=" & CheckStr(Request.Form("goodsfavorprice")) & "," &_
			" GoodsFavorNum=" & CheckStr(Request.Form("goodsfavornum")) & "," &_
			" GoodsMemberPrice=" & CheckStr(Request.Form("goodsmemberprice")) & "," &_
			" GoodsPostPrice=" & CheckStr(Request.Form("goodspostprice")) & "," &_
			" GoodsFastPostPrice=" & CheckStr(Request.Form("goodsfastpostprice")) & "," &_
			" GoodsCommentURL='" & CheckStr(Request.Form("goodscommenturl")) & "'"
			If Request.Form("goodsiscommend")=1 Then
				strSQL=strSQL & ", GoodsIsCommend=1"
			Else
				strSQL=strSQL & ", GoodsIsCommend=0"
			End If
			Set GoodsUpdateRS=ShopConn.Execute("UPDATE Shop_Goods SET " & strSQL & " WHERE GoodsID=" & Request.Form("goodsid"))
			Set GoodsUpdateRS=Nothing
			Set strSQL=Nothing
			
			ShowAlert "提交成功", "您已修改商品，谢谢", "goodsview.asp?goodsid=" & Request.Form("goodsid"), "back"
		End If
	Else
		'编辑表单
		Dim GoodsRS
		Set GoodsRS=ShopConn.Execute("SELECT * FROM Shop_Goods WHERE GoodsID=" & Request.QueryString("goodsid"))
	
		Dim FormMode, FormAction, CateID, GoodsID, GoodsName, GoodsSummary, GoodsIntro, GoodsInfo, GoodsPic, GoodsDate, GoodsPrice, GoodsFavorPrice, GoodsFavorNum,  GoodsMemberPrice, GoodsPostPrice, GoodsFastPostPrice, GoodsCommentURL, GoodsIsCommend
		
		FormMode="Edit"
		FormAction="goodsedit.asp?action=post"
		CateID=GoodsRS("CateID")
		GoodsID=GoodsRS("GoodsID")
		GoodsName=GoodsRS("GoodsName")
		GoodsSummary=GoodsRS("GoodsSummary")
		GoodsIntro=GoodsRS("GoodsIntro")
		GoodsInfo=GoodsRS("GoodsInfo")
		GoodsPic=GoodsRS("GoodsPic")
		GoodsDate=GoodsRS("GoodsDate")
		GoodsPrice=GoodsRS("GoodsPrice")
		GoodsFavorPrice=GoodsRS("GoodsFavorPrice")
		GoodsFavorNum=GoodsRS("GoodsFavorNum")
		GoodsMemberPrice=GoodsRS("GoodsMemberPrice")
		GoodsPostPrice=GoodsRS("GoodsPostPrice")
		GoodsFastPostPrice=GoodsRS("GoodsFastPostPrice")
		GoodsCommentURL=GoodsRS("GoodsCommentURL")
		GoodsIsCommend=GoodsRS("GoodsIsCommend")
%>
<div id="bodier">
	<div id="form">
<!-- #include file="inc/goodsform.asp" -->
	</div>
</div>
<%
		CloseRS GoodsRS
	End If
End If
%>

</div>
<!-- #include file="../footer.asp" -->