<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:include href="reporting_templates.xslt"/>
	<xsl:template match="/">
		<table border="0">
			<xsl:call-template name="title">
				<xsl:with-param name="titleName" select="'ReferralRequest status Check'"/>
			</xsl:call-template>
			<xsl:variable name="supportedevents" select="document('./CDS_API_2.0.xml')"/>
			<xsl:variable name="Resource_Name" select="//ReferralRequest/status"/>
			<xsl:variable name="allowed" select="concat(',',$supportedevents//ReferralRequest/elements/element[@name='status']/@allowed,',')"/>
			<xsl:for-each select="$Resource_Name">
				<xsl:call-template name="allowed_value_check">
					<xsl:with-param name="value" select="./@value"/>
					<xsl:with-param name="value_list" select="$allowed"/>
				</xsl:call-template>
			</xsl:for-each>

			<xsl:call-template name="title">
				<xsl:with-param name="titleName" select="'Procedure status Check'"/>
			</xsl:call-template>
			<xsl:variable name="supportedevents" select="document('./CDS_API_2.0.xml')"/>
			<xsl:variable name="Resource_Name" select="//Procedure/status"/>
			<xsl:variable name="allowed" select="concat(',',$supportedevents//Procedure/elements/element[@name='status']/@allowed,',')"/>
			<xsl:for-each select="$Resource_Name">
				<xsl:call-template name="allowed_value_check">
					<xsl:with-param name="value" select="./@value"/>
					<xsl:with-param name="value_list" select="$allowed"/>
				</xsl:call-template>
			</xsl:for-each>


		</table>
	</xsl:template>
	<xsl:template name="title">
		<xsl:param name="titleName"/>
				<tr>
					<td style="color:#000000">
                		<xsl:value-of select="$titleName"/>
					</td>
				</tr>
	</xsl:template>
	<xsl:template name="allowed_value_check">
		<xsl:param name="value"/>
		<xsl:param name="value_list"/>
		<xsl:variable name="value_item" select="substring-before($value_list,',')"/>
		<xsl:choose>
			<xsl:when test="matches($value_list, concat(',',$value,',')) ">
				<xsl:variable name="found" select="'T'"/>
				<tr>
					<td style="color:#008000">
						<xsl:text>Value found: </xsl:text>
						<xsl:value-of select="$value"/>
						<xsl:text>, Valid: </xsl:text>
						<xsl:value-of select="matches($value_list, concat(',',$value,','))"/>
					</td>
				</tr>
			</xsl:when>
			<xsl:when test="not(matches($value_list, concat(',',$value,',')))">
				<tr>
					<td style="color:#900000">
						<xsl:text>Value found: </xsl:text>
						<xsl:value-of select="$value"/>
						<xsl:text> </xsl:text>
						<xsl:text>, Valid: </xsl:text>
						<xsl:value-of select="matches($value_list, concat(',',$value,','))"/>
					</td>
				</tr>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
