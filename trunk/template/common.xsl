<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
>
<xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

	<xsl:include href="../lib/oxsl/function.xsl" />
	<xsl:include href="../lib/oxsl/exslt/date/difference.xsl" />
	<xsl:include href="../lib/oxsl/exslt/date/year.xsl" />
	<xsl:include href="../lib/oxsl/exslt/date/month-in-year.xsl" />

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

	<xsl:template match="date | from | to" mode="default">
		<xsl:call-template name="date:year">
			<xsl:with-param name="date-time" select="." />
		</xsl:call-template>
		<xsl:text>年</xsl:text>
		<xsl:call-template name="date:month-in-year">
			<xsl:with-param name="date-time" select="." />
		</xsl:call-template>
		<xsl:text>月</xsl:text>
	</xsl:template>

	<xsl:template match="period" mode="default">
		<xsl:choose>
			<xsl:when test="from = to">
				<xsl:apply-templates select="from" mode="default" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="from" mode="default" /> 至 <xsl:apply-templates select="to" mode="default" />
				<xsl:variable name="period">
					<xsl:call-template name="date:difference">
						<xsl:with-param name="start" select="from" />
						<xsl:with-param name="end" select="to" />
					</xsl:call-template>
				</xsl:variable>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring-after(substring-before($period, 'M'), 'P')" />
				<xsl:text>个月</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>