<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:include href="reporting_templates.xslt"/>
	<xsl:include href="referencing_templates.xslt"/>
	<xsl:template match="/">
		<table border="0">
<!-- EVALUATE - Careplan supporting info v.1.1 and v2.0 -->
        <xsl:for-each select="//entry/resource/*[name()='CarePlan']">
            <tr>
	            <td style="color:#000000">
		            <xsl:text>values: //entry[</xsl:text>
		            <xsl:value-of select="count(../../preceding-sibling::*)-2"/>
		            <xsl:text>]/resource/CarePlan/supportingInfo/reference</xsl:text>
	            </td>
            </tr>
			<!-- Loop through the supporting info -->
            <xsl:for-each select="supportingInfo/reference">
                <xsl:choose>
        			<!-- Assume all refs which start with # are Observations -->
                    <xsl:when test = "starts-with(@value,'#')">
            			<xsl:variable name="result1">
	                        <xsl:call-template name="isThereAReference">
		                        <xsl:with-param name="path" select="../../contained/Observation/id"/>
		                        <xsl:with-param name="refValue" select="substring(@value,2)"/>
	                        </xsl:call-template>
            			</xsl:variable>
                        <xsl:call-template name="reportResult">
	                        <xsl:with-param name="result" select="$result1"/>
	                        <xsl:with-param name="reportText" select="concat('Observation reference test for ',@value)"/>
                        </xsl:call-template>
                    </xsl:when>
        			<!-- Assume all refs which do NOT start with # are Questionnaire Responses -->
                    <xsl:otherwise>
            			<xsl:variable name="result2">
	                        <xsl:call-template name="isThereARelativeReference">
		                        <xsl:with-param name="path" select="/*/entry/resource/QuestionnaireResponse"/>
		                        <xsl:with-param name="refValue" select="@value"/>
	                        </xsl:call-template>
            			</xsl:variable>
                        <xsl:call-template name="reportResult">
	                        <xsl:with-param name="result" select="$result2"/>
	                        <xsl:with-param name="reportText" select="concat('QuestionnaireResponse reference test for ',@value)"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>

<!-- EVALUATE - Condition	evidence.detail v.1.1 and v2.0 -->
        <xsl:for-each select="//entry/resource/*[name()='Condition']">
            <tr>
	            <td style="color:#000000">
		            <xsl:text>values: //entry[</xsl:text>
		            <xsl:value-of select="count(../../preceding-sibling::*)-2"/>
		            <xsl:text>]/resource/Condition/evidence/detail/reference</xsl:text>
	            </td>
            </tr>
			<!-- Loop through the supporting info -->
            <xsl:for-each select="evidence/detail/reference">
                <xsl:choose>
        			<!-- Assume all refs which start with # are Observations -->
                    <xsl:when test = "starts-with(@value,'#')">
            			<xsl:variable name="result1">
	                        <xsl:call-template name="isThereAReference">
		                        <xsl:with-param name="path" select="../../../contained/Observation/id"/>
		                        <xsl:with-param name="refValue" select="substring(@value,2)"/>
	                        </xsl:call-template>
            			</xsl:variable>
                        <xsl:call-template name="reportResult">
	                        <xsl:with-param name="result" select="$result1"/>
	                        <xsl:with-param name="reportText" select="concat('Observation reference test for ',@value)"/>
                        </xsl:call-template>
                    </xsl:when>
        			<!-- Assume all refs which do NOT start with # are Questionnaire Responses -->
                    <xsl:otherwise>
            			<xsl:variable name="result2">
	                        <xsl:call-template name="isThereARelativeReference">
		                        <xsl:with-param name="path" select="/*/entry/resource/QuestionnaireResponse"/>
		                        <xsl:with-param name="refValue" select="@value"/>
	                        </xsl:call-template>
            			</xsl:variable>
                        <xsl:call-template name="reportResult">
	                        <xsl:with-param name="result" select="$result2"/>
	                        <xsl:with-param name="reportText" select="concat('QuestionnaireResponse reference test for ',@value)"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
       
<!-- EVALUATE - GuidanceResponse	module v.1.1 and v2.0 -->
        <xsl:for-each select="//entry/resource/GuidanceResponse/module/reference">
			<xsl:variable name="location" select="concat('//entry[',count(../../../../preceding-sibling::*)-2,']resource/GuidanceResponse/module/reference/@value')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../../entry/resource/ServiceDefinition/id">
							<xsl:choose>
								<xsl:when test="ends-with($refValue, @value) and $variable1 != 'Y'">
									<xsl:value-of select="'Y'" />
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$variable1" />
								</xsl:otherwise>
							</xsl:choose>
					</xsl:for-each>
				</xsl:variable>
					<xsl:choose>
						<xsl:when test = "contains($variable2,'Y')">
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Passed'"/>
								<xsl:with-param name="reportText" select="concat('module at ',$location,' contains ',@value,' which should relate to ServiceDefinition.id ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('module at ',$location,' contains ',@value,' which should relate to ServiceDefinition.id ')"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:for-each>
		</table>        
	</xsl:template>
	
	<xsl:template name="isThereAReference">
		<xsl:param name="path"/>
		<xsl:param name="refValue"/>
        <xsl:for-each select="$path">
            <xsl:if test = "@value=$refValue">
               <xsl:value-of select="'Passed'"/>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>

	<xsl:template name="isThereARelativeReference">
		<xsl:param name="path"/>
		<xsl:param name="refValue"/>
        <xsl:for-each select="$path">
            <xsl:if test = "ends-with(../../fullUrl/@value,$refValue)">
               <xsl:value-of select="'Passed'"/>
            </xsl:if>
        </xsl:for-each>
	</xsl:template>

	<xsl:template name="reportResult">
		<xsl:param name="result"/>
		<xsl:param name="reportText"/>
        <xsl:choose>
            <xsl:when test = "$result='Passed'">
                <tr>
                    <td style="color:#008000">
                        <xsl:value-of select="$reportText"/>
                        <xsl:text> PASSED</xsl:text>
                    </td>
                </tr>
            </xsl:when>
            <xsl:when test = "$result!='Passed'">
                <tr>
                    <td style="color:#900000">
                        <xsl:value-of select="$reportText"/>
                        <xsl:text> FAILED</xsl:text>
                    </td>
                </tr>
            </xsl:when>
        </xsl:choose>
	</xsl:template>

</xsl:stylesheet>
