<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<!-- #include file="../inc/md5.asp" -->
<%
Plugin="shop"
CateRoot="shop"
title="添加商品"
%>
<!-- #include file="../header.asp" -->
<!-- #include file="common.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败","novalue","backnorefresh", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("cateid")="0" Or Request.Form("goodsname")=Empty Or Request.Form("goodsprice")=Empty Then
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		Else
			Dim GoodsAddRS
			Set GoodsAddRS=ShopConn.Execute("INSERT INTO Shop_Goods" &_
			" (CateID," &_
			" GoodsName," &_
			" GoodsSummary," &_
			" GoodsIntro," &_
			" GoodsInfo," &_
			" GoodsPic," &_
			" GoodsPrice," &_
			" GoodsFavorPrice," &_
			" GoodsFavorNum," &_
			" GoodsMemberPrice," &_
			" GoodsPostPrice," &_
			" GoodsFastPostPrice," &_
			" GoodsCommentURL," &_
			" GoodsIsCommend)" &_
			" VALUES (" & Request.Form("cateid") & "," &_
			" '" & Request.Form("goodsname") & "'," &_
			" '" & Request.Form("goodssummary") & "'," &_
			" '" & Request.Form("goodsintro") & "'," &_
			" '" & Request.Form("goodsinfo") & "'," &_
			" '" & Request.Form("goodspic") & "'," &_
			" " & Request.Form("goodsprice") & "," &_
			" " & Request.Form("goodsfavorprice") & "," &_
			" " & Request.Form("goodsfavornum") & "," &_
			" " & Request.Form("goodsmemberprice") & "," &_
			" " & Request.Form("goodspostprice") & "," &_
			" " & Request.Form("goodsfastpostprice") & "," &_
			" '" & Request.Form("goodscommenturl") & "'," &_
			" " & CBool(Request.Form("goodsiscommend")) & ")")

			Set GoodsAddRS=Nothing

			ShowAlert "提交成功", "您已添加商品，谢谢", "backnofresh", "back"

		End If
	Else
		Dim FormMode, FormAction, CateID, GoodsName, GoodsSummary, GoodsIntro, GoodsInfo, GoodsPic, GoodsDate, GoodsPrice, GoodsFavorPrice, GoodsFavorNum, GoodsMemberPrice, GoodsCommentURL, GoodsIsCommend
		
		FormMode="Post"
		FormAction="goodsadd.asp?action=post"
%>
<div id="bodier">
	<div id="form">
<!-- #include file="inc/goodsform.asp" -->
	</div>
</div>
<%
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->