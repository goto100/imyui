<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="index.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../template/common.xsl" />

<xsl:template match="/">
	<xsl:apply-templates select="." mode="default">
		<xsl:with-param name="title"><xsl:apply-templates select="resume/header/name" mode="person" />的简历</xsl:with-param>
	</xsl:apply-templates>
</xsl:template>

<xsl:template match="/resume">
	<xsl:apply-templates select="header" />
	<h2>求职意向</h2>
	<xsl:apply-templates select="/resume/objective" />
	<h2>专业资格与技能</h2>
	<xsl:apply-templates select="skillSet" />
	<h2>工作经验</h2>
	<xsl:apply-templates select="history" />
	<h2>项目经验</h2>
	<p class="note">项目详情请访问 <a href="../works/index.xml">http://www.imyui.cn/works/</a>。</p>
	<ul>
		<xsl:for-each select="document('../works/index.xml')/works/item">
			<li>
				<xsl:choose>
					<xsl:when test="url"><a href="{url}"><strong><xsl:value-of select="name" /></strong></a></xsl:when>
					<xsl:otherwise><strong><xsl:value-of select="name" /></strong></xsl:otherwise>
				</xsl:choose>
				<p class="period"><xsl:apply-templates select="period" mode="default" /></p>
			</li>
		</xsl:for-each>
	</ul>
</xsl:template>

<xsl:template match="/resume/header">
<div id="information">
<h2>个人信息</h2>
<img class="photo" src="{photo/@src}" alt="照片" width="100px" height="133px" />
<ul>
	<li>姓名：<xsl:apply-templates select="name" mode="person" /></li>
	<li>性别：<xsl:apply-templates select="gender" /></li>
	<li>出生年月：<xsl:apply-templates select="birthday" /></li>
	<xsl:apply-templates select="../academics" />
	<li>联系电话：<xsl:apply-templates select="contact/phone" /></li>
	<li>电子邮件：<xsl:apply-templates select="contact/email" /></li>
	<li>个人主页：<a href="{contact/url}"><xsl:apply-templates select="contact/url" /></a></li>
</ul>
</div>
</xsl:template>

<xsl:template match="/resume/objective">
	<xsl:copy-of select="*" />
</xsl:template>

<xsl:template match="/resume/academics">
	<li>毕业学校：<xsl:value-of select="degrees/degree/institution" /></li>
	<li>专业：<xsl:value-of select="degrees/degree/major" /></li>
	<li>学历：<xsl:value-of select="degrees/degree/level" /></li>
	<li>毕业时间：<xsl:apply-templates select="degrees/degree/date" mode="default" /></li>
</xsl:template>

<xsl:template match="/resume/skillSet">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="/resume/skillSet/skills">
	<h3><xsl:value-of select="title" /></h3>
	<ul>
		<xsl:apply-templates select="item" />
	</ul>
</xsl:template>

<xsl:template match="/resume/skillSet/skills/item">
	<li><xsl:value-of select="." /></li>
</xsl:template>

<xsl:template match="/resume/history">
	<xsl:apply-templates />
</xsl:template>

<xsl:template match="/resume/history/job">
	<h3><xsl:value-of select="employer" /><xsl:text> </xsl:text><xsl:value-of select="jobtitle" /></h3>
	<p class="period"><xsl:apply-templates select="period" mode="default" /></p>
	<xsl:copy-of select="description" />
</xsl:template>

</xsl:stylesheet>