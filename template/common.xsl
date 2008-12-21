<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"

	xmlns:ui="http://imyui.cn/xslui"
>

	<xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

	<xsl:include href="../lib/xslui/xslui.xsl" />
	<xsl:include href="../lib/xslui/exslt/date/difference.xsl" />
	<xsl:include href="../lib/xslui/exslt/date/year.xsl" />
	<xsl:include href="../lib/xslui/exslt/date/month-in-year.xsl" />
	<xsl:include href="../lib/xslui/widget/format-duration.xsl" />

	<xsl:template match="/" mode="default">
		<xsl:param name="title" />
		<xsl:param name="head" />
		<xsl:param name="content" select="/*" />

		<html>
			<head>
				<link type="text/css" rel="stylesheet" href="../template/common.css" />
				<link rel="icon" href="/favicon.ico" type="image/x-icon" />
				<xsl:if test="$head">
					<xsl:copy-of select="$head" />
				</xsl:if>
				<title><xsl:value-of select="$title" /></title>
			</head>

			<body>
				<div id="header">
					<ul id="nav">
						<li><a href="../blog">Blog</a></li>
						<xsl:choose>
							<xsl:when test="name(*) = 'resume'"><li class="active">简历</li></xsl:when>
							<xsl:otherwise>
								<li><a href="../resume/index.xml">简历</a></li>
							</xsl:otherwise>
						</xsl:choose>			
						<xsl:choose>
							<xsl:when test="name(*) = 'works'"><li class="active">作品</li></xsl:when>
							<xsl:otherwise>
								<li><a href="../works/index.xml">作品</a></li>
							</xsl:otherwise>
						</xsl:choose>
					</ul>
				</div>
				<div id="container">
					<div id="content">
	
					<xsl:apply-templates select="$content" />
	
					</div>
				</div>
				<div id="footer">

				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="name" mode="person">
		<xsl:value-of select="firstname" /><xsl:value-of select="surname" />
	</xsl:template>

	<xsl:template match="period" mode="default">
		<xsl:choose>
			<xsl:when test="from = to">
				<xsl:apply-templates select="from" mode="default" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="ui:label">
					<xsl:with-param name="name">format-date</xsl:with-param>
					<xsl:with-param name="param">
						<date year="" month="" day="" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:text> - </xsl:text>
				<xsl:call-template name="ui:label">
					<xsl:with-param name="name">format-date</xsl:with-param>
					<xsl:with-param name="param">
						<date year="" month="" day="" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="ui:format-duration">
					<xsl:with-param name="start" select="from" />
					<xsl:with-param name="end" select="(to | document('../works/now.asp')/now)[1]" />
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>