function externalLinks() {
	var anchors = document.getElementsByTagName("a");
	for (var i=0; i<anchors.length; i++) {
		if (anchors[i].getAttribute("href") && anchors[i].getAttribute("rel") == "external") anchors[i].target = "_blank";
	}
}

window.onload = externalLinks;preloadImages('/css/images/nav_newsactive.gif','/css/images/nav_infoactive.gif','/css/images/nav_albumactive.gif','/css/images/nav_photoactive.gif','/css/images/nav_musicactive.gif','/css/images/nav_downloadactive.gif','/css/images/nav_shopactive.gif','/css/images/nav_forumactive.gif');

function refresh(strurl, inttime) {
	window.setTimeout("location.replace('"+strurl+"')", inttime * 1000);
}

function preloadImages() {
	if(!document.p) document.p=new Array();
	var i,j=document.p.length,a=preloadImages.arguments;
	for(i=0; i<a.length; i++) {
		if (a[i].indexOf("#")!=0) {
			document.p[j]=new Image; document.p[j++].src=a[i];
		}
	}
}
//交换图片部分
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}



//反选
function SelectOthers(form) {
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i];
		if (e.checked==false) { e.checked = true; }
		else { e.checked = false; }
	}
}

//全选
function SelectAll(form) {
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i]; e.checked = true; }
}

//清除
function SelectCancelAll(form) {
	for (var i=0;i<form.elements.length;i++) {
		var e = form.elements[i]; e.checked = false; }
}

//显示Flash
function ShowSwf(url, width, height) {
	document.write("<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0\" width=\"" + width + "\" height=\"" + height + "\">");
	document.write("<param name=\"movie\" value=\"" + url + "\" />");
	document.write("<param name=\"quality\" value=\"high\" />");
	document.write("<embed src=\"" + url + "\" quality=\"high\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" width=\"" + width + "\" height=\"" + height + "\"></embed>");
	document.write("</object>");
}

function ShowWmp(url, width, height) {
	document.write("<object classid=\"clsid:22d6f312-b0f6-11d0-94ab-0080c74c7e95\" codebase=\"http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#version=6,0,02,902\" type=\"application/x-oleobject\" standby=\"loading...\" width=" + width + " height=" + height + ">");
	document.write("<param name=\"filename\" value=\"" + url + "\">");
	document.write("<param name=\"showstatusbar\" value=\"-1\">");
	document.write("<param name=\"autostart\" value=\"true\">");
	document.write("<embed type=\"application/x-mplayer2\" pluginspage=\"http://www.microsoft.com/windows/mediaplayer/\" src=\"" + url + "\" autostart=true width=" + width + " height=" + height + "></embed>");
	document.write("</object>");
}
function ShowRm(url, width, height) {
	document.write("<object classid=\"clsid:cfcdaa03-8be4-11cf-b84b-0020afbbccfa\" width=" + width + " height=" + height + ">");
	document.write("<param name=\"src\" value=\"" + url + "\">");
	document.write("<param name=\"controls\" value=\"imagewindow\">");
	document.write("<param name=\"console\" value=\"one\">");
	document.write("<param name=\"autostart\" value=\"true\"><embed src=\"" + url + "\" nojava=\"true\" controls=\"imagewindow\" console=\"one\" width=" + width + " height=" + height + ">");
	document.write("</object>");
	document.write("<object classid=\"clsid:cfcdaa03-8be4-11cf-b84b-0020afbbccfa\" width=" + width + " height=\"32\">");
	document.write("<param name=\"controls\" value=\"statusbar\">");
	document.write("<param name=\"autostart\" value=\"true\">");
	document.write("<param name=\"console\" value=\"one\">");
	document.write("<embed src=\"" + url + "\" nojava=\"true\" controls=\"statusbar\" console=\"one\" width=" + width + " height=\"24\">");
	document.write("</object>");
	document.write("<object classid=\"clsid:cfcdaa03-8be4-11cf-b84b-0020afbbccfa\" width=" + width + " height=\"32\">");
	document.write("<param name=\"controls\" value=\"controlpanel\">");
	document.write("<param name=\"autostart\" value=\"true\">");
	document.write("<param name=\"console\" value=\"one\">");
	document.write("<embed src=\"" + strURL + "\" nojava=\"true\" controls=\"controlpanel\" console=\"one\" width=" + width + " height=\"24\" autostart=\"true\" loop=\"false\">");
	document.write("</object>");
}

function ShowQt(url, width, height) {
	document.write("<embed src=\"" + url + "\" autoplay=\"true\" Loop=\"false\" controller=\"true\" playeveryframe=\"false\" cache=\"false\" scale=\"TOFIT\" kioskmode=\"false\" targetcache=\"false\" pluginspage=\"http://www.apple.com/quicktime/\" />");
}

function ubbShowObj(strType,strID,strURL,intWidth,intHeight)
{
	var varHeader="b";
	var tmpstr="";
	var bSwitch = false;
	//Reverse the State
	bSwitch = document.getElementById(varHeader+strID).value;
	bSwitch	=~bSwitch;
	document.getElementById(varHeader+strID).value = bSwitch;
	if(bSwitch){
		//Code for already shown
		document.getElementById(strID).innerHTML = "Source URL: <A href='" + strURL + "' target=\"new\">" + strURL + "</a>";
	}else{
		//Code for not shown
		switch(strType){
			case "swf":
				tmpstr=ShowSwf(strURL, intWidth, intHeight);
				break;
			case "wmp":
				tmpstr=ShowWmp(strURL, intWidth, intHeight);
				break;
			case "rm":
				tmpstr=ShowRm(strURL, intWidth, intHeight);
				break;
			case "qt":
				tmpstr=ShowQt(strURL, intWidth, intHeight);
				break;
		}
		document.getElementById(strID).innerHTML = tmpstr;
	}
}

//Change Cell Content - By SiC/CYAN
function switchCell(n, hash) {
	nc=document.getElementsByName("navcell");
	if(nc){
		t=document.getElementsByName("tb")
		for(i=0;i<nc.length;i++){
			nc.item(i).className="";
			t.item(i).className="hide";
		}
		nc.item(n-1).className="on";
		t.item(n-1).className="tab-content show-table";
	}else if(navcell){
		for(i=0;i<navcell.length;i++){
			navcell[i].className="";
			tb[i].className="hide";
		}
		navcell[n-1].className="on";
		tb[n-1].className="show";
	}
	if(hash){
		document.location="#"+hash;
	}
}

//Quote Comment Text - SiC/CYAN 2004
function doquote(objID,strAuthor){
	document.inputform.message.value += "[quote="+strAuthor+"] "+document.getElementById(objID).innerText+" [/quote]\n";
	window.location.hash="comment";
}
function changesize(obj, intwidth, intheight) {
	var width=obj.width;
	var height=obj.height;
	if(width>intwidth && height>intheight) {
		if (width>height) obj.width=intwidth;
		else if(height>width) obj.height=intheight;
		else obj.width=intwidth;
	}
	else if (width>intwidth) obj.width=intwidth;
}