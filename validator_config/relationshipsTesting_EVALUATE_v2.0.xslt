<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:include href="reporting_templates.xslt"/>
	<xsl:include href="referencing_templates.xslt"/>
	<xsl:template match="/">
		<table border="0">

<!-- EVALUATE ProcedureRequest/reasonReference v2.0 -->
        <xsl:for-each select="//entry/resource/ProcedureRequest/reasonReference/reference">
			<xsl:variable name="location" select="concat('//entry[',count(../../../../preceding-sibling::*)-2,']resource/ProcedureRequest/reasonReference/reference/@value')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../../entry/resource/ReferralRequest/reasonReference/reference">
							<xsl:choose>
								<xsl:when test="($refValue=@value) and $variable1 != 'Y'">
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
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/reasonReference at ',$location,' contains ',@value,' which should relate to ReferralRequest/reasonReference ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/reasonReference at ',$location,' contains ',@value,' which should relate to ReferralRequest/reasonReference ')"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:for-each>

<!-- EVALUATE ProcedureRequest/supportingInfo v2.0 -->
        <xsl:for-each select="//entry/resource/ProcedureRequest/supportingInfo/reference">
			<xsl:variable name="location" select="concat('//entry[',count(../../../../preceding-sibling::*)-2,']resource/ProcedureRequest/supportingInfo/reference/@value')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../../entry/resource/ReferralRequest/supportingInfo/reference">
							<xsl:choose>
								<xsl:when test="($refValue=@value) and $variable1 != 'Y'">
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
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/supportingInfo at ',$location,' contains ',@value,' which should relate to ReferralRequest/supportingInfo ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/supportingInfo at ',$location,' contains ',@value,' which should relate to ReferralRequest/supportingInfo ')"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:for-each>


<!-- EVALUATE ProcedureRequest/relevantHistory v2.0 -->
        <xsl:for-each select="//entry/resource/ProcedureRequest/relevantHistory/reference">
			<xsl:variable name="location" select="concat('//entry[',count(../../../../preceding-sibling::*)-2,']resource/ProcedureRequest/relevantHistory/reference/@value')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../../entry/resource/ReferralRequest/relevantHistory/reference">
							<xsl:choose>
								<xsl:when test="($refValue=@value) and $variable1 != 'Y'">
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
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/relevantHistory at ',$location,' contains ',@value,' which should relate to ReferralRequest/relevantHistory ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/relevantHistory at ',$location,' contains ',@value,' which should relate to ReferralRequest/relevantHistory ')"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:for-each>
        
<!-- EVALUATE ProcedureRequest/status v2.0 -->
        <xsl:for-each select="//entry/resource/ProcedureRequest/status">
			<xsl:variable name="location" select="concat('//entry[',count(../../../preceding-sibling::*)-2,']resource/ProcedureRequest/status')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../entry/resource/ReferralRequest/status">
							<xsl:choose>
								<xsl:when test="($refValue=@value) and $variable1 != 'Y'">
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
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/status at ',$location,' contains ',@value,' which should relate to ReferralRequest/status ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/status at ',$location,' contains ',@value,' which should relate to ReferralRequest/status ')"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
        </xsl:for-each>
        

<!-- EVALUATE ProcedureRequest/intent v2.0 -->
        <xsl:for-each select="//entry/resource/ProcedureRequest/intent">
			<xsl:variable name="location" select="concat('//entry[',count(../../../preceding-sibling::*)-2,']resource/ProcedureRequest/intent')"/>
			<xsl:variable name="refValue" select="@value"/>
				<xsl:variable name="variable1" select="'N'"/>
				<xsl:variable name="variable2">
					<xsl:for-each select="../../../../entry/resource/ReferralRequest/intent">
							<xsl:choose>
								<xsl:when test="($refValue=@value) and $variable1 != 'Y'">
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
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/intent at ',$location,' contains ',@value,' which should relate to ReferralRequest/intent ')"/>
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="reportResult">
								<xsl:with-param name="result" select="'Failed'"/>
								<xsl:with-param name="reportText" select="concat('ProcedureRequest/intent at ',$location,' contains ',@value,' which should relate to ReferralRequest/intent ')"/>
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
