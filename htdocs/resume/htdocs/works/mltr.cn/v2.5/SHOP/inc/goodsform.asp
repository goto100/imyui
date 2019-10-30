<%
	Dim ShopCateRS
	Set ShopCateRS=ShopConn.Execute("SELECT * FROM Shop_Cate")
%>
	<form action="<%=FormAction%>" method="post" id="goodsform" name="goodsform">
			<fieldset>
			<table class="form">
				<colgroup>
					<col class="name" />
					<col class="content" />
				</colgroup>
				<tr>
					<td>栏目分类</td>
					<td>
						<select name="cateid">
								<option value="0">选择分类</option>
<%
	Do Until ShopCateRS.EOF
		If CateID=ShopCateRS("CateID") Then
%>
								<option value="<%=ShopCateRS("CateID")%>" selected="selected" ><%=ShopCateRS("CateCName")%></option>
<%
		Else
%>
								<option value="<%=ShopCateRS("CateID")%>"><%=ShopCateRS("CateCName")%></option>
<%
		End If
		ShopCateRS.MoveNext
	Loop
%>
						</select>
					</td>
				</tr>
				<tr>
					<td>推荐商品</td>
					<td>
<%
If GoodsIsCommend=True Then
%>
						<input type="checkbox" name="goodsiscommend" value="1" checked="checked" />
<%
Else
%>
						<input type="checkbox" name="goodsiscommend" value="1" />
<%
End If
%>
					</td>
				</tr>
<%
If FormMode="Edit" Then
%>
				<tr>
					<td>删除</td>
					<td><input type="checkbox" name="del" id="del" value="1" /></td>
				</tr>
<%
End If
%>
				<tr>
					<td>名称</td>
					<td><input type="text" name="goodsname" id="goodsname" value="<%=GoodsName%>" class="text" /></td>
				</tr>
				<tr>
					<td>摘要</td>
					<td><textarea name="goodssummary" id="goodsintro" style="width:100%;height:100px;"><%=GoodsSummary%></textarea></td>
				</tr>
				<tr>
					<td>介绍</td>
					<td><textarea name="goodsintro" id="goodsintro" style="width:100%;height:100px;"><%=GoodsIntro%></textarea></td>
				</tr>
				<tr>
					<td>信息</td>
					<td><textarea name="goodsinfo" id="goodsinfo" style="width:100%;height:100px;"><%=GoodsInfo%></textarea></td>
				</tr>
				<tr>
					<td>图片</td>
					<td><input type="text" name="goodspic" id="goodspic" value="<%=GoodsPic%>" class="text" /></td>
				</tr>
				<tr>
					<td>日期</td>
					<td><input type="text" name="goodsdate" id="goodsdate" value="<%=GoodsDate%>" class="text" /></td>
				</tr>
				<tr>
					<td>价格</td>
					<td><input type="text" name="goodsprice" id="goodsprice" value="<%=GoodsPrice%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>优惠价格</td>
					<td><input type="text" name="goodsfavorprice" id="goodsfavorprice" value="<%=GoodsFavorPrice%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>优惠基数</td>
					<td><input type="text" name="goodsfavornum" id="goodsfavornum" value="<%=GoodsFavorNum%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>会员价格</td>
					<td><input type="text" name="goodsmemberprice" id="goodsmemberprice" value="<%=GoodsMemberPrice%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>邮寄价格</td>
					<td><input type="text" name="goodspostprice" id="goodspostprice" value="<%=GoodsPostPrice%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>快递价格</td>
					<td><input type="text" name="goodsfastpostprice" id="goodsfastpostprice" value="<%=GoodsFastPostPrice%>" size="10" maxlength="10" class="text" /></td>
				</tr>
				<tr>
					<td>相关评论</td>
					<td><input type="text" name="goodscommenturl" id="goodscommenturl" value="<%=GoodsCommentURL%>" size="100" maxlength="100" class="text" /></td>
				</tr>
			</table>
		</fieldset>
<%
If FormMode="Edit" Then
%>
			<input type="hidden" name="goodsid" id="goodsid" value="<%=GoodsID%>" />
<%
End If
%>
		<input type="submit" name="submit" value="提交" class="button" />
		<input type="reset" value="重置" class="button" />
	</form>