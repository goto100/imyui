<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim GoodsRS
Set GoodsRS=ShopConn.Execute("SELECT Goods.*, Cate.CateID AS CateID, Cate.CateName FROM Shop_Goods AS Goods, Shop_Cate AS Cate WHERE Goods.CateID=Cate.CateID AND Goods.GoodsID=" & Request.QueryString("goodsid"))
Plugin="shop"
CateRoot="shop"
Cate=GoodsRS("CateName")
title=GoodsRS("GoodsName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
	<div id="info">
<%
ShowContentH2 "商品信息"
%>
		<div class="show">
			<h3><%=GoodsRS("GoodsName")%></h3>
			<img src="../resources/shop/<%=Cate%>/<%=GoodsRS("GoodsPic")%>" alt="<%=GoodsRS("GoodsName")%>" class="show" />
			<ul>
				<li class="goodsid">商品编号：<%=ShowGoodsID(GoodsRS("CateID"), GoodsRS("GoodsID"))%></li>
				<li class="goodsdate">上架日期：<%=GoodsRS("GoodsDate")%></li>
				<li class="goodsprice">商品售价：<strong><%=FormatCurrency(GoodsRS("GoodsPrice"))%></strong></li>
				<li class="goodsfavorprice">优惠价格：<em><%=FormatCurrency(GoodsRS("GoodsFavorPrice"))%></em></li>
				<li class="goodsfavornum">优惠条件：一次购买<em><%=GoodsRS("GoodsFavorNum")%></em>个单位</li>
<%
If GoodsRS("GoodsMemberPrice")<>0 Then
%>
				<li class="goodsmemberprice">VIP会员价格：<em><%=FormatCurrency(GoodsRS("GoodsMemberPrice"))%></em></li>
<%
Else
%>
				<li class="goodsmemberprice">VIP会员价格：尚未开通此项服务</li>
<%
End If
%>
				<li class="goodspostprice">邮购费用：<em><%=FormatCurrency(GoodsRS("GoodsPostPrice"))%></em></li>
				<li class="goodsfastpostprice">快递费用：<em><%=FormatCurrency(GoodsRS("GoodsFastPostPrice"))%></em></li>
			</ul>
			<p class="goodscommenturl"><a href="<%=GoodsRS("GoodsCommentURL")%>" title="论坛讨论" rel="external"><img src="../images/content_comment.gif" alt="论坛讨论" /></a></p>
			<p class="buythis"><a href="orderpost.asp?goodsid=<%=GoodsRS("GoodsID")%>" title="购买"><img src="../images/content_buyit.gif" alt="购买" /></a></p>
		</div>
		<%=UbbCode(GoodsRS("GoodsInfo"), 0, 0, 0, 0, 0)%>
	</div>
	<div id="intro">
<%
ShowContentH2 "商品介绍"
%>
		<div class="intro"><%=UbbCode(GoodsRS("GoodsSummary"), 0, 0, 0, 0, 0)%></div>
	<%=UbbCode(GoodsRS("GoodsIntro"), 0, 0, 0, 0, 0)%>
	</div>
</div>
<div id="sidebar">
<%
ShowContentCateList
ReDim liarray(2)
liarray(1)="<a href=""#info"">商品信息</a>"
liarray(2)="<a href=""#intro"">商品介绍</a>"
ShowContentPanel "跳转", liarray
ShowContentPanel "帮助", "<p><a href=""help.asp"">如何在本站购物？</a></p>"

If UserValue="Admin" Then
	ShowContentPanel "管理员", "<p><a href=""goodsedit.asp?goodsid=" & Request.QueryString("goodsid") & """>编辑</a></p>"
End If
%>
</div>
<!-- #include file="../footer.asp" -->