<script type="text/javascript" src="../inc/form.js"></script>
<%
	'读取新闻分类
	Dim NewsCateRS
	Set NewsCateRS=NewsConn.Execute("SELECT * FROM News_Cate")
%>
<form action="<%=FormAction%>" method="post">
	<table class="form">
		<colgroup>
			<col class="name" />
			<col class="content" />
		</colgroup>
		<tfoot>
			<tr>
				<td colspan="2">
<%
If FormMode="Edit" Then
%>
			<input type="hidden" name="newsid" id="newsid" value="<%=Request.QueryString("NewsID")%>" /></td>
<%
End If
%>
			<input type="submit" name="submit" value="提交" class="button" />
			<input type="reset" value="重置" class="button" />
				</td>
			</tr>
		</tfoot>
		<tbody>
			<tr>
				<td>栏目分类</td>
				<td>
					<select name="catename" id="catename">
						<option value="0">选择栏目</option>
<%
Do Until NewsCateRS.EOF
	If CateName=NewsCateRS("CateName") Then
%>
						<option value="<%=NewsCateRS("CateName")%>" selected="selected" ><%=NewsCateRS("CateName")%></option>
<%
	Else
%>
						<option value="<%=NewsCateRS("CateName")%>"><%=NewsCateRS("CateName")%></option>
<%
	End If
	NewsCateRS.MoveNext
Loop
%>
					</select>
				</td>
			</tr>
			<tr>
				<td>重新发布</td>
				<td><input type="checkbox" name="postagain" id="postagain" value="1" /></td>
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
				<td>新闻标题</td>
				<td><input type="text" name="newstitle" id="newstitle" class="text" value="<%=NewsTitle%>" /></td>
			</tr>
			<tr>
				<td>来自</td>
				<td><input type="text" name="newsfrom" id="newsfrom" class="text" value="<%=NewsFrom%>" /></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="newsurl" id="newsurl" class="text" value="<%=NewsURL%>" /></td>
			</tr>
			<tr>
				<td>导读</td>
				<td><textarea name="newsintro" id="newsintro"><%=NewsIntro%></textarea></td>
			</tr>
			<tr>
				<td>内容</td>
				<td><textarea name="newscontent" id="newscontent" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);CtrlEnter();"><%=NewsContent%></textarea></td>
			</tr>
			<tr>
				<td>文件上传</td>
				<td><iframe src="newsupfile.asp" id="newsupfile"></iframe></td>
			</tr>
		</tbody>
	</table>
		</form>