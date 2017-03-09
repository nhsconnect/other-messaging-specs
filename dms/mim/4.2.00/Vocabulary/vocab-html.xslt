<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/02/xpath-functions" xmlns:xdt="http://www.w3.org/2005/02/xpath-datatypes">
	<xsl:output name="basic" method="xhtml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		
		<xsl:for-each select="//vocSet">
			<xsl:result-document href="..\..\work\Vocabulary\{./@name}.htm" format="basic">
				<html>
					<head>
						<title><xsl:value-of select="./@name"/></title>
						<style type="text/css" media="all">
							@import "vocabulary.css";
						</style>
					</head>
					<body>
						<h1>
							<span class="pretitle">Vocabulary for </span><xsl:value-of select="./@name"/>
						</h1>
						<h2>Description</h2>
						<xsl:for-each select="./@id">
						Assigned OID : <xsl:value-of select="."/>
						</xsl:for-each>
						<!-- documentation goes here -->
						<xsl:copy-of select="./*[not(leafTerm)]"/>
						<!-- version information -->
						<table class="version">
							<tbody>
								<tr>
									<td class="vocabheader">Version:</td>
									<td><xsl:value-of select="./@version"/></td>
								</tr>
								<tr>
									<td class="vocabheader">Date:</td>
									<td><xsl:value-of select="substring(./@date, 1, 4)"/>-<xsl:value-of select="substring(./@date, 5, 2)"/>-<xsl:value-of select="substring(./@date, 7, 2)"/></td>
								</tr>
							</tbody>						
						</table>
						<!-- now for the vocab table -->
						<h2>Values:</h2>
						<table>
							<thead class="vocabheader">
								<tr>
									<td>Code</td>
									<td>Description</td>
									<td>Note</td>
								</tr>
							</thead>
							<tbody>
								<xsl:for-each select="./vocContents/leafTerm">
									<tr>
										<td><xsl:value-of select="./@Code"/></td>
										<td><xsl:value-of select="./@printName"/></td>
										<td><xsl:copy-of select="child::node()"/></td>
									</tr>
								</xsl:for-each>
							</tbody>
						</table>
						
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
