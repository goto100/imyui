</div>
<!-- PageFooterBegin -->
<div id="footer">
	<div id="sitelink">
		<h2>网站链接</h2>
		<ul>
			<li class="setindex"><a onclick="javascript:this.style.behavior='url(#default#homepage)';this.setHomePage('<%=SiteURL%>');return false;" 
		href="#" title="设为首页">设为首页</a></li>
			<li class="addfavorite"><a 
		href="javascript:window.external.AddFavorite('<%=SiteURL%>', '<%=SiteCName%>')" title="收藏本站">收藏本站</a></li>
			<li class="contactus"><a href="mailto:<%=SiteMail%>" title="联系我们">联系我们</a></li>
			<!-- <li class="about"><a href="/<%=SiteFolder%>about.asp" title="关于我们">关于我们</a></li> -->
			<li class="sitemap"><a href="/<%=SiteFolder%>sitemap.asp" title="网站地图">网站地图</a></li>
			<li class="copyright"><a href="/<%=SiteFolder%>copyright.asp" title="版权声明">版权声明</a></li>
			<li class="link"><a href="/<%=SiteFolder%>link.asp" title="交换链接">交换链接</a></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
		</ul>
	</div>
	<p id="copy">版权所有 <a href="<%=SiteURL%>" class="sitename"><%=SiteName%></a> <span class="siteversion"><%=SiteVersion%></span> <span class="sitecopyyear"><%=SiteCopyYear%></span></p>
	<p id="rec">津ICP备05003059号</p>
	<p id="power">Power by <span class="programname">PFW</span> <span class="programversion">v.1 beta</span><script language="javascript" type="text/javascript" src="http://a.s23.51.la//j/41.js"></script>
<noscript><a href="http://www.51.la/?s=23&amp;id=41" target="_blank"><img alt="51.la Free Site Stats" src="http://a.s23.51.la//s.asp?siteid=41&amp;t=img" border="0" /></a></noscript></p>
	<p id="serverinfo">Processed in <span class="runtime"><%=FormatNumber(Timer()-StartTime, 6, -1)%></span> second(s) <span class="rsnumber"><%=RSNumber%></span> DB Queries</p>
</div>
<!-- PageFooterEnd -->
<!-- PageEnd -->
</div>
</div>
</div>
</body>
</html>
<%
If IsObject(NavRS) Then
	CloseRS NavRS
End If
If IsObject(CateRS) Then
	CloseRS CateRS
End If
If IsObject(CateListRS) Then
	CloseRS CateListRS
End If

Set Plugin=Nothing
Set Cate=Nothing
Set CateRoot=Nothing
%>