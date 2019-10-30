<!--#include file="../conn.asp" -->
<%
try {
function getItem(id) {
	switch(id) {
		case 1: return "市场调查"; break;
		case 2: return "企业形象设计"; break;
		case 3: return "标志设计"; break;
		case 4: return "包装设计"; break;
		case 5: return "多媒体演示"; break;
		case 6: return "广告策划"; break;
		case 7: return "动画影视剧开发"; break;
		case 8: return "电视节目包装"; break;
		case 9: return "游戏设计制作"; break;
		case 10: return "展会设计"; break;
		case 11: return "游戏动画制作"; break;
		case 12: return "手机动画"; break;
		case 13: return "地产演示动画"; break;
		case 14: return "玩具模型设计"; break;
		case 15: return "卡通形象设计"; break;
	}
}
var content = "<h2>客户信息</h2>";
content += "<ul><li>联系人：" + input.name + "</li>";
content += "<li>公司：" + input.company + "</li>";
content += "<li>地址：" + input.address + "</li>";
content += "<li>公司网址：" + input.website + "</li>";
content += "<li>电话：" + input.tel + "</li>";
content += "<li>邮件：" + input.mail + "</li></ul>";

content += "<h2>服务项目</h2><ul>";
var items = input.services.split(", ");
for (var i = 0; i < items.length; i++) content += "<li>" + getItem(parseInt(items[i])) + "</li>";
content += "<li>具体描述：" + input.detail + "</li>"
content += "</ul>"

var jmail = new ActiveXObject("JMAIL.SMTPMail");
jmail.silent = false;
jmail.logging = true;
jmail.Charset = "GB2312";
jmail.ContentType = "text/html";
jmail.ServerAddress = "mail.plus3design.cn";
jmail.AddRecipient("service@plus3design.cn");
jmail.SenderName = "scyui@163.com";
jmail.Priority = 1;
jmail.Subject = "客户 " + input.name + " 发来邮件！";
jmail.Body = content;
jmail.Execute();
jmail.Close();
Response.Redirect("success.htm");
} catch(e) {
Response.Redirect("index.htm");
}
%>