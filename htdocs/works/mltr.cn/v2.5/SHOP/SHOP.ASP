<!-- #include file="../common.asp" -->
<!-- #include file="common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
Dim ShopCateRS
Set ShopCateRS=ShopConn.Execute("SELECT * FROM Shop_Cate WHERE CateName='" & CheckStr(Request.QueryString("catename")) & "'")
Plugin="shop"
CateRoot="shop"
Cate=ShopCateRS("CateName")
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
<%
Dim ShopAllGoodsRS
Set ShopAllGoodsRS=ShopConn.Execute("SELECT * FROM Shop_Goods WHERE CateID=" & ShopCateRS("CateID") & " ORDER BY GoodsDate")
If ShopAllGoodsRS.BOF And ShopAllGoodsRS.EOF Then
%>
	<div class="warning"><p>即将推出 敬请期待</p></div>
<%
Else
%>
	<div id="affiche">
<%
	ShowContentH2 "购物公告"
	Dim AfficheRS
	Set AfficheRS=BBSConn.Execute("SELECT id, title FROM Dv_BbsNews WHERE boardid=21 ORDER BY addtime DESC")
	If AfficheRS.BOF And AfficheRS.EOF Then
%>
		<p class="msg">暂无公告！</p>
<%
	Else
%>
		<ul>
<%
		Do Until AfficheRS.EOF
%>
			<li><a href="#" onclick="window.open('affiche.asp?id=<%=AfficheRS("id")%>','','width=300 height=400')"><%=AfficheRS("title")%></a></li>
<%
			AfficheRS.MoveNext()
		Loop
%>
		</ul>
<%
	End If
%>
	</div>
	<div id="commendgoods">
<%
	ShowContentH2 "推荐商品"
	
	Dim ShopCommendGoodsRS
	Set ShopCommendGoodsRS=ShopConn.Execute("SELECT GoodsID, GoodsName, GoodsPic, GoodsSummary FROM Shop_Goods WHERE GoodsIsCommend=TRUE AND CateID=" & ShopCateRS("CateID") & " ORDER BY GoodsDate")
	If ShopCommendGoodsRS.BOF And ShopCommendGoodsRS.EOF Then
%>
		<p class="msg">暂时没有推荐商品！</p>
<%
	Else
		Do Until ShopCommendGoodsRS.EOF
%>
		<div class="show">
			<h3><%=ShopCommendGoodsRS("GoodsName")%></h3>
			<img src="../resources/shop/<%=Cate%>/<%=ShopCommendGoodsRS("GoodsPic")%>" alt="<%=ShopCommendGoodsRS("GoodsName")%>" class="show" />
			<%=UbbCode(ShopCommendGoodsRS("GoodsSummary"), 0, 0, 0, 0, "")%>
			<a href="goodsview.asp?goodsid=<%=ShopCommendGoodsRS("GoodsID")%>" class="more">详细...</a>
		</div>
<%
			ShopCommendGoodsRS.MoveNext
		Loop
	End If
%>
	</div>
<%
End If
%>
</div>
<div id="sidebar">
<%
ShowContentCateList
ShowContentPanel "帮助", "<p><a href=""help.asp"">如何在本站购物？</a></p>"
If UserValue="Admin" Then
	ReDim liarray(2)
	liarray(1)="<a href=""order.asp"">查看订单</a>"
	liarray(2)="<a href=""../bbs/announcements.asp?action=AddAnn&boardid=21.asp"">发布公告</a>"

	ShowContentPanel "管理员", liarray
End If
%>
</div>
<!-- #include file="../footer.asp" -->