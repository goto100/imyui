// JavaScript Document

//��ֹ������
if (top.location !== self.location) {
top.location=self.location;
}

//SEARCH������
function onEnter(event)
{
	var bolOldBrowser = (document.layers) ? true : false;
	var intKeyCode = 0;
	
	if (bolOldBrowser)
		intKeyCode = event.which;
	else
		intKeyCode = event.keyCode;
	if (intKeyCode == 13)
		return SearchService();
}

//��ҳ������ʾ������
document.onclick = function(ev) 
{ 
var targetId, srcElement, targetElement; 
var ev = window.event || ev; 
var srcElement = ev.srcElement || ev.target; 
if (srcElement.className == "outline") { 
targetId = srcElement.id + "Details"; 
targetElement = document.getElementById(targetId); 
if (targetElement.style.display == "none") { 
targetElement.style.display = ""; 
} else { 
targetElement.style.display = "none"; 
} 
} 
}

//��ʾ-����Ԫ��
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'block':(v=='hide')?'none':v; }
    obj.display=v; }
}

//������
function bookstoreSearchCheck()
{
               if (document.getElementById("searchText").value=="")
                {
                        window.alert("�����������ؼ���")
                        return false;
                }
}