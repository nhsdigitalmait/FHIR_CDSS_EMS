<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xpath-default-namespace="http://hl7.org/fhir">
	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:include href="reporting_templates.xslt"/>
	<xsl:include href="referencing_templates.xslt"/>
	<xsl:template match="/">
		<table border="0">
			<!-- Checks the Cardinality of the Parameters entries. Ignores any that are not present-->
			<!-- Load reference file-->
			<xsl:variable name="supportedevents" select="document('./SupportedEvents.xml')"/>
			<!-- Get the counts of elements with business rules -->
	
            <xsl:for-each select="//entry/resource/*[name()='Parameters']">
	            
			            <xsl:variable name="requestId_count" select="count(./parameter/name[@value='requestId'])"/>
			            <xsl:variable name="evaluateAtDateTime_count" select="count(./parameter/name[@value='evaluateAtDateTime'])"/>
			            <xsl:variable name="inputData_count" select="count(./parameter/name[@value='inputData'])"/>
			            <xsl:variable name="patient_count" select="count(./parameter/name[@value='patient'])"/>
			            <xsl:variable name="encounter_count" select="count(./parameter/name[@value='encounter'])"/>
			            <xsl:variable name="initiatingOrganization_count" select="count(./parameter/name[@value='initiatingOrganization'])"/>
			            <xsl:variable name="initiatingPerson_count" select="count(./parameter/name[@value='initiatingPerson'])"/>
			            <xsl:variable name="userType_count" select="count(./parameter/name[@value='userType'])"/>
			            <xsl:variable name="userLanguage_count" select="count(./parameter/name[@value='userLanguage'])"/>
			            <xsl:variable name="userTaskContext_count" select="count(./parameter/name[@value='userTaskContext'])"/>
			            <xsl:variable name="receivingOrganization_count" select="count(./parameter/name[@value='receivingOrganization'])"/>
			            <xsl:variable name="receivingPerson_count" select="count(./parameter/name[@value='receivingPerson'])"/>
			            <xsl:variable name="recipientType_count" select="count(./parameter/name[@value='recipientType'])"/>
			            <xsl:variable name="recipientLanguage_count" select="count(./parameter/name[@value='recipientLanguage'])"/>
			            <xsl:variable name="setting_count" select="count(./parameter/name[@value='setting'])"/>
			            <xsl:variable name="settingContext_count" select="count(./parameter/name[@value='settingContext'])"/>
	            

				            <tr>
					            <td style="color:#000000">
						            <xsl:text>Parameters Resouce Index: //entry[</xsl:text>
						            <xsl:value-of select="count(../../preceding-sibling::entry)"/>
						            <xsl:text>]/resource/Parameters</xsl:text>
					            </td>
				            </tr>


            <!--Check the count of each component against the cardinality values in the reference file-->
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$requestId_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'requestId'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$evaluateAtDateTime_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'evaluateAtDateTime'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$inputData_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'inputData'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$patient_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'patient'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$encounter_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'encounter'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$initiatingOrganization_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'initiatingOrganization'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$initiatingPerson_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'initiatingPerson'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$userType_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'userType'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$userLanguage_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'userLanguage'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$userTaskContext_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'userTaskContext'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$receivingOrganization_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'receivingOrganization'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$receivingPerson_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'receivingPerson'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$recipientType_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'recipientType'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$recipientLanguage_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'recipientLanguage'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$setting_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'setting'"/>
			            </xsl:call-template>
			            <xsl:call-template name="cardinality_check">
				            <xsl:with-param name="count" select="$settingContext_count"/>
				            <xsl:with-param name="ref_xpath" select="$supportedevents//CDS/parameters/elements/element"/>
				            <xsl:with-param name="ref_attribute" select="'settingContext'"/>
			            </xsl:call-template>			            
            </xsl:for-each>
			
		</table>
	</xsl:template>
</xsl:stylesheet>
