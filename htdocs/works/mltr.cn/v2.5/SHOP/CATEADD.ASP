<!-- #include file="../common.asp" -->
<!-- #include file="../inc/function.asp" -->
<%
title="添加商品分类"
%>
<!-- #include file="../header.asp" -->
<div id="bodier">
<!-- #include file="common.asp" -->
<%
If UserValue<>"Admin" Then
	ShowAlert "提交失败", "novalue", "", ""
Else
	If Request.QueryString("action")="post" Then
		If Request.Form("cateorder")=Empty Or Request.Form("catename")=Empty Or Request.Form("catecname")=Empty Then
			'内容未填写完整
			ShowAlert "提交失败","您的表单未填写完整，请填写完全进行提交","backnorefresh", ""
		Else
			Dim ShopCateRS
			Set ShopCateRS=ShopConn.Execute("INSERT INTO Shop_Cate (CateID, CateName, CateCName) VALUES (" & Request.Form("cateorder") & ", '" & Request.Form("catename") & "', '" & Request.Form("catecname") & "')")
			Set ShopCateRS=Nothing
	
			'Session("LastPostTime")=Now()

			ShowAlert "提交成功", "您已发布商品分类，谢谢", "nofreshback", ""
		End If
	Else
%>
	<div id="form">
		<form method="post" action="?action=post" id="cateadd">
			<label for="cateorder">排序</label><input type="text" name="cateorder" id="cateorder" class="text" />
			<label for="catename">英文名称</label><input type="text" name="catename" id="catename" class="text" />
			<label for="catecname">中文名称</label><input type="text" name="catecname" id="catecname" class="text" />
			<input type="submit" name="Submit" value="提交" class="button" />
		</form>
	</div>

<%
	End If
End If
%>
</div>
<!-- #include file="../footer.asp" -->