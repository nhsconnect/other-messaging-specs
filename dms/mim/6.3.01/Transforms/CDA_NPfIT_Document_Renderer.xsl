<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:n1="urn:hl7-org:v3" xmlns:npfitlc="NPFIT:HL7:Localisation" xmlns:n2="urn:hl7-org:v3/meta/voc" xmlns:voc="urn:hl7-org:v3/voc" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="html" indent="yes" version="4.01" encoding="ISO-8859-1" doctype-public="-//W3C//DTD HTML 4.01//EN"/>
	<!-- CDA document -->
	<xsl:variable name="title">
		<xsl:choose>
			<xsl:when test="/n1:ClinicalDocument/n1:title">
				<xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
			</xsl:when>
			<xsl:otherwise>Clinical Document</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:apply-templates select="n1:ClinicalDocument"/>
	</xsl:template>
	<xsl:template match="n1:ClinicalDocument">
		<html>
			<head>
				<!-- <meta name='Generator' content='&CDA-Stylesheet;'/> -->
				<xsl:comment> Do NOT edit this HTML directly, it was generated via an XSLT transformation from the original release 2 CDA
          Document. </xsl:comment>
				<title>
					<xsl:value-of select="$title"/>
				</title>
				<style type="text/css" >
					<xsl:comment>
						body { color: #000000; font-size: 10pt; line-height: normal; font-family: Verdana, Arial, sans-serif; margin: 10px; }
						a { color: #0099ff; text-decoration: none }
						.input { color: #003366; font-size: 10pt; font-family: Verdana, Arial, sans-serif; background-color: #ffffff; border: solid 1px }
						div.titlebar { background-color: #eeeeff; border: 1px solid #000000; padding: 3px; margin-bottom: 20px;}
						div.doctitle { font-size: 14pt; font-weight: bold; margin-bottom: 10px;}
						div.header { font-size: 8pt; margin-bottom: 30px; border: 1px solid #000000; background-color: #ffffee;}
						div.footer { font-size: 8pt; margin-top: 30px; border: 1px solid #000000; background-color: #ffffee;}
						p {margin-top: 2px; margin-bottom: 6px;}
						h1 { font-size: 14pt; font-weight: bold; color: #000000; margin-top: 20px; margin-bottom: 10px; border-bottom: 1px solid #CCCCCC;}
						h2 { font-size: 12pt; font-weight: bold; color: #000000; margin-top: 20px; margin-bottom: 6px; }
						h3 { font-size: 12pt; font-weight: normal; color: #000000; margin-top: 15px; margin-bottom: 6px; }
						h4 { font-size: 10pt; font-weight: bold; text-decoration: underline; color: #000000; margin-top: 6px; margin-bottom: 6px; }
						h5 { font-size: 10pt; font-weight: normal; text-decoration: underline;  color: #000000; margin-top: 4px; margin-bottom: 4px; }
						h6 { font-size: 10pt; font-weight: normal; color: #000000; margin-top: 2px; margin-bottom: 2px; }
						table { border: 1px solid #000000; }
						th {padding: 3px; color: #000000; background-color: #dddddd; text-align: left;}
						td {padding: 3px; background-color: #eeeeee;}
						table.titlebar { border: 0px; background-color: #eeeeff; }
						td.titlebar {color: #000000; background-color: #eeeeff;}
						th.titlebar {color: #000000; background-color: #eeeeff; font-weight: bold; text-align: left;}
						table.header { border: 0px; background-color: #ffffee; }
						td.header {color: #000000; background-color: #ffffee;}
						th.header {color: #000000; background-color: #ffffee; font-weight: bold; text-align: left;}
					</xsl:comment>
				</style>
			</head>
			<xsl:comment>Derived from HL7 Finland R2 Tyylitiedosto: Tyyli_R2_B3_01.xslt</xsl:comment>
			<xsl:comment>Updated by Calvin E. Beebe, Mayo Clinic - Rochester Mn. </xsl:comment>
			<xsl:comment>Updated by Keith W. Boone, Dictaphone - Burlington, MA </xsl:comment>
			<xsl:comment>Updated by Kai U. Heitmann, Heitmann Consulting &amp; Service, NL for VHitG, Germany </xsl:comment>
			<xsl:comment>Updated by Rene Spronk, translate back to english-language labels</xsl:comment>
 		     <xsl:comment>Updated by Dick Donker, Philips Medical Systems include linkHtml</xsl:comment>
		     <xsl:comment>Updated by Tim Pilkington - NHS CFH</xsl:comment>

			<body>
              	
				<xsl:call-template name="header"/>

   				<xsl:call-template name="titlebar"/>
				
				<xsl:apply-templates select="n1:component/n1:structuredBody|n1:component/n1:nonXMLBody"/>

				<xsl:call-template name="footer"/>
			</body>
		</html>
	</xsl:template>


	<!-- Get a Name  -->
	<xsl:template name="getName">
		<xsl:param name="name"/>
		<xsl:choose>
			<xsl:when test="$name/n1:family">
				<xsl:if test="$name/n1:prefix">
					<xsl:value-of select="$name/n1:prefix"/>
    				<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:value-of select="$name/n1:given"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$name/n1:family"/>
				<xsl:if test="$name/n1:suffix">
    				<xsl:text> </xsl:text>
					<xsl:value-of select="$name/n1:suffix"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$name"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!--  Format Date 
    outputs a date in Month Day, Year form
    -->
	<xsl:template name="formatDate">
		<xsl:param name="date"/>
		<xsl:variable name="month" select="substring ($date, 5, 2)"/>

		<xsl:value-of select="substring ($date, 7, 2)"/>
		<xsl:text>-</xsl:text>
		<xsl:choose>
			<xsl:when test="$month='01'">
				<xsl:text>Jan</xsl:text>
			</xsl:when>
			<xsl:when test="$month='02'">
				<xsl:text>Feb</xsl:text>
			</xsl:when>
			<xsl:when test="$month='03'">
				<xsl:text>Mar</xsl:text>
			</xsl:when>
			<xsl:when test="$month='04'">
				<xsl:text>Apr </xsl:text>
			</xsl:when>
			<xsl:when test="$month='05'">
				<xsl:text>May</xsl:text>
			</xsl:when>
			<xsl:when test="$month='06'">
				<xsl:text>Jun</xsl:text>
			</xsl:when>
			<xsl:when test="$month='07'">
				<xsl:text>Jul</xsl:text>
			</xsl:when>
			<xsl:when test="$month='08'">
				<xsl:text>Aug</xsl:text>
			</xsl:when>
			<xsl:when test="$month='09'">
				<xsl:text>Sep</xsl:text>
			</xsl:when>
			<xsl:when test="$month='10'">
				<xsl:text>Oct</xsl:text>
			</xsl:when>
			<xsl:when test="$month='11'">
				<xsl:text>Nov</xsl:text>
			</xsl:when>
			<xsl:when test="$month='12'">
				<xsl:text>Dec</xsl:text>
			</xsl:when>
		</xsl:choose>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="substring ($date, 1, 4)"/>
		<xsl:if test="string-length($date)>8">
    		<xsl:text>, </xsl:text>
    		<xsl:value-of select="substring ($date, 9, 2)"/>
    		<xsl:text>:</xsl:text>
    		<xsl:value-of select="substring ($date, 11, 2)"/>
    	</xsl:if>
	</xsl:template>


	<xsl:template match="n1:component/n1:nonXMLBody">
		<xsl:choose>
			<!-- if there is a reference, use that in an IFRAME -->
			<xsl:when test="n1:text/n1:reference">
				<IFRAME name="nonXMLBody" id="nonXMLBody" WIDTH="100%" HEIGHT="66%" src="{n1:text/n1:reference/@value}"/>
			</xsl:when>
			<xsl:when test="n1:text/@mediaType='text/plain'">
				<pre>
					<xsl:value-of select="n1:text/text()"/>
				</pre>
			</xsl:when>
			<xsl:otherwise>
				<CENTER>Cannot display the text</CENTER>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- StructuredBody -->
	<xsl:template match="n1:component/n1:structuredBody">
		<xsl:apply-templates select="n1:component/n1:section"/>
	</xsl:template>


	<!-- Component/Section -->
	<xsl:template match="n1:component/n1:section">
        <xsl:if test="n1:title != ''">
    		<xsl:apply-templates select="n1:title"/>
		</xsl:if>
		<xsl:apply-templates select="n1:text"/>
		<xsl:apply-templates select="n1:component/n1:section"/>
	</xsl:template>

	<!--   Title  -->
	<xsl:template match="n1:title">
		<xsl:variable name="v_current" select="."/>

		<xsl:choose>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'Section1') ">
				<h1>
					<xsl:value-of select="$v_current"/>
				</h1>
			</xsl:when>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'section2') ">
				<h2>
					<xsl:value-of select="$v_current"/>
				</h2>
			</xsl:when>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'section3') ">
				<h3>
					<xsl:value-of select="$v_current"/>
				</h3>
			</xsl:when>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'section4') ">
				<h4>
					<xsl:value-of select="$v_current"/>
				</h4>
			</xsl:when>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'section5') ">
				<h5>
					<xsl:value-of select="$v_current"/>
				</h5>
			</xsl:when>
			<xsl:when test="contains($v_current/../n1:templateId/@extension,'section6') ">
				<h6>
					<xsl:value-of select="$v_current"/>
				</h6>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$v_current"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!--   Text   -->
	<xsl:template match="n1:text">
		<xsl:apply-templates/>
	</xsl:template>

	<!-- Link Html -->
	<xsl:template match="n1:linkHtml">
		<xsl:element name="a">
			<xsl:for-each select="@*">
				<xsl:attribute name="{name()}"><xsl:value-of select="."/></xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates/>
			<!--<xsl:for-each select="l@*">
   			<xsl:if test="not(name()=&quot;originator&quot; or name()=&quot;confidentiality&quot;)">
				<xsl:attribute name="{name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:if>
		</xsl:for-each> -->
			<xsl:value-of select="link_html"/>
		</xsl:element>
	</xsl:template>

	<!--   paragraph  -->
	<xsl:template match="n1:paragraph">
		<p>
            <xsl:apply-templates/>
		</p>
	</xsl:template>

	<!--   paragraph  -->
	<xsl:template match="n1:br">
		<br/>
	</xsl:template>

	<!--     Content w/ deleted text is hidden -->
	<xsl:template match="n1:content[@revised='delete']"/>

	<!--   content  -->
	<xsl:template match="n1:content">
		<xsl:apply-templates/>
	</xsl:template>


	<!--   list  -->
	<xsl:template match="n1:list">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ul>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>
	<xsl:template match="n1:list[@listType='ordered']">
		<xsl:if test="n1:caption">
			<span style="font-weight:bold; ">
				<xsl:apply-templates select="n1:caption"/>
			</span>
		</xsl:if>
		<ol>
			<xsl:for-each select="n1:item">
				<li>
					<xsl:apply-templates/>
				</li>
			</xsl:for-each>
		</ol>
	</xsl:template>


	<!--   caption  -->
	<xsl:template match="n1:caption">
		<xsl:apply-templates/>
		<xsl:text>: </xsl:text>
	</xsl:template>


	<!--      Tables   -->
	<xsl:template match="n1:table/@*|n1:thead/@*|n1:tfoot/@*|n1:tbody/@*|n1:colgroup/@*|n1:col/@*|n1:tr/@*|n1:th/@*|n1:td/@*">
		<xsl:copy>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="n1:table">
		<table>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</table>
	</xsl:template>
	<xsl:template match="n1:thead">
		<thead>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</thead>
	</xsl:template>
	<xsl:template match="n1:tfoot">
		<tfoot>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tfoot>
	</xsl:template>
	<xsl:template match="n1:tbody">
		<tbody>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tbody>
	</xsl:template>
	<xsl:template match="n1:colgroup">
		<colgroup>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</colgroup>
	</xsl:template>
	<xsl:template match="n1:col">
		<col>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</col>
	</xsl:template>
	<xsl:template match="n1:tr">
		<tr>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</tr>
	</xsl:template>
	<xsl:template match="n1:th">
		<th>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</th>
	</xsl:template>
	<xsl:template match="n1:td">
		<td>
			<xsl:copy-of select="@*"/>
			<xsl:apply-templates/>
		</td>
	</xsl:template>
	<xsl:template match="n1:table/n1:caption">
		<span style="font-weight:bold; ">
			<xsl:apply-templates/>
		</span>
	</xsl:template>



 	<!--   RenderMultiMedia 
    
    this currently only handles GIF's and JPEG's.  It could, however,
    be extended by including other image MIME types in the predicate
    and/or by generating <object> or <applet> tag with the correct
    params depending on the media type  @ID  =$imageRef  referencedObject
    -->
	<xsl:template match="n1:renderMultiMedia">
		<xsl:variable name="imageRef" select="@referencedObject"/>
		<xsl:choose>
			<xsl:when test="//n1:regionOfInterest[@ID=$imageRef]">
				<!-- Here is where the Region of Interest image referencing goes -->
				<xsl:if test="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value[@mediaType='image/gif'           or
          @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:regionOfInterest[@ID=$imageRef]//n1:observationMedia/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<!-- Here is where the direct MultiMedia image referencing goes -->
				<xsl:if test="//n1:observationMedia[@ID=$imageRef]/n1:value[@mediaType='image/gif' or           @mediaType='image/jpeg']">
					<br clear="all"/>
					<xsl:element name="img">
						<xsl:attribute name="src"><xsl:value-of select="//n1:observationMedia[@ID=$imageRef]/n1:value/n1:reference/@value"/></xsl:attribute>
					</xsl:element>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<!--    Stylecode processing   
    Supports Bold, Underline and Italics display
    -->
	<xsl:template match="//n1:*[@styleCode]">
		<xsl:if test="@styleCode='Bold'">
			<xsl:element name="b">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Italics'">
			<xsl:element name="i">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="@styleCode='Underline'">
			<xsl:element name="u">
				<xsl:apply-templates/>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Italics') and not (contains(@styleCode, 'Underline'))">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Bold') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Italics'))">
			<xsl:element name="b">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and not (contains(@styleCode, 'Bold'))">
			<xsl:element name="i">
				<xsl:element name="u">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="contains(@styleCode,'Italics') and contains(@styleCode,'Underline') and contains(@styleCode, 'Bold')">
			<xsl:element name="b">
				<xsl:element name="i">
					<xsl:element name="u">
						<xsl:apply-templates/>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:if>
		<xsl:if test="not (contains(@styleCode,'Italics') or contains(@styleCode,'Underline') or contains(@styleCode, 'Bold'))">
			<xsl:apply-templates/>
		</xsl:if>
	</xsl:template>
	<!--    Superscript or Subscript   -->
	<xsl:template match="n1:sup">
		<xsl:element name="sup">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="n1:sub">
		<xsl:element name="sub">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>



	<!--  Header  -->
	<xsl:template name="header">
		     <div class="header">
				<table class="header">
					<tr>
						<th class="header">
							<xsl:text>NHS Number:</xsl:text>
						</th>
						<td class="header">
							<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id/@extension"/>
						</td>
					</tr>
					<tr>
						<th class="header">
							<xsl:text>Document Created:</xsl:text>
						</th>
						<td class="header">
							<xsl:call-template name="formatDate">
								<xsl:with-param name="date" select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
							</xsl:call-template>
						</td>
					</tr>
					<tr>
						<th class="header">
							<xsl:text>Document Owner:</xsl:text>
						</th>
						<td class="header">
							<xsl:value-of select="/n1:ClinicalDocument/n1:custodian/n1:assignedCustodian/n1:representedCustodianOrganization/n1:name"/>
						</td>
					</tr>
        			<xsl:for-each select="/n1:ClinicalDocument/n1:author">
        				<tr>
        					<th class="header">
        							<xsl:text>Authored by:</xsl:text>
        					</th>
        					<td class="header">
        					   <xsl:choose>
            						<xsl:when test="n1:assignedAuthor/n1:assignedPerson/n1:name">
            							<xsl:call-template name="getName">
            								<xsl:with-param name="name" select="n1:assignedAuthor/n1:assignedPerson/n1:name"/>
                                        </xsl:call-template>
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="n1:assignedAuthor/n1:code/@displayName"/>
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="n1:assignedAuthor/n1:representedOrganization/n1:name"/>
            						</xsl:when>
            						<xsl:when test="n1:assignedAuthor/n1:representedOrganization/n1:name">
                                        <xsl:value-of select="n1:assignedAuthor/n1:representedOrganization/n1:name"/>
              						</xsl:when>
              						<xsl:otherwise>
              						    <xsl:text>Unknown</xsl:text>
              						</xsl:otherwise>
          						</xsl:choose>
                                 <xsl:text> on </xsl:text>
        						<xsl:call-template name="formatDate">
        							<xsl:with-param name="date" select="n1:time/@value"/>
        						</xsl:call-template>
        					</td>
        				</tr>
        			</xsl:for-each>
        			<xsl:for-each select="/n1:ClinicalDocument/n1:authenticator">
        				<tr>
        					<th class="header">
        							<xsl:text>Authenitcated by:</xsl:text>
        					</th>
        					<td class="header">
        						<xsl:if test="n1:assignedEntity/n1:assignedPerson/n1:name">
        							<xsl:call-template name="getName">
        								<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
                                    </xsl:call-template>
                                    <xsl:text>, </xsl:text>
                                    <xsl:value-of select="n1:assignedEntity/n1:code/@displayName"/>
        						</xsl:if>
                                <xsl:text> on </xsl:text>
        						<xsl:call-template name="formatDate">
        							<xsl:with-param name="date" select="n1:time/@value"/>
        						</xsl:call-template>
        					</td>
        				</tr>
        			</xsl:for-each>
              	</table>
            </div>
	</xsl:template>

	<!--  Title Bar  -->
	<xsl:template name="titlebar">
	    <div class="titlebar">
		   <div class="doctitle"><xsl:value-of select="$title"/></div>
 
   			<xsl:for-each select="/n1:ClinicalDocument/n1:componentOf">
    			<xsl:if test="n1:encompassingEncounter">
    			     <table class="titlebar">
    			         <tr>
    			             <th class="titlebar">Encounter Type:</th>
        			         <td  class="titlebar">
           						<xsl:value-of select="n1:encompassingEncounter/n1:code/@displayName"/>
        			         </td>
    			         </tr>
    			         <tr>
    			             <th class="titlebar">Encounter Time:</th>
        			         <td  class="titlebar">
        			         <xsl:if test="//n1:encompassingEncounter/n1:effectiveTime/n1:low/@value">
            					<xsl:call-template name="formatDate">
            						<xsl:with-param name="date" select="n1:encompassingEncounter/n1:effectiveTime/n1:low/@value"/>
            					</xsl:call-template>
            					</xsl:if>
            					<xsl:if test="//n1:encompassingEncounter/n1:effectiveTime/n1:high/@value">
            					<xsl:text> to </xsl:text>
            					<xsl:call-template name="formatDate">
            						<xsl:with-param name="date" select="n1:encompassingEncounter/n1:effectiveTime/n1:high/@value"/>
            					</xsl:call-template>
            					</xsl:if>
            					<xsl:if test="//n1:encompassingEncounter/n1:effectiveTime/n1:center/@value">
									<xsl:call-template name="formatDate">
										<xsl:with-param name="date" select="//n1:encompassingEncounter/n1:effectiveTime/n1:center/@value"/>
									</xsl:call-template>
									</xsl:if>
            				</td>
        				</tr>
    			         <xsl:if test="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name">
    			           <tr>
    			             <th class="titlebar">Care Setting Organisation:</th>
        			         <td  class="titlebar">
           						<xsl:value-of select="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:serviceProviderOrganization/n1:name"/>
        			         </td>
    			         </tr>
    			         </xsl:if>
    			         <xsl:if test="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:location/n1:name" >
    			           <tr>
    			             <th class="titlebar">Care Setting Location:</th>
        			         <td  class="titlebar">
           						<xsl:value-of select="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:location/n1:name"/>
        			         </td>
    			         </tr>
    			         </xsl:if>
    			         <tr>
    			             <th class="titlebar">Care Setting Type:</th>
        			         <td  class="titlebar">
           						<xsl:value-of select="n1:encompassingEncounter/n1:location/n1:healthCareFacility/n1:code/@displayName"/>
        			         </td>
    			         </tr>
        			<xsl:for-each select="n1:encompassingEncounter/n1:responsibleParty">
        				<tr>
        					<th class="titlebar">
        						<xsl:text>Responsible Party:</xsl:text>
        					</th>
        					<td class="titlebar">
        						<xsl:if test="n1:assignedEntity/n1:assignedPerson/n1:name">
        							<xsl:call-template name="getName">
        								<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
                                    </xsl:call-template>
                                    <xsl:if test="n1:assignedEntity/n1:code/@displayName">
                                        <xsl:text>, </xsl:text>
                                        <xsl:value-of select="n1:assignedEntity/n1:code/@displayName"/>
                                    </xsl:if>
                     			</xsl:if>
                     		</td>
        				</tr>
        			</xsl:for-each>

        			</table>
                </xsl:if>
            </xsl:for-each>
		</div>
	</xsl:template>
	


	<!--  Footer  -->
	<xsl:template name="footer">
     <div class="footer">
		<table class="header">
			<tr>
				<th class="header">
					<xsl:text>Document ID:</xsl:text>
				</th>
				<td class="header">
			         <xsl:value-of select="/n1:ClinicalDocument/n1:id/@root"/>
				</td>
				<th class="header">
					<xsl:text>Version:</xsl:text>
				</th>
				<td class="header">
			         <xsl:value-of select="/n1:ClinicalDocument/n1:versionNumber/@value"/>
				</td>
			</tr>
				<xsl:for-each select="n1:informationRecipient">
        				<xsl:sort select="@typeCode" />
			<tr>
		
				<th class="header" valign="top">
				<xsl:choose>
					<xsl:when test="@typeCode='PRCP'and not(preceding-sibling::*/@typeCode='PRCP')">
						<xsl:choose>
						<xsl:when test="count(following-sibling::*[@typeCode='PRCP'])=0">
							<xsl:text>Primary Recipient:</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Primary Recipients:</xsl:text>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:when test="@typeCode='TRC'and not(preceding-sibling::*/@typeCode='TRC')">
						<xsl:choose>
						<xsl:when test="count(following-sibling::*[@typeCode='TRC'])=0">
						<xsl:text>Copy Recipient:</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>Copy Recipients:</xsl:text>
						</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text></xsl:text>
					</xsl:otherwise>
					
				</xsl:choose>
				</th>
				<td class="header" colspan="3">
        			
						<xsl:if test="n1:intendedRecipient/n1:informationRecipient/n1:name">
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:intendedRecipient/n1:informationRecipient/n1:name"/>
                            </xsl:call-template>
                            <xsl:if test="n1:intendedRecipient/npfitlc:recipientRoleCode/@displayName">
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="n1:intendedRecipient/npfitlc:recipientRoleCode/@displayName"/>
                            </xsl:if>
             			</xsl:if>
						<xsl:if test="n1:intendedRecipient/n1:receivedOrganization/n1:name">
							<xsl:if test="n1:intendedRecipient/n1:informationRecipient/n1:name">
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:call-template name="getName">
								<xsl:with-param name="name" select="n1:intendedRecipient/n1:receivedOrganization/n1:name"/>
                            </xsl:call-template>
             		<br/> 
             			</xsl:if>
        			
           		</td>
           		
			</tr>
			</xsl:for-each>
        </table>
	   </div>
	</xsl:template>
	
	
	<!-- 
  -->
	<xsl:template name="translateCode">
		<xsl:param name="code"/>
		<!--xsl:value-of select="document('voc.xml')/systems/system[@root=$code/@codeSystem]/code[@value=$code/@code]/@displayName"/-->
		<!--xsl:value-of select="document('codes.xml')/*/code[@code=$code]/@display"/-->
		<xsl:choose>
			<!-- lookup table Telecom URI -->
			<xsl:when test="$code='tel'">
				<xsl:text>Tel</xsl:text>
			</xsl:when>
			<xsl:when test="$code='fax'">
				<xsl:text>Fax</xsl:text>
			</xsl:when>
			<xsl:when test="$code='HP'">
				<xsl:text>Home</xsl:text>
			</xsl:when>
			<xsl:when test="$code='WP'">
				<xsl:text>Workplace</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>{$code}?</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- 
    Contact Information
  -->
	<xsl:template name="getContactInfo">
		<xsl:param name="contact"/>
		<xsl:apply-templates select="$contact/n1:addr"/>
		<xsl:apply-templates select="$contact/n1:telecom"/>
	</xsl:template>
	<xsl:template match="n1:addr">
		<xsl:for-each select="n1:streetAddressLine">
			<xsl:value-of select="."/>
			<br/>
		</xsl:for-each>
		<xsl:if test="n1:streetName">
			<xsl:value-of select="n1:streetName"/>
			<xsl:text> </xsl:text>
			<xsl:value-of select="n1:houseNumber"/>
			<br/>
		</xsl:if>
		<xsl:value-of select="n1:postalCode"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="n1:city"/>
		<xsl:if test="n1:state">
			<xsl:text>, </xsl:text>
			<xsl:value-of select="n1:state"/>
		</xsl:if>
		<br/>
	</xsl:template>
	<xsl:template match="n1:telecom">
		<xsl:variable name="type" select="substring-before(@value, ':')"/>
		<xsl:variable name="value" select="substring-after(@value, ':')"/>
		<xsl:if test="$type">
			<xsl:call-template name="translateCode">
				<xsl:with-param name="code" select="$type"/>
			</xsl:call-template>
			<xsl:text>: </xsl:text>
			<xsl:text> </xsl:text>
			<xsl:value-of select="$value"/>
			<xsl:if test="@use">
				<xsl:text> (</xsl:text>
				<xsl:call-template name="translateCode">
					<xsl:with-param name="code" select="@use"/>
				</xsl:call-template>
				<xsl:text>)</xsl:text>
			</xsl:if>
			<br/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="support">
		<table width="100%">
			<xsl:for-each select="/n1:ClinicalDocument/n1:participant[@typeCode='IND']">
				<tr>
					<td>
						<b>
							<xsl:for-each select="n1:associatedEntity/n1:code">
								<xsl:call-template name="translateCode">
									<xsl:with-param name="code" select="."/>
								</xsl:call-template>
								<xsl:text> </xsl:text>
							</xsl:for-each>
						</b>
					</td>
					<td>
						<xsl:call-template name="getName">
							<xsl:with-param name="name" select="n1:associatedEntity/n1:associatedPerson/n1:name"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:call-template name="getContactInfo">
							<xsl:with-param name="contact" select="n1:associatedEntity"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- 
  -->
	<xsl:template name="performer">
		<table width="100%">
			<xsl:for-each select="//n1:serviceEvent/n1:performer">
				<tr>
					<td>
						<b>
							<xsl:call-template name="translateCode">
								<xsl:with-param name="code" select="n1:functionCode"/>
							</xsl:call-template>
						</b>
					</td>
					<td>
						<xsl:call-template name="getName">
							<xsl:with-param name="name" select="n1:assignedEntity/n1:assignedPerson/n1:name"/>
						</xsl:call-template>
						<xsl:text> (</xsl:text>
						<xsl:call-template name="translateCode">
							<xsl:with-param name="code" select="n1:assignedEntity/n1:code"/>
						</xsl:call-template>) </td>
				</tr>
				<tr>
					<td/>
					<td>
						<xsl:call-template name="getContactInfo">
							<xsl:with-param name="contact" select="n1:assignedEntity"/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>
