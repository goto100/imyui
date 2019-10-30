<%
function HTMLPage() {
	////////// Attributes //////////////////////////////
	// Private //////////
	var pathInfo = String(Request.ServerVariables("PATH_INFO"));
	var rootStr = "";

	// Public //////////
	this.name = "";
	this.fullName = "";
	this.path = "";
	this.referer = getSiteSession("pageReferer");

	this.title = "";
	this.style = "default";
	this.category = new HTMLPage.Category();
	this.sidebarPanels = [];

	////////// Methods //////////////////////////////
	// Private //////////

	// Get path
	function getPath() {
		var pathDepth = pathInfo.match(/\//gi).length - 1 - PATHDEPTH;
		var path = pathInfo.substring(0, pathInfo.lastIndexOf("/"));
		var result = "", right = "";
		for (var i = 0; i < pathDepth; i++) {
			right = path.substring(path.lastIndexOf("/"));
			path = path.substring(0, path.lastIndexOf("/"));
			result = right + result;
		}
		if (result) return result.slice(1) + "/";
		else return "";
	}

	// Public //////////
	// Load
	this.load = function() {
		this.fullName = pathInfo.substring(pathInfo.lastIndexOf("/") + 1);
		this.name = this.fullName.substring(0, this.fullName.lastIndexOf("."));
		this.path = getPath();
		rootStr = transformPath(this.path);
		this.silent = getSilent();
	}

	// Get silent
	function getSilent() {
		var userAgentString = String(Request.ServerVariables("HTTP_USER_AGENT")).toUpperCase();
		if (userAgentString.indexOf("MSIE 6.0") != -1 && userAgentString.indexOf("OPERA") == -1) return "MSIE 6.0";
		else if (userAgentString.indexOf("MOZILLA") != -1) return "MOZILLA";
	}

	// Get referer
	this.getReferer = function() {
		if (String(Request.ServerVariables("HTTP_REFERER")) != "undefined") {
			this.referer = String(Request.ServerVariables("HTTP_REFERER"));
			setSiteSession("pageReferer", this.referer);
		}
	}

	// Transform path
	this.transformPath = function(path, isAbsolute) {
		if (path.substr(0, 1) == "/") {
			path = path.substr(1);
			for (var i = 0; i < PATHDEPTH; i++) {
				path = "../" + path;
			}
		}
		if (isAbsolute == true) return Server.MapPath(rootStr + path);
		return rootStr + path;
	}

	// Add javascript
	this.addScript = function(path) {
		if (!this.scripts) this.scripts = [];
		this.scripts.push(path);
	}

	// Add css
	this.addStyle = function(path) {
		if (!this.csses) this.csses = [];
		this.csses.push(path);
	}

	// Header
	this.outputHeader = function() {
		if (this.category.inId) this.title += this.category.subCategory[this.category.inId].name + " - ";
		this.title += this.category.name;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=this.title%> - MLTR中文站</title>
<%
		if (this.scripts) {
			for (var i = 0; i < this.scripts.length; i++) {
%>
<script src="<%=rootStr%>scripts/<%=this.scripts[i]%>.js" type="text/javascript"></script>
<%
			}
		}
		if (this.csses) {
			for (var i = 0; i < this.csses.length; i++) {
%>
<link href="<%=rootStr%>styles/<%=this.style%>/<%=this.csses[i]%>.css" rel="stylesheet" type="text/css" />
<%
			}
		}
%>
</head>

<body id="Page-<%=this.category.id%>">
<div id="Wrapper">
<div id="InnerWrapper">
<div id="Header">
	<p id="Main"><a href="<%=rootStr%>default.asp" title="返回首页">返回首页</a></p>
	<ul id="LoginInfo">
<%
		if (user.loggedIn) {
%>
		<li>欢迎 <%=user.name%></li>
		<li><a href="<%=rootStr%>login.asp?logout">登出</a></li>
<%
		} else {
%>
		<li>未登录</li>
		<li><a href="<%=rootStr%>login.asp">登录</a></li>
		<li><a href="<%=rootStr%>bbs/reg.asp">注册</a></li>
<%
		}
%>
	</ul>
	<ul id="Navbar">
		<li id="Navbar_news"><a href="<%=rootStr%>news/" title="新闻">新闻</a></li>
		<li id="Navbar_info"><a href="<%=rootStr%>info/" title="资料">资料</a></li>
		<li id="Navbar_album"><a href="<%=rootStr%>album/" title="专辑">专辑</a></li>
		<li id="Navbar_photo"><a href="<%=rootStr%>photo/" title="图片">图片</a></li>
		<li id="Navbar_music"><a href="<%=rootStr%>music/" title="音乐">音乐</a></li>
		<li id="Navbar_download"><a href="<%=rootStr%>download/" title="下载">下载</a></li>
		<li id="Navbar_shop"><a href="<%=rootStr%>shop/" title="购物">购物</a></li>
		<li id="Navbar_bbs"><a href="<%=rootStr%>bbs/" title="论坛">论坛</a></li>
	</ul>
	<%if (this.headline){%><h1><%=this.headline%></h1><%}%>
</div>
<div id="ContentWrapper">
<div id="Content"<%if (!this.category.inId) {%> class="fullWidth"<%}%>>
<%
	}

	// Footer
	this.outputFooter = function(noSidebar) {
%>
</div>
<%
		if (!noSidebar && this.category.inId) {
%>
<div id="Sidebar">
<%
		if (this.category.subCategory) {
%>
<ul id="Categories">
<%
			var e = this.category.subCategory.getExpandoNames();
			for (var i = 0; i < e.length; i++) {
%>
	<li<%if (this.category.inId == this.category.subCategory[e[i]].id) {%> class="active"<%}%>><a href="<%=this.category.subCategory[e[i]].link%>" title="<%=this.category.subCategory[e[i]].name%>"><%=this.category.subCategory[e[i]].name%></a></li>
<%
			}
%>
</ul>
<%
		}
		if (this.sidebarPanels.length) {
			for (var i = 0; i < this.sidebarPanels.length; i++) {
%>
<div class="panel">
	<h3><%=this.sidebarPanels[i].title%></h3>
	<ul>
<%
				for (var j = 0; j < this.sidebarPanels[i].items.length; j++) {
%>
		<li><%=this.sidebarPanels[i].items[j]%></li>
<%
				}
%>
	</ul>
</div>
<%
			}
		}
%>
</div>
<%
		}
%>
</div>
<div id="Footer">
	<ul id="SiteLink">
		<li><a onclick="javascript:this.style.behavior='url(#default#homepage)';this.setHomeHTMLPage('http://www.mltr.cn/');return false;" 
	href="#" title="设为首页">设为首页</a></li>
		<li><a 
	href="javascript:window.external.AddFavorite('http://www.mltr.cn/', 'MLTR中文站')" title="收藏本站">收藏本站</a></li>
	</ul>
	<p id="Copy">版权所有 <a href="http://www.mltr.cn/" class="sitename">MLTR.Cn</a> V 3.0 2005</p>
</div>
</div>
</div>
</body>
</html>
<%
	}

	this.addPanel = function(title, arr) {
		this.sidebarPanels.push({"title":title, "items":arr});
	}

	// Output
	this.output = function(content) {
		if (content) content();
		else {
			this.outputHeader();
			this.content();
			this.outputFooter();
		}
		Response.End();
	}

	this.outputIndex = function() {
		this.addStyle("index");
		this.outputHeader();
%>
<div id="index">
<img class="index" src="../styles/default/images/index_<%=this.category.id%>.jpg" alt="<%=this.category.namet%>" />
<%
		if (this.category.subCategory) {
%>
<ul>
<%
			var e = this.category.subCategory.getExpandoNames();
			for (var i = 0; i < e.length; i++) {
%>
	<li><a href="<%=this.category.subCategory[e[i]].link%>" title="<%=this.category.subCategory[e[i]].name%>"><img src="<%=rootStr%>styles/default/images/cate_<%=this.category.id%>_<%=this.category.subCategory[e[i]].id%>.gif" alt="<%=this.category.subCategory[e[i]].name%>" /></a></li>
<%
			}
%>
</ul>
<%
		}
%>
</div>
<%
		this.outputFooter(true);
	}

	// Output a system message
	this.outputMsg = function(content) {
		this.title = content;
		this.content = function() {
%>
<div id="msg">
	<h1><%=content%></h1>
	<p><a href="javascript:history.go(-1)">返回</a></p>
</div>
<%
		}
		this.output();
		Response.End();
	}

	// HTMLPagebar
	this.outputPagebar = function(size, current, param) {
%>
	<div class="pagebar">
<%
		if (current != 1) {
%>
	<p class="first"><a href="?<%if(param) write(param + "&")%>p=1" title="首页">&lt;&lt;</p>
<%
		}
		if (current - 1 > 0) {
%>
	<p class="previous"><a href="?<%if(param) write(param + "&")%>p=<%=current-1%>" title="上一页">&lt;</p>
<%
		}
%>
	<ul>
<%
		for (var i = 0; i < size; i++) {
			if (i + 1 == current) {
%>
		<li class="active"><%=i+1%></li>
<%
			} else {
%>
		<li><a href="?<%if(param) write(param + "&")%>p=<%=i+1%>" title="第 <%=i+1%> 页"><%=i+1%></a></li>
<%
			}
		}
%>
	</ul>
<%
		if (current + 1 <= size) {
%>
	<p><a href="?<%if(param) write(param + "&")%>p=<%=current+1%>" title="下一页">&gt;</a></p>
<%
		}
		if (current != size) {
%>
	<p class="last"><a href="?<%if(param) write(param + "&")%>p=<%=size%>" title="最后一页">&gt;&gt;</a></p>
<%
		}
%>
	<p class="total">共 <%=size%> 页</p>
</div>
<%
	}

	// Set title
	this.setTitle = function(title) {
		this.title = title + " - ";
		this.headline = title;
	}

	// Set headlin
	this.setHeadline = function(headline) {
		this.headline = headline + " - " + this.headline;
	}

	// Redirect
	this.redirect = function(url) {
		Response.Redirect(url);
	}
}

HTMLPage.Category = function() {
	this.length = 0;
	this.subCategory = [];
	this.addCategory = function(id, name, link) {
		var category = new HTMLPage.Category();
		category.id = id;
		category.name = name;
		category.link = link;
		this.subCategory[id] = category;
		this.length++;
	}
}

HTMLPage.Form = function() {
	var items = [];

	this.action = "";
	this.method = "post";

	this.addItem = function(type, name, title, rows) {
		var item = {"name":name,
			"title":title,
			"type":type,
			"rows":rows,
			"setValues":function(values, valueFlag, titleFlag) {
				this.values = values;
				this.valueFlag = valueFlag;
				this.titleFlag = titleFlag;
			}
		}
		if (this.value) item.value = this.value[item.name];
		if (this.source) {
			item.value = this.source.item[item.name].value;
			item.error = this.source.item[item.name].error;
		}
		items.push(item);
		return item;
	}

	this.addOutput = function(content) {
		items.push(content);
	}

	this.output = function() {
%>
<form action="<%=this.action%>" method="<%=this.method%>">
<%
		for (var i = 0; i < items.length; i++) {
			if (items[i].type != "hidden") {
%>
	<div class="formItem">
<%
			}
			if (items[i].title) {
%>
		<label><%=items[i].title%>：</label>
<%
			}
			switch (items[i].type) {
				case "text":
%>
		<input type="text" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "hidden":
%>
		<input type="hidden" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "password":
%>
		<input type="password" name="<%=items[i].name%>" value="<%=items[i].value%>" />
<%
					break;
				case "checkbox":
%>
		<input type="checkbox" name="<%=items[i].name%>" value="Ture"<%if (items[i].value) {%> checked="checked"<%}%> />
<%
					break;
				case "textarea":
%>
		<textarea name="<%=items[i].name%>" rows="<%=items[i].rows%>"><%=items[i].value%></textarea>
<%
					break;
				case "select":
%>
		<select name="<%=items[i].name%>">
<%
					for (var j = 0; j < items[i].values.length; j++) {
						var value = items[i].values[j][items[i].valueFlag];
						var title = items[i].values[j][items[i].titleFlag];
%>
			<option value="<%=value%>"<%if (items[i].value == value) {%> selected="selected"<%}%>><%=title%></option>
<%
					}
%>
		</select>
<%
					break;
				default:
					items[i]();
			}
			if (items[i].error) {
%>
		<p class="alert"><%=items[i].error%></p>
<%
			}
			if (items[i].type != "hidden") {
%>
	</div>
<%
			}
		}
%>
	<input type="submit" value="提交" class="submit" />
</form>
<%
	}
}
%>
