<!-- #include file = "source/song.asp" -->
<!-- #include file = "../common/ubb.asp" -->
<%
switch (page.id) {
	case "add":
	case "addError":
		var addMode = true;
	case "edit":
	case "editError":
		page.setTitle(addMode? "添加" : "编辑");
		page.content = function() {
%>
<div id="<%=addMode? "add" : "edit"%>">
<%
	var form = new HTMLPage.Form();
	form.action = addMode? "?add=do" : "?edit=do";
	form.value = song;
	form.source = Song.form;

	if (!addMode) form.addItem("hidden", "id");
	form.addItem("text", "name", "名称", true, "名称必填");
	form.addItem("text", "transName", "中文译名");
	form.addItem("text", "author", "作者");
	form.addItem("textarea", "lyric", "歌词", 10);
	form.addItem("text", "copyright", "版权");
	form.addItem("checkbox", "listen", "试听");
	form.output();
%>
</div>
<%
		}
		break;
	case "addSuccess":
		page.outputMsg("添加成功");
	case "editSuccess":
		page.outputMsg("修改成功");
	case "deleteSuccess":
		page.outputMsg("删除成功");
	case "show":
		page.category.inId = "lyric";
		page.setTitle(song.name);
		page.content = function() {
			
%>
<div id="song" class="text">
<%=UbbCode(song.lyric, 1, 1, 1, 1, 1)%>
</div>
<%
		}
		if (user.isAdmin) page.addPanel("管理", ["<a href=\"song.asp?edit&amp;id=" + song.id + "\">编辑</a>"]);
		break;
	case "listen":
		function outputListen() {
%>
<html>
<head>
<style type="text/css">
body{width:300px;height:380px;text-align:center;background:  url("../styles/default/images/listenbox.gif") no-repeat top center;margin:0 auto;padding:30px 13px 37px 13px;}
div#musicplayer{height:313px;background:  url("../styles/default/images/listenfinal.gif") no-repeat bottom center;margin:0;padding:0;}
div#musicplayer object{width:274px;height:159px;}
div#musicplayer embed{width:274px;height:159px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body oncontextmenu="self.event.returnValue=false;">
<div id="musicplayer">
	<object classid="clsid:6BF52A52-394A-11D3-B153-00C04F79FAA6">
		<param name="url" value="http://www.mltr.cn/resources/music/listen/<%=song.name%>.wma" />
		<param name="autostart" value="true" />
		<param name="enablecontextmenu" value="false">
		<embed autostart="true" src="http://www.mltr.cn/resources/music/listen/<%=song.name%>.wma" />
	</object>
</div>
</body>
</html>
<%
		}
		page.output(outputListen);
 		break;
	default:
		page.redirect("index.asp");
}

page.output();
%>