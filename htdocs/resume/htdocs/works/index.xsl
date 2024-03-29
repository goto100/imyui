<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../template/common.xsl" />

<xsl:template match="/">
	<xsl:apply-templates select="." mode="default">
		<xsl:with-param name="title">作品</xsl:with-param>
		<xsl:with-param name="head">
			<link rel="stylesheet" type="text/css" href="../template/lightwindow/css/lightwindow.css" />
			<script type="text/javascript" src="../template/lightwindow/javascript/prototype.js"></script>
			<script type="text/javascript" src="../template/lightwindow/javascript/effects.js"></script>
			<script type="text/javascript" src="../template/lightwindow/javascript/lightwindow.js"></script>
		</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="/works">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="/works/item">
	<h2><xsl:value-of select="name" /><strong class="period"><xsl:apply-templates select="period" mode="default" /></strong></h2>
	<div class="thumb">
		<xsl:if test="picture">
			<a href="{url}"><img src="{picture/@src}" class="title" width="128" height="128" /></a>
		</xsl:if>
		<p class="caption">
			<a href="{url}">访问</a><xsl:text> </xsl:text>
			<xsl:if test="screen-shot">
				<xsl:for-each select="screen-shot">
					<a href="{@src}" class="lightwindow" rel="Works[{../name}]"><xsl:if test="position() = 1">截图</xsl:if><xsl:number /></a><xsl:text> </xsl:text>
				</xsl:for-each>
			</xsl:if>
		</p>
	</div>

	<xsl:copy-of select="description" />
</xsl:template>

</xsl:stylesheet>