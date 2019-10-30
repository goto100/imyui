<script language="vbscript" runat="server">
'Function UbbCode
Function UbbCode(str, s1, s2, s3, s4, s5)
	If IsNull(str) Or Trim(str)=Empty Then Exit Function
	Dim text
	text=Left(str, 1)
	If text<>"[" Then
		str="<p>" & str
	End If

	text=Right(str, 1)
	If text<>"]" Then
		str=str & "</p>"
	End If

	str=CheckExp(str, "\[\/url\](\s)*?\[url", "[/url][url")

	str=CheckExp(str, "(\r\n\r\n)+?(([^\u4E00-\u9FA5])+?(\r\n)+?)", "<p class=""english"">$2")
	str=CheckExp(str, "(\r\n\r\n)+?(([^\u4E00-\u9FA5])+?(\r\n)+?)", "<p class=""english"">$2")
	str=CheckExp(str, "(\r\n\r\n)+", "<p>")
	
	str=CheckExp(str, "\r\n", "<br />")

	'[info]
	str=CheckExp(str, "(\[note\])", "[note=提示]")
	str=CheckExp(str, "(\[note)=([\s\S]*?)(\])([\s\S]*?)(\[\/note\])", "<div class=""note""><h3>$2</h3>$4</div>")


	'[hr]
	str=CheckExp(str, "(\[hr\])", "<hr />")

	str=CheckExp(str, "(\[ul\])([\s\S]*?)(\[\/ul\])", "<ul>$2</ul>") '[ul]
	str=CheckExp(str, "(\[ol\])([\s\S]*?)(\[\/ol\])", "<ol>$2</ol>") '[ol]
	str=CheckExp(str, "(\[li\])([\s\S]*?)(\[\/li\])", "<li>$2</li>") '[li]
	str=CheckExp(str, "(\[h2\])([\s\S]*?)(\[\/h2\])", "<h2>$2</h2>") '[h2]
	str=CheckExp(str, "(\[h3\])([\s\S]*?)(\[\/h3\])", "<h3>$2</h3>") '[h3]
	str=CheckExp(str, "(\[h4\])([\s\S]*?)(\[\/h4\])", "<h4>$2</h4>") '[h4]
	str=CheckExp(str, "(\[h3\])([\s\S]*?)(\[\/h3\])", "<h3>$2</h3>") '[h3]
	str=CheckExp(str, "(\[h6\])([\s\S]*?)(\[\/h6\])", "<h6>$2</h6>") '[h6]
	str=CheckExp(str, "(\[dl\])([\s\S]*?)(\[\/dl\])", "<dl>$2</dl>") '[dl]
	str=CheckExp(str, "(\[dt\])([\s\S]*?)(\[\/dt\])", "<dt>$2</dt>") '[dt]
	str=CheckExp(str, "(\[dd\])([\s\S]*?)(\[\/dd\])", "<dd>$2</dd>") '[dd]
	str=CheckExp(str, "(\[del\])([\s\S]*?)(\[\/del\])", "<del>$2</del>") '[del]
	str=CheckExp(str, "(\[em\])([\s\S]*?)(\[\/em\])", "<em>$2</em>")'[em]

	'[img]
	str=CheckExp(str, "(\[img])([\s\S]*?)(\[\/img])", "[img=$2]$2[/img]")
	str=CheckExp(str, "(\[img)=([\s\S]*?)(\])([\s\S]*?)(\[\/img\])", "<img src=""$4"" alt=""$2"" onload=""javascript:changesize(this, 560);"" />")

	'[email]
	str=CheckExp(str, "\@", "[at]")
	str=CheckExp(str, "(\[email])([\s\S]*?)(\[\/email])", "<a href=""mailto:$2"" onclick=""this.href=(this.href).replace(/\[at\]/,String.fromCharCode(64));"" class=""email"">$2</a>")

	'[url]
	str=CheckExp(str, "(\[url\])([\s\S]*?)(\[\/url])", "[url=$2]$2[/url]")
	str=CheckExp(str, "(\[url)=([\s\S]*?)(\])([\s\S]*?)(\[\/url\])", "<a href=""$2"">$4</a>")

	'[quote]
	str=CheckExp(str, "(\[quote\])", "[quote=未知]")
	str=CheckExp(str, "(\[quote=)([\s\S]+?)(\])([\s\S]+?)(\[\/quote\])", "<blockquote><h3>引用自 $2</h3>$4</blockquote>")

	'[inscribe]
	str=CheckExp(str, "(\[inscribe\])([\s\S]*?)(\[\/inscribe\])", "<p class=""inscribe"">$2</p>") '题注

	'[p]
	str=CheckExp(str, "(\[p\])([^。，！《—：]+?)(\[\/p\])", "<p class=""english"">$2</p>") '英文段落
	str=CheckExp(str, "(\[p\])([\s\S]*?)(\[\/p\])", "<p>$2</p>") '普通段落
	
	'[intro]
	str=CheckExp(str, "(\[intro\])([\s\S]*?)(\[\/intro\])", "<div class=""intro"">$2</div>")
	
	'[list]
	str=CheckExp(str, "(\[list\])([\s\S]*?)(\[\/list\])", "<ul>$2</ul>")
	str=CheckExp(str, "(\[list)=(.*?)(\])([\s\S]*?)(\[\/list\])", "<ol start=""$2"">$4</ol>")
	str=CheckExp(str, "(\[\*\])([\s\S]*?)(\[\/\*\])", "<li>$2</li>")
	str=CheckExp(str, "(\[\*\])([\s\S]*?)", "<li>$2</li>")

	UbbCode=str
End Function

function filt_UBB(str)
	objRegExp.Pattern="(\[.+?\])([\s\S]*?)(\[\/.+?\])"
	while objRegExp.Test(str)
		str=objRegExp.Replace(str,"<ubb>$2</ubb>")
	wend
	set objRegExp=Nothing
	filt_UBB=str
end function

Function CheckExp(str, strubb, strtag)
	Dim re

	Set re=New RegExp '建立一个新对像
	re.IgnoreCase=true '搜索是否区分大小写的
	re.Global=True '搜索是否应用于整个字符串
	re.Pattern=strubb '设置模板

	CheckExp=re.replace(str, strtag)
End Function 
</script>