//滚动图片
function verifyCompatibleBrowser(){
this.ver=navigator.appVersion
this.dom=document.getElementById?1:0
this.ie5=(this.ver.indexOf("MSIE 5")>-1 && this.dom)?1:0;
this.ie4=(document.all && !this.dom)?1:0;
this.ns5=(this.dom && parseInt(this.ver) >= 5) ?1:0;

this.ns4=(document.layers && !this.dom)?1:0;
this.bw=(this.ie5 || this.ie4 || this.ns4 || this.ns5)
return this
}
bw=new verifyCompatibleBrowser()

var speed=10

var loop, timer

function ConstructObject(obj,nest){
nest=(!nest) ? '':'document.'+nest+'.'
this.el=bw.dom?document.getElementById(obj):bw.ie4?document.all[obj]:bw.ns4?eval(nest+'document.'+obj):0;
this.css=bw.dom?document.getElementById(obj).style:bw.ie4?document.all[obj].style:bw.ns4?eval(nest+'document.'+obj):0;
this.scrollWidth=bw.ns4?this.css.document.width:this.el.offsetWidth
this.clipWidth=bw.ns4?this.css.clip.width:this.el.offsetWidth
this.up=MoveAreaUp;this.down=MoveAreaDown;
this.MoveArea=MoveArea; this.x; this.y;
this.obj = obj + "Object"
eval(this.obj + "=this")
return this
}
function MoveArea(x,y){
this.x=x;this.y=y
this.css.left=this.x
this.css.top=this.y
}

function MoveAreaDown(move){
if(this.x>-this.scrollWidth+objContainer.clipWidth){
this.MoveArea(this.x-move,0)
if(loop) setTimeout(this.obj+".down("+move+")",speed)
}
}
function MoveAreaUp(move){
if(this.x<0){
this.MoveArea(this.x-move,0)
if(loop) setTimeout(this.obj+".up("+move+")",speed)
}
}

function PerformScroll(speed){
if(initialised){
loop=true;
if(speed>0) objScroller.down(speed)
else objScroller.up(speed)
}
}

function CeaseScroll(){
loop=false
if(timer) clearTimeout(timer)
}
var initialised;
function InitialiseScrollableArea(){
objContainer=new ConstructObject('roll')
objScroller=new ConstructObject('rollList','roll')
objScroller.MoveArea(0,0)
objContainer.css.visibility='visible'
initialised=true;
}

//折叠树
document.observe("dom:loaded", fold);
function fold() {
	$$("ul.tree .switch").each(function(element) {
		element.onclick = function() {
			Effect.toggle(element.next("ul"), "blind", {duration: 0.2});
			element.up("li").toggleClassName("folded");
		}
	});
}

//打开小窗口 可多个
function ga(o,e){
if (document.getElementById){a=o.id.substring(1); p = "";r = "";g = e.target;if (g) { t = g.id;f = g.parentNode;if (f) {p = f.id;h = f.parentNode;if (h) r = h.id;}} else{h = e.srcElement;f = h.parentNode;if (f) p = f.id;t = h.id;}if (t==a || p==a || r==a) return true;window.open(document.getElementById(a).href,'_blank')}}
function h(obj,url){
obj.style.behavior='url(#default#homepage)';
obj.setHomePage(url);
}
function ow(obj) {
    URL=obj.href;
    width=470;
    height=470;
    var left = ( screen.width - width ) / 2;
    var top = ( screen.height - height ) / 2;
    window.open(URL,'','width=470,height=470,top='+top+',left='+left+',scrollbars=1,resizable=0');
    return false;
}

//搜索框
function storeSearchCheck()
{
               if (document.getElementById("storeSearchText").value=="")
                {
                        window.alert("请输入搜索关键词")
                        return false;
                }
}
function specialSearchCheck()
{
               if (document.getElementById("specialSearchText").value=="")
                {
                        window.alert("请输入搜索关键词")
                        return false;
                }
               if (document.getElementById("specialSearchText").value=="在此输入搜索关键词_")
                {
                        window.alert("请输入搜索关键词")
                        return false;
                }
}
function seniorSearchCheck()
{
               if (document.getElementById("seniorSearchText").value=="")
                {
                        window.alert("请输入搜索关键词")
                        return false;
                }
}