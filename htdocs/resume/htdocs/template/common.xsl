<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="utf-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/" mode="default">
	<xsl:param name="title" />
	<xsl:param name="head" />
	<xsl:param name="content" select="/*" />

	<html>
		<head>
			<link type="text/css" rel="stylesheet" href="../template/common.css" />
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

<xsl:template match="date" mode="default">
	<xsl:value-of select="year" />年<xsl:value-of select="month" />月
</xsl:template>

<xsl:template match="period" mode="default">
	<xsl:choose>
		<xsl:when test="from/date = to/date">
			<xsl:apply-templates select="from/date" mode="default" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates select="from/date" mode="default" />至<xsl:apply-templates select="to/date" mode="default" />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>