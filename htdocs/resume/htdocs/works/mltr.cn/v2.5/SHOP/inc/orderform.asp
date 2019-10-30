		<form method="post" action="<%=FormAction%>">
<%
If FormMode="Edit" Then
%>
			<fieldset>
				<legend>订单信息</legend>
				<table class="form">
					<colgroup>
						<col class="name" />
						<col class="content" />
					</colgroup>
					<tr>
						<td>订单号</td>
						<td>
							<%=ShowOrderID(OrderRS)%>
							<input type="hidden" name="orderid" value="<%=OrderRS("OrderID")%>" />
						</td>
					</tr>
					<tr>
						<td>订单金额</td>
						<td><%=ShowOrderPriceShow(OrderRS("GoodsID"), OrderRS("OrderGoodsAmount"), OrderRS("OrderDeliver"))%></td>
					</tr>
					<tr>
						<td>实交金额</td>
						<td><input name="orderfactprice" type="text" class="text" value="<%=OrderRS("OrderFactPrice")%>" size="10" maxlength="10" /></td>
					</tr>
					<tr>
						<td>订单状态</td>
						<td>
							<select name="orderstate">
								<optgroup label="请选择订单状态">
<%
	Dim i
	For i=0 To 3
%>
									<option value="<%=i%>"<%If OrderRS("OrderState")=i Then Response.Write(" selected=""selected""")%>><%=ShowOrderState(i)%></option>
<%
	Next
%>
								</optgroup>
							</select>
						</td>
					</tr>
					<tr>
						<td>删除订单</td>
						<td><input type="checkbox" name="del" value="1" /></td>
					</tr>
				</table>
			</fieldset>
<%
End If
%>
			<fieldset>
				<legend>用户信息</legend>
				<table class="form">
					<colgroup>
						<col class="name" />
						<col class="content" />
					</colgroup>
					<tr>
<%
If FormMode="Post" Then
	If UserIsPassed="Passed" Then
%>
						<td>网站帐号</td><td><em><%=UserName%></em>
						<input type="hidden" name="orderusername" value="<%=UserName%>" />
<%
	Else
%>
						<td><label for="form_orderusername">网站帐号</label></td><td>
						<input type="text" id="form_orderusername" name="orderusername" class="text" />
<%
	End If
%>
						<em>方便您查阅订单状态与为您提供网站会员服务。</em></td>
<%
ElseIf FormMode="Edit" Then
%>
						<td>网站帐号</td><td><em><%=ShowString(OrderRS("OrderUserName"))%></em></td>
<%
End If
%>
					</tr>
					<tr>
						<td><label for="form_orderrealname">真实姓名</label></td><td>
						<input type="text" id="form_orderrealname" name="orderrealname" class="text" size="20" maxlength="20"<%If FormMode="Edit" Then Response.Write(ShowEdit("value", OrderRS("OrderRealName")))%> />
						<strong title="必填">*</strong></td>
					</tr>
					<tr>
						<td><label for="form_orderuserphone">联系电话</label></td><td>
						<input type="text" id="form_orderuserphone" name="orderuserphone" class="text" size="20" maxlength="20"<%If FormMode="Edit" Then Response.Write(ShowEdit("value", OrderRS("OrderUserPhone")))%> /></td>
					</tr>
					<tr>
						<td><label for="form_orderuseremail">E'Mail</label></td><td>
						<input type="text" id="form_orderuseremail" name="orderuseremail" class="text" size="20" maxlength="20"<%If FormMode="Edit" Then Response.Write(ShowEdit("value", OrderRS("OrderUserEmail")))%> /></td>
					</tr>
					<tr>
						<td><label for="form_orderuserqq">QQ</label></td><td>
						<input type="text" id="form_orderuserqq" name="orderuserqq" class="text" size="20" maxlength="20"<%If FormMode="Edit" Then Response.Write(ShowEdit("value", OrderRS("OrderUserQQ")))%> /></td>
					</tr>
					<tr>
						<td><label for="form_orderuserzipcode">邮政编码</label></td><td>
						<input type="text" id="form_orderuserzipcode" name="orderuserzipcode" class="text" size="20" maxlength="20"<%If FormMode="Edit" Then Response.Write(ShowEdit("value", OrderRS("OrderUserZipCode")))%> /></td>
					</tr>
					<tr>
						<td><label for="form_orderuseraddress">送货地址</label></td>
						<td>
							<textarea id="form_orderuseraddress" name="orderuseraddress" cols="80" rows="2"><%If FormMode="Edit" Then Response.Write(OrderRS("OrderUserAddress"))%></textarea>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>商品信息</legend>
				<table class="form">
					<colgroup>
						<col class="name" />
						<col class="content" />
					</colgroup>
					<tr>
						<td>商品编号</td><td><em><%=GoodsID%></em>
						<input type="hidden" name="goodsid" value="<%=Request.QueryString("goodsid")%>" /></td>
					</tr>
					<tr>
						<td>商品名称</td><td><em><%=GoodsName%></em></td>
					</tr>
					<tr>
						<td><label for="form_ordergoodsamount">购买数量</label></td><td>
						<input type="text" id="form_ordergoodsamount" name="ordergoodsamount" value="<%If FormMode="Post" Then Response.Write(1) Else Response.Write(OrderRS("OrderGoodsAmount"))%>" class="text" size="3" maxlength="3" /></td>
					</tr>
					<tr>
						<td><label for="form_orderdeliver">送货方式</label></td><td>
						<select id="form_orderdeliver" name="orderdeliver">
							<optgroup label="请选择送货方式">
								<option value="1"<%If FormMode="Edit" Then:If OrderRS("OrderDeliver")=1 Then Response.Write(" selected=""selected""")%>>邮购</option>
								<option value="2"<%If FormMode="Edit" Then:If OrderRS("OrderDeliver")=2 Then Response.Write(" selected=""selected""")%>>快递</option>
								<option value="3"<%If FormMode="Edit" Then:If OrderRS("OrderDeliver")=3 Then Response.Write(" selected=""selected""")%>>上门取货</option>
							</optgroup>
						</select>
						</td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend></legend>
					<table class="form">
						<colgroup>
							<col class="name" />
							<col class="content" />
						</colgroup>
						<tr>
							<td>其他信息</td>
							<td><textarea id="form_orderremark" name="orderremark" cols="80" rows="6"><%If FormMode="Post" Then Response.Write("务必在此详细说明所需物品信息，如衣服男、女款，型号等。") Else Response.Write(OrderRS("OrderRemark"))%></textarea></td>
						</tr>
					</table>
			</fieldset>
				<input type="submit" value="发送订单" class="button" />
				<input type="reset" value="重置" class="button" />
		</form>