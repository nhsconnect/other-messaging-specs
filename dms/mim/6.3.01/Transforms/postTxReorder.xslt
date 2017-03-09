<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:h="urn:hl7-org:v3" exclude-result-prefixes="h " xmlns:npfitct="template:NPFIT:content" xmlns:npfitmt="message:NPFIT:type">
<!-- Used to ensure that top level associations in round tripped examples are in correct 
		TJI 3.08.2007 -->
		
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="h:ClinicalDocument">
	<ClinicalDocument xmlns="urn:hl7-org:v3">	
		<xsl:copy-of select="@*" />
		<xsl:for-each select="*[not(@typeCode)]">
		<xsl:sort select="name(.)"/>
		<xsl:copy-of select="."/>
	</xsl:for-each>
	<xsl:for-each select="*[@typeCode]">
		<xsl:sort select="name(.)"/>
		<xsl:copy-of select="."/>
	</xsl:for-each>
	</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
