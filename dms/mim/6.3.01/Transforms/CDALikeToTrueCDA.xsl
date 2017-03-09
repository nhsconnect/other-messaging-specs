<!-- XSLT to convert CFH CDA like "templated" examples to true CDA - Rik Smithies 21/02/2007 v0.4 -->
<!--
	This transform is limited since it needs to know about input model element names.

	Ideally the input data would be marked up to allow conversion to CDA,
    obviating the need for an ad hoc transform that knows the structure of the input models.
     
	The transform is for guidance only, and takes several shortcuts that are currently valid
	but may not be in future.

	It is not suitable for production use.

	There are two main tasks in this transform. Firstly, the input message uses the CFH tooling schema
	order, which does not match that of the normative CDA schema (or that of the CFH CDA schema, which has
	been manually reordered to match CDA). Secondly the "templated" names are converted to their CDA
	equivalents. Since the templated name can be anything of the modellers choice, this transform will need
	continually updating. It does however make some sensible guesses as to which CDA element is meant
	(eg all classCode="OBS" are considered CDA Observations). Template modelauthors can avoid changes
	to this being needed by sticking to CDA names in models unless there is a need to change. This also
	helps the templates be understood in terms of CDA.

	Input files should not list redundant namespaces, that is, ones declared and never used
	(eg a common one is xmlns:gsd="http://aurora.regenstrief.org/GenericXMLSchema"). Otherwise
	these will get copied verbosely (but harmelrssly) in the output.
	
-->
<!-- todo review and remove todo comments before final release -->
<!-- todo document the rules in here in "english" -->
<!-- Known Issues -->
<!-- Transform doesnt cover every possible participation,
	 and doesnt cover every RIM attribute in CDA -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:npfitlc="NPFIT:HL7:Localisation" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:h="urn:hl7-org:v3" exclude-result-prefixes="h">
	<xsl:output encoding="UTF-8"/>
	<xsl:output method="xml"/>
	<xsl:output indent="yes"/>
	<!-- By default the transform uses the CFH CDA constrained schema.
	 (typically located at ../schemas/POCD_MT000001UK01.xsd).
	 Override this parameter on transformation command line to substitute
     another schema, for instance the true CDA schema, whereever it happens
     to be located
     eg
     file:/C:/reference/hl7/CDA/CDA_R2_NormativeWebEdition/infrastructure/cda/CDA.xsd
-->
	<xsl:param name="sSchemaFileNameWithPath" select="'../../schemas/POCD_MT000001UK04.xsd'"/>
	<!--xsl:param name="sSchemaFileNameWithPath" select="'file:/C:/reference/hl7/CDA/CDA_R2_NormativeWebEdition/infrastructure/cda/CDA.xsd'"/-->
	<xsl:param name="bgShowWarnings" select="false()"/>
	<!-- Starts here -->
	<xsl:template match="/">
		<xsl:if test="$bgShowWarnings=true()">
			<xsl:apply-templates select="//*[@classCode]" mode="warnings"/>
		</xsl:if>
		<xsl:apply-templates select="*|comment()"/>
	</xsl:template>
	<!-- kill some implied attributes that we dont want to copy to output -->
	<xsl:template match="@type"/>
	<xsl:template match="@integrityCheckAlgorithm"/>
	<xsl:template match="@mediaType"/>
	<xsl:template match="@representation"/>
	<xsl:template match="@operator"/>
	<xsl:template match="@inverted"/>
	<xsl:template match="@inclusive"/>
	<xsl:template match="@partType"/>
	<xsl:template match="@CfhTemplatedExample"/>
	<!-- kill comments as these will get out of order -->
	<xsl:template match="comment()" priority="1">
		<xsl:variable name="sCommentText">
			<xsl:value-of select="."/>
		</xsl:variable>
		<xsl:if test="contains($sCommentText,'This example message')">
			<xsl:comment>
				<xsl:value-of select="$sCommentText"/>
			</xsl:comment>
		</xsl:if>
		<!-- special way to keep any given comment in if necessary -->
		<xsl:if test="contains($sCommentText,'Commented out')">
			<xsl:comment>
				<xsl:value-of select="$sCommentText"/>
			</xsl:comment>
		</xsl:if>
	</xsl:template>
	<!-- identity template to copy all non-root elements unless overridden elsewhere -->
	<!-- could we split this into two one for attributes and one for elements TJI -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:call-template name="copyChildren"/>
		</xsl:copy>
	</xsl:template>
	<!-- general template to copy all children making some generic changes -->
	<xsl:template name="copyChildren">
		<xsl:param name="bNoAttributes" select="false()"/>
		<!-- copy attributes, must come before elements (and caller
		 must not have already sent out any elements) -->
		<xsl:if test="not($bNoAttributes)">
			<xsl:apply-templates select="@*"/>
		</xsl:if>
		<!-- show in-line comments about parent -->
		<xsl:if test="$bgShowWarnings=true()">
			<xsl:apply-templates select="." mode="warnings"/>
		</xsl:if>
		<!-- copy all known elements, in the right order -->
		<xsl:call-template name="copyInCDAOrder"/>
		<!-- now copy anything else, which wont be in the right order.
		 There should be nothing here, but it catches things we may have missed,
		 probably requiring transform to be updated -->
		<xsl:call-template name="copyChildrenExcluding"/>
	</xsl:template>
	<xsl:template name="copyInCDAOrder">
		<!-- copy attributes in ad hoc different CDA specific order -->
		<!-- not all of these are allowed on all CDA classes of course -->
		<!-- NB when adding to here also add to copyChildrenExcluding -->
		<!-- may be an algorithmic way to do this, but probably just the rose tree order -->
		<!-- todo this needs a review to cover (at least) all RIM attributes in the CFH CDA model
		(or just all that are used in a template) -->
		<xsl:apply-templates select="h:typeId"/>
		<xsl:apply-templates select="h:templateId"/>
		<xsl:apply-templates select="npfitlc:messageType"/>
		<xsl:apply-templates select="npfitlc:recipientRoleCode"/>
		<xsl:apply-templates select="h:id"/>
		<xsl:apply-templates select="h:code"/>
		<xsl:apply-templates select="h:statusCode"/>
		<xsl:apply-templates select="h:title"/>
		<xsl:apply-templates select="h:effectiveTime"/>
		<xsl:apply-templates select="h:dischargeDispositionCode"/>
		<xsl:apply-templates select="h:text"/>
		<xsl:apply-templates select="h:confidentialityCode"/>
		<xsl:apply-templates select="h:name"/>
		<xsl:apply-templates select="h:telecom"/>
		<xsl:apply-templates select="h:addr"/>
		<xsl:apply-templates select="h:desc"/>
		<xsl:apply-templates select="h:repeatNumber"/>
		<xsl:apply-templates select="h:quantity"/>
		<xsl:apply-templates select="h:value"/>
		<xsl:apply-templates select="h:interpretationCode"/>
		<xsl:apply-templates select="h:product"/>
		<xsl:apply-templates select="h:setId"/>
		<xsl:apply-templates select="h:versionNumber"/>
		<xsl:apply-templates select="npfitlc:contentId"/>
		<xsl:apply-templates select="h:functionCode"/>
		<xsl:apply-templates select="h:time"/>
		<xsl:apply-templates select="h:signatureCode"/>
		<xsl:apply-templates select="h:modeCode"/>
		<xsl:apply-templates select="*[@typeCode='PRF'][not(*[@classCode='ROL'])]"/>
		<!-- standard performer before author (ENC) -->
		<xsl:apply-templates select="*[@typeCode='RCT']"/>
		<xsl:apply-templates select="*[@typeCode='AUT']"/>
		<xsl:apply-templates select="*[@typeCode='CSM']"/>
		<xsl:apply-templates select="*[@typeCode='INF']"/>
		<xsl:apply-templates select="*[@typeCode='PRF'][*[@classCode='ROL']]"/>
		<!-- performer as generic participation eg with a device, after author (ENC) -->
		<xsl:apply-templates select="*[@typeCode='SPRF']"/>
		<xsl:apply-templates select="*[@typeCode='RESP']"/>
		<xsl:apply-templates select="*[@typeCode='ATND']"/>
		<!-- secondary performer really a generic participant -->
		<xsl:apply-templates select="*[@typeCode='REF']"/>
		<!-- generic participant -->
		<xsl:apply-templates select="*[@typeCode='DEV']"/>
		<xsl:apply-templates select="*[@typeCode='WIT']"/>
		<xsl:apply-templates select="*[@typeCode='ENT']"/>
		<xsl:apply-templates select="*[@typeCode='LOC']"/>
		<xsl:apply-templates select="*[@typeCode='RCV']"/>
		<xsl:apply-templates select="*[@typeCode='CST']"/>
		<xsl:apply-templates select="*[@typeCode='PRCP']"/>
		<xsl:apply-templates select="*[@typeCode='TRC']"/>
		<xsl:apply-templates select="*[@typeCode='AUTHEN']"/>
		<xsl:apply-templates select="*[@typeCode='LA']"/>
		<xsl:apply-templates select="*[@typeCode='RPLC']"/>
		<xsl:apply-templates select="h:componentOf"/>
		<xsl:apply-templates select="h:entry"/>
		<xsl:apply-templates select="h:entry1"/>
		<!-- <xsl:apply-templates select="*[@typeCode='COMP']"/> -->
		<!--<xsl:apply-templates select="*[@typeCode='REFR']"/>-->
	</xsl:template>
	<xsl:template name="copyChildrenExcluding">
		<!-- exclude the attributes already copied -->
		<!-- keep this in sync with the copyInCDAOrder template above -->
		<xsl:apply-templates select="node()
								[not(self::h:id)]
								[not(self::h:typeId)]
								[not(self::h:templateId)]
								[not(self::npfitlc:messageType)]
								[not(self::npfitlc:recipientRoleCode)]
								[not(self::h:code)]
								[not(self::h:statusCode)]
								[not(self::h:effectiveTime)]
								[not(self::h:confidentialityCode)]
								[not(self::h:title)]
								[not(self::h:text)]
								[not(self::h:name)]
								[not(self::h:telecom)]
								[not(self::h:addr)]
								[not(self::h:desc)]
								[not(self::h:quantity)]
								[not(self::h:repeatNumber)]
								[not(self::h:value)]
								[not(self::h:dischargeDispositionCode)]
								[not(self::h:interpretationCode)]
								[not(self::h:product)]
								[not(self::h:setId)]	
								[not(self::h:componentOf)]							
								[not(self::h:versionNumber)]
								[not(self::npfitlc:contentId)]
								[not(self::h:functionCode)]
								[not(self::h:time)]
								[not(self::h:signatureCode)]
								[not(self::h:entry)]
								[not(self::h:entry1)]
								[not(self::h:modeCode)]
								[not(self::*[@typeCode='PRF'])]
								[not(self::*[@typeCode='DEV'])]
								[not(self::*[@typeCode='WIT'])]
								[not(self::*[@typeCode='SPRF'])]
								[not(self::*[@typeCode='REF'])]
								[not(self::*[@typeCode='RESP'])]
								[not(self::*[@typeCode='ATND'])]
								[not(self::*[@typeCode='RCT'])]
								[not(self::*[@typeCode='AUT'])]
								[not(self::*[@typeCode='ENT'])]
								[not(self::*[@typeCode='INF'])]
								[not(self::*[@typeCode='LOC'])]
								[not(self::*[@typeCode='RCV'])]
								[not(self::*[@typeCode='CST'])]
								[not(self::*[@typeCode='PRCP'])]
								[not(self::*[@typeCode='TRC'])]
								[not(self::*[@typeCode='AUTHEN'])]
								[not(self::*[@typeCode='LA'])]
								[not(self::*[@typeCode='RPLC'])]
								[not(self::*[@typeCode='CSM'])]
								
								
								"/>
		<!-- [not(self::*[@typeCode='COMP'])] -->
		<!--[not(self::*[@typeCode='REFR'])] -->
	</xsl:template>
	<!-- kill the existing schema location, which will be replaced in ClinicalDocument template -->
	<!-- this is necessary, to prevent it reappearing after it gets replaced -->
	<xsl:template match="@*[local-name(.)='schemaLocation']"/>
	<xsl:template match="h:ClinicalDocument">
		<ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:npfitlc="NPFIT:HL7:Localisation">
			<!-- insert schema location based on global parameter -->
			<xsl:attribute name="xsi:schemaLocation"><xsl:text>urn:hl7-org:v3 </xsl:text><xsl:value-of select="$sSchemaFileNameWithPath"/></xsl:attribute>
			<!-- Copy all children including attributes -->
			<!-- note that line below this would reinsert the orignal schema attribute,
			 but is prevented from doing so by the schemaLocation killing template above -->
			<xsl:call-template name="copyChildren"/>
		</ClinicalDocument>
	</xsl:template>
	<!-- convert actRefs to CDA style -->
	<xsl:template match="*[@classCode]
						[contains(local-name(),'Ref')]
						[../h:templateId/@root='2.16.840.1.113883.2.1.3.2.4.18.2']" priority="10">
		<!--
		 ActReferences of the sort used in current HL7.org Clincal Statement pattern, did not exist
		 at the time CDA last was harmonized with Clinical Statement.
		
		 CFH has a history of using ActRefs and so these must be modelled in CDA
		 (even though there is no native support for them).
		
		 In fact Clinical Statement itself just uses a cut down act (that has only classCode, moodCode and id)
		 to represent an ActRef.
		
		 CDA can approximate this using any of several of its clinical statement choice
		 classes (although one of these, Act, has the act.code as also mandatory).
		 
		 Consequently, ActRefs are represented in CDA using an appropriate CDA clinical statement, that has
		 4 attributes classCode, moodCode, id and code. Code must always be sent with a nullFlavor of "NA"
		 to show it is just there for schema compliance.
		 
		 An exception is for actRefs to document parts, DOCCLIN or DOCSECT (used in sealing related
		 templates. Since these cant be accomodated by the clinical statement choice box
		 (the classCodes arent available in there), they instead use the CDA reference/externalAct construct.
 	-->
		<!-- This template doesnt actually do anything that wouldnt happen elsewhere in the stylsesheet
 		(other than adding a comment) but it does give a point that all actRefs pass throuhh,
 		so they can all be modified if need be eg to add a templateId,
 		or to alter the datatype to use the forthcoming id.useType -->
		<xsl:variable name="sActType">
			<xsl:choose>
				<xsl:when test="contains(local-name(),'TextSectionRef') or contains(local-name(),'DocumentHeaderRef')">
					<xsl:text>externalAct</xsl:text>
				</xsl:when>
				<xsl:when test="contains(local-name(),'EncompassingEncounter')">
					<xsl:text>encompassingEncounter</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:choose>
						<!-- it is necessary to use the correct class, because the generic Act cannot
					     have the more specific classCodes that specialised classes exist for -->
						<xsl:when test="@classCode='OBS'">observation</xsl:when>
						<xsl:when test="@classCode='PROC'">procedure</xsl:when>
						<xsl:when test="@classCode='SBADM'">substanceAdministration</xsl:when>
						<xsl:when test="@classCode='SPLY'">supply</xsl:when>
						<xsl:when test="@classCode='ENC'">encounter</xsl:when>
						<xsl:when test="@classCode='BATTERY'">organizer</xsl:when>
						<!-- an implementation option here would be to always to use Act, regardles of classCode -->
						<xsl:otherwise>act</xsl:otherwise>
					</xsl:choose>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="contains(local-name(),'TextSectionRef') or contains(local-name(),'DocumentHeaderRef')">
				<xsl:comment> This represents an ActRef to a text section DOCCLIN or DOCSECT </xsl:comment>
			</xsl:when>
			<xsl:otherwise>
				<!-- <xsl:comment> This Act represents a clinical statement ActRef </xsl:comment> -->
			</xsl:otherwise>
		</xsl:choose>
		<xsl:element name="{$sActType}" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
			<!-- this may not be needed, and also it may already be there anyway -->
			<!--code nullFlavor="NA"/-->
			<!-- todo it is not ideal that organizer (alone) needs statusCode here (needs model change to support this really) -->
			<xsl:if test="$sActType='organizer'">
				<!-- may already be there in future, but not allowed now, so no check -->
				<xsl:comment> This statusCode added automatically when making the act reference </xsl:comment>
				<statusCode code="completed" xmlns="urn:hl7-org:v3"/>
			</xsl:if>
		</xsl:element>
	</xsl:template>
	<!-- Acts -->
	<!-- General CDA acts are used, per classCode, with exceptions coming later -->
	<!-- All classCodes that are found in CFH CDA are covered -->
	<!-- DOCCLIN itself (focal act and ParentDocument) not specifically covered -->
	<xsl:template match="*[@classCode='DOCBODY']">
		<structuredBody xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</structuredBody>
	</xsl:template>
	<xsl:template match="*[@classCode='DOCSECT']">
		<section xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</section>
	</xsl:template>
	<xsl:template match="*[@classCode='OBS']">
		<observation xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</observation>
	</xsl:template>
	<xsl:template match="*[@classCode='OBS'][@moodCode='EVN.CRT']">
		<observationRange xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</observationRange>
	</xsl:template>
	<!-- ROIOVL not in CFH -->
	<xsl:template match="*[@classCode='SBADM']">
		<substanceAdministration xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</substanceAdministration>
	</xsl:template>
	<xsl:template match="*[@classCode='SPLY']">
		<supply xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</supply>
	</xsl:template>
	<xsl:template match="*[@classCode='PROC']">
		<procedure xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</procedure>
	</xsl:template>
	<xsl:template match="*[@classCode='ENC']">
		<xsl:choose>
			<xsl:when test="contains(local-name(),'EncompassingEncounter')">
				<encompassingEncounter xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</encompassingEncounter>
			</xsl:when>
			<xsl:otherwise>
				<encounter xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</encounter>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Organizers -->
	<!-- CLUSTER not used so far (MIM 6.1) in CFH -->
	<xsl:template match="*[@classCode='BATTERY']|*[@classCode='CLUSTER']">
		<organizer xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</organizer>
	</xsl:template>
	<!-- Generic Act -->
	<xsl:template match="*[@classCode='ACT']">
		<act xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</act>
	</xsl:template>
	<!-- Act subtypes are ACCM CONS CTTEVENT INC INFRM PCPR REG SPCTRT
	 Some are not anticipated in CFH  -->
	<xsl:template match="*[@classCode='INFRM']">
		<act xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</act>
	</xsl:template>
	<xsl:template match="*[@classCode='PCPR']">
		<act xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</act>
	</xsl:template>
	<!-- CFH schema sometimes adds 'prior' on to element names if RPLC is used -->
	<xsl:template match="h:priorParentDocument">
		<parentDocument xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</parentDocument>
	</xsl:template>
	<xsl:template match="h:entry1">
		<xsl:comment>Here are the CRE Type list entries</xsl:comment>
		<entry xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entry>
	</xsl:template>
	<xsl:template match="h:entry">
		<xsl:comment>Here are the coded entries</xsl:comment>
		<entry xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entry>
	</xsl:template>
	<!-- Entry relationships -->
	<!-- All things called componentN are mapped to component, similarly entryRelationshipN -->
	<!-- Note that component in clinical statement part of CDA
	 is _only_ for Organizer to Act links and not for Act to Act (which uses entryRelationship) -->
	<!-- eg components in blood pressure. -->
	<xsl:template match="*[contains(local-name(),'componentOf')][@typeCode='COMP']">
		<componentOf xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</componentOf>
	</xsl:template>
	<xsl:template match="*[contains(local-name(),'component') and local-name()!='componentOf'][@typeCode='COMP']">
		<component xmlns="urn:hl7-org:v3">
			<!--<xsl:if test="name(parent::node())='classificationSection'">
	 <xsl:comment>Here is the text section</xsl:comment>
		 <xsl:call-template name="copyChildren" />
	</xsl:if> -->
			<xsl:call-template name="copyChildren"/>
		</component>
	</xsl:template>
	<xsl:template match="*[contains(local-name(),'entryRelationship')]">
		<entryRelationship xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entryRelationship>
	</xsl:template>
	<!-- Participations -->
	<!-- tested for 6.1, still needed -->
	<!-- map to general participation off the clinical statement choice,
	 this may get overriden -->
	<!-- Many participations and PRCP in clinical choice box maps to generic participant -->
	<!-- PRCP in clinical choice box maps to generic participant -->
	<xsl:template match="*[@typeCode='LOC' or @typeCode='SPRF' or @typeCode='DST'
						or @typeCode='ORG' or @typeCode='RCV' or @typeCode='TRC'
						or @typeCode='REF' or @typeCode='RESP' or @typeCode='WIT']
					|*[@typeCode]/*/*[@typeCode='PRCP']
					|*[@typeCode='INF'][*/@classCode='ASSIGNED']">
		<xsl:choose>
			<xsl:when test="contains(local-name(),'encounterParticipant')">
				<encounterParticipant xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- todo temporarlily force contextControlCode to OP until model is fixed-->
					<xsl:call-template name="copyChildren">
						<xsl:with-param name="bNoAttributes" select="true()"/>
					</xsl:call-template>
				</encounterParticipant>
			</xsl:when>
			<xsl:when test="contains(local-name(),'responsibleParty') and not(./h:time)">
				<!-- This is ok for now-->
				<responsibleParty xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- todo temporarlily force contextControlCode to OP until model is fixed-->
					<xsl:call-template name="copyChildren">
						<xsl:with-param name="bNoAttributes" select="true()"/>
					</xsl:call-template>
				</responsibleParty>
			</xsl:when>
			<xsl:when test="contains(local-name(),'location') and starts-with(./h:templateId/@extension,'COCD_TP146060')">
				<location xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- todo temporarlily force contextControlCode to OP until model is fixed-->
					<xsl:call-template name="copyChildren">
						<xsl:with-param name="bNoAttributes" select="true()"/>
					</xsl:call-template>
				</location>
			</xsl:when>
			<xsl:otherwise>
				<participant xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- todo temporarlily force contextControlCode to OP until model is fixed-->
					<xsl:if test="@typeCode='PRCP'">
						<xsl:attribute name="contextControlCode">OP</xsl:attribute>
					</xsl:if>
					<xsl:if test="@typeCode='INF'">
						<xsl:comment> ADDED MISSING TYPEID </xsl:comment>
						<typeId root="2.16.840.1.113883.1.3" extension="COCD_TP000000UK01#informant" xmlns="urn:hl7-org:v3"/>
					</xsl:if>
					<xsl:call-template name="copyChildren">
						<xsl:with-param name="bNoAttributes" select="true()"/>
					</xsl:call-template>
				</participant>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- location (SDLOC, ISDLOC) is from encounter -->
	<xsl:template match="*[@classCode='SDLOC' or @classCode='ISDLOC'
						or @classCode='PRS' or @classCode='ROL']">
		<!-- TJI may need to Change -->
		<xsl:choose>
			<xsl:when test="contains(local-name(),'HealthCareFacility')">
				<healthCareFacility xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- todo temporarlily force contextControlCode to OP until model is fixed-->
					<xsl:call-template name="copyChildren">
					</xsl:call-template>
				</healthCareFacility>
			</xsl:when>
			<xsl:otherwise>
				<participantRole xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</participantRole>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[@classCode='PAT']">
		<patientRole xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</patientRole>
	</xsl:template>
	<xsl:template match="*[@typeCode='CST']/*[@classCode='ASSIGNED']">
		<assignedCustodian xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</assignedCustodian>
	</xsl:template>
	<!-- bug fix here post MIM 6.1, could not have matched anything -->
	<xsl:template match="*[@typeCode='INF']/*[@classCode='PRS']">
		<relatedEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</relatedEntity>
	</xsl:template>
	<!-- todo code to strip of SDS ?? -->
	<!-- TODO needs to use classCode Need to try this on these 2 templates and regression test -->
	<xsl:template match="*[../@typeCode='AUT'][contains(local-name(),'AssignedAuthor')]
						|*[../@typeCode='AUT'][contains(local-name(),'AssignedEntity')]">
		<assignedAuthor xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</assignedAuthor>
	</xsl:template>
	<xsl:template match="h:author1[@typeCode='AUT']">
		<author xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</author>
	</xsl:template>
	<!-- tracker off focal act -->
	<xsl:template match="/*/h:*[@typeCode='TRC']">
		<informationRecipient xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</informationRecipient>
	</xsl:template>
	<!-- assignedEntity is assignedEntity except when its done with the generic Partication -->
	<!-- todo use classCode instead of name (tracker should be here ?) -->
	<!-- todo drop the not() bit and regression test it, template below should take priority -->
	<xsl:template match="*[contains(local-name(),'AssignedEntitySDS')]   [not(contains(local-name(..),'receiver') or contains(local-name(..),'referrer') or contains(local-name(..),'tracker') or  ../h:time)] 
						|*[@classCode='ASSIGNED']
							[../@typeCode='AUTHEN' or ../@typeCode='LA' or ../@typeCode='ENT'
								or ../@typeCode='INF' or ../@typeCode='PRF' or ../@typeCode='RESP'] ">
		<assignedEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</assignedEntity>
	</xsl:template>
	<!-- this is the role in the generic participant off clinical statement choice
TODO refactor this to make its use more obvious -->
	<!-- this takes priority over generic ASSIGNED one above -->
	<xsl:template match="*[@classCode='ASSIGNED']
							[contains(local-name(..),'receiver')
								or contains(local-name(..),'tracker')
								or contains(local-name(..),'referrer')
								or contains(local-name(..),'informant') or contains(local-name(..),'witness') or  (../h:time and ../@typeCode='RESP')  ]">
		<participantRole xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</participantRole>
	</xsl:template>
	<xsl:template match="*[contains(local-name(),'representedOrganization')]">
		<representedOrganization xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</representedOrganization>
	</xsl:template>
	<!-- todo this template may make the one above unnecessary -->
	<xsl:template match="*[@typeCode='INF']/*[@classCode='ASSIGNED']/*[contains(local-name(),'representedOrganization')]">
		<scopingEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</scopingEntity>
	</xsl:template>
	<!-- todo other subtypes of PRCP could go here and in template below -->
	<xsl:template match="*[../@typeCode='PRCP' or ../@typeCode='TRC'][contains(local-name(),'AssignedEntitySDS') or contains(local-name(),'IntendedRecipient')]">
		<intendedRecipient xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</intendedRecipient>
	</xsl:template>
	<xsl:template match="*[../../@typeCode='PRCP' or ../../@typeCode='TRC'][local-name()='representedOrganization']">
		<receivedOrganization xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</receivedOrganization>
	</xsl:template>
	<xsl:template match="*[@classCode='PSN']">
		<xsl:choose>
			<xsl:when test="contains(local-name(..),'COCD_TP145016UK')">
				<playingEntity xmlns="urn:hl7-org:v3">
					<!--<xsl:apply-templates select="@*"/>-->
					<xsl:call-template name="copyChildren"/>
				</playingEntity>
			</xsl:when>
			<xsl:when test="../../@typeCode='AUT' or ../../@typeCode='PRF' or ../../@typeCode='AUTHEN' or ../../@typeCode='LA' or ../../@typeCode='ENT' or ../../@typeCode='REF' or (../../@typeCode='RESP' and not( ../../h:time)) or ../../@typeCode='ATND' ">
				<!-- problem here TJI-->
				<assignedPerson xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</assignedPerson>
			</xsl:when>
			<xsl:when test="../../@typeCode='PRCP' and not(../../../../@typeCode)">
				<!-- PRCP off root (only) has a special case entity -->
				<informationRecipient xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</informationRecipient>
			</xsl:when>
			<xsl:when test="../../@typeCode='TRC'">
				<informationRecipient xmlns="urn:hl7-org:v3">
					<xsl:call-template name="copyChildren"/>
				</informationRecipient>
			</xsl:when>
			<xsl:when test="../../@typeCode='INF'">
				<xsl:choose>
					<xsl:when test="../@classCode='ASSIGNED'">
						<playingEntity xmlns="urn:hl7-org:v3">
							<xsl:apply-templates select="@*"/>
							<!-- TODo fudge in a type id -->
							<!--<xsl:if test="not(h:typeId)">
								<typeId root="2.16.840.1.113883.1.3" extension="COCD_TP000000UK01#assignedPerson" xmlns="urn:hl7-org:v3"/>
							</xsl:if> -->
							<xsl:call-template name="copyChildren"/>
						</playingEntity>
					</xsl:when>
					<xsl:otherwise>
						<relatedPerson xmlns="urn:hl7-org:v3">
							<xsl:call-template name="copyChildren"/>
						</relatedPerson>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<!-- Remaining PSNs are playingEntities -->
				<!-- medication supply is one of these (it matches [../../@typeCode='RCV']) -->
				<playingEntity xmlns="urn:hl7-org:v3">
					<xsl:apply-templates select="@*"/>
					<!-- TODO THIS IS A WORKAROUND FOR A MISSING TYPEID IN THE MODEL -->
					<xsl:if test="not(h:typeId)">
						<!--	<xsl:comment> TYPEID ADDED AS A WORKAROUND </xsl:comment>
						 <typeId xmlns="urn:hl7-org:v3" root="2.16.840.1.113883.1.3" extension="COCD_TP145006UK01#assignedPerson"/> -->
					</xsl:if>
					<xsl:call-template name="copyChildren"/>
				</playingEntity>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[@classCode='PLC' and not(h:addr)]">
		<!-- in TRNS acts -->
		<playingEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</playingEntity>
	</xsl:template>
	<!-- secondary performers need careful handling -->
	<!-- todo helpful to rename the SPRF one in our models ? -->
	<xsl:template match="*[../@typeCode='SPRF'][contains(local-name(),'AssignedEntitySDS') or contains(local-name(),'ParticipantRole') ]">
		<participantRole xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</participantRole>
	</xsl:template>
	<xsl:template match="*[../../@typeCode='SPRF'][contains(local-name(),'Person')]">
		<playingEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</playingEntity>
	</xsl:template>
	<!-- some performers are not CDA performers and have to be modelled with generic participant -->
	<xsl:template match="h:performer[*[@classCode='ROL']]">
		<participant xmlns="urn:hl7-org:v3">
			<xsl:apply-templates select="@*"/>
			<!-- TODO THIS IS A WORKAROUND FOR A MISSING TYPEID IN THE MODEL -->
			<xsl:comment> TYPEID ADDED AS A WORKAROUND </xsl:comment>
			<!-- <typeId xmlns="urn:hl7-org:v3" root="2.16.840.1.113883.1.3" extension="COCD_TP146005UK01#performer"/> -->
			<xsl:call-template name="copyChildren"/>
		</participant>
	</xsl:template>
	<xsl:template match="*[contains(local-name(),'scopingOrganization')]">
		<scopingEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</scopingEntity>
	</xsl:template>
	<xsl:template match="h:manufacturedManufacturedMaterial">
		<manufacturedMaterial xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</manufacturedMaterial>
	</xsl:template>
	<!-- This could be refactored to join up all templates that do participantRole -->
	<!-- this is anything in generic participant/role, any subtype of ROL is allowed (though CFH doesnt use many) -->
	<xsl:template match="*[@typeCode]/*/*[@typeCode='PRCP']/*[@classCode='PAT' or @classCode='ASSIGNED']">
		<participantRole xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</participantRole>
	</xsl:template>
	<!-- xsi:type issues -->
	<!-- Add in xsi:type="CV" on administrationType in MedicationAdministrationDose -->
	<!-- This is needed because a "tightened" CV is no longer a CV (its an anonymous restriction of CV)
	 so the example cannot have xsi:type='CV'. However CDA is completely untightned and needs the xsi:type,
	 so it needs inserting on the fly (and removing again later for validation) -->
	<!-- this could be less hard coded by interepreting MIF or doing a hueristic search to see what data type it looks like -->
	<xsl:template match="h:value[local-name(..)='administrationType' or local-name(..)='refusalReason']">
		<value xsi:type="CV" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="//*[@classCode='OBS']/h:value[h:low or h:center and not(@xsi:type)]">
		<value xsi:type="IVL_TS" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="//*[@classCode='OBS']/h:value[@unit and not(@xsi:type)]">
		<value xsi:type="PQ" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="//*[@classCode='OBS']/h:value[string-length(.)>0 and not(@xsi:type) and not(./*)] ">
		<value xsi:type="ST" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="//*[@classCode='OBS']/h:value[@root and not(@xsi:type)] ">
		<value xsi:type="II" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="h:value[@value='false' or @value='true' and not(xsi:type)]">
		<value xsi:type="BL" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<xsl:template match="h:value[local-name(..)='acuteScriptFlag']">
		<value xsi:type="BL" xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</value>
	</xsl:template>
	<!-- Templated Location/Place in ServiceDeliveryLocationSDS allows saying xsi:type='TN' (although its not mandatory)
	 but this is forbidden in CDA, so strip it (since this isn't a subtype of CDA 'PN') -->
	<xsl:template match="h:name[../@classCode='PLC']">
		<name xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren">
				<xsl:with-param name="bNoAttributes" select="true()"/>
			</xsl:call-template>
		</name>
	</xsl:template>
	<!-- new for sealing, most things called component are actually CDA entryRelationships
	 rather than component, so we need to convert. -->
	<xsl:template match="*[@typeCode='COMP'][starts-with(../h:templateId/@extension,'COCD_TP146044') and contains(../h:templateId/@extension,'RefusalToSeal')]">
		<entryRelationship xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entryRelationship>
	</xsl:template>
	<!-- todo this may no longer be needed, since template below may cover it -->
	<xsl:template match="*[local-name()='component3'][contains(../h:templateId/@extension,'UnSealingEvent')]">
		<entryRelationship xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entryRelationship>
	</xsl:template>
	<!-- This is now needed, above may not be todo -->
	<xsl:template match="h:component3[h:requestToSeal]">
		<entryRelationship xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entryRelationship>
	</xsl:template>
	<xsl:template match="h:component3[h:requestToUnSeal]">
		<entryRelationship xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</entryRelationship>
	</xsl:template>
	<!-- custodian could be called participant in the model, would be easier to read -->
	<xsl:template match="h:custodian[contains(local-name(..),'SealingEvent')]">
		<participant xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</participant>
	</xsl:template>
	<!-- careful of other CST which takes priority -->
	<!-- <xsl:template match="*[starts-with(name(.),'COCD_TP145015UK') and contains(name(.),'AssignedWorkGroup') ]" priority="1">
TJI need to allow for location 
		<participantRole xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</participantRole>
	</xsl:template>-->
	<!-- Fixes for current modelling issues (POST MIM 6.1) -->
	<!-- TODO THIS IS A WORKAROUND FOR BUG IN TRC IN REQUESTMEDSUPPLY -->
	<xsl:template match="*[@typeCode='TRC']/@contextControlCode">
		<!-- force to mandatory correct value, our model is wrong -->
		<xsl:attribute name="contextControlCode">OP</xsl:attribute>
	</xsl:template>
	<!-- TODO THIS IS A WORKAROUND FOR BUG IN LOC IN REQUESTMEDSUPPLY -->
	<xsl:template match="*[@typeCode='LOC']/@contextControlCode">
		<!-- force to mandatory correct value, our model is wrong -->
		<xsl:attribute name="contextControlCode">OP</xsl:attribute>
	</xsl:template>
	<!-- data enterer must have context control, doesnt have it at all in discharge at least -->
	<xsl:template match="*[@typeCode='ENT']">
		<dataEnterer xmlns="urn:hl7-org:v3">
			<xsl:attribute name="contextControlCode">OP</xsl:attribute>
			<xsl:call-template name="copyChildren"/>
		</dataEnterer>
	</xsl:template>
	<!-- organisations in authenticator/dataEnter are all wrong, remove to workaround
representedOrganization/representedOrganizationSDS -->
	<xsl:template match="*[@classCode='ORG'][../../@typeCode='AUTHEN' or ../../@typeCode='ENT']">
		<!-- <xsl:comment>WARNING - NON CONFORMANT ORGANISATION REMOVED </xsl:comment> -->
	</xsl:template>
	<!-- todo move down -->
	<!-- todo this fixes missing time and signatureCode -->
	<xsl:template match="*[@classCode='ASSIGNED'][../@typeCode='AUTHEN' or ../@typeCode='LA' or ../@typeCode='ENT']">
		<!--<xsl:comment> WARNING Some templates dont allow the CDA mandatory time and signatureCode here. Dummy values added.</xsl:comment>-->
		<!--	<time xmlns="urn:hl7-org:v3"/>
		<xsl:if test="../@typeCode='AUTHEN' or ../@typeCode='LA'">
			<signatureCode xmlns="urn:hl7-org:v3"/>
		</xsl:if> -->
		<assignedEntity xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</assignedEntity>
	</xsl:template>
	<!-- todo this fixes the no-id error in some dataEnterer assigned entities -->
	<!-- also fixes lifestyle/author/assigned, no id when its mandatory -->
	<xsl:template match="*[@classCode='ASSIGNED']
						[../@typeCode='AUTHEN' or ../@typeCode='LA' or ../@typeCode='ENT'
							or ../@typeCode='AUT' or ../@typeCode='INF' or ../@typeCode='PRF']/h:code">
		<!--<xsl:comment> WARNING Some templates dont allow the CDA mandatory ID here. Dummy id added.</xsl:comment>
		<id root="2.16.840.1.113883.2.1.3.2.4.17.9999" extension="dummyid" xmlns="urn:hl7-org:v3"/>-->
		<code xmlns="urn:hl7-org:v3">
			<xsl:call-template name="copyChildren"/>
		</code>
	</xsl:template>
	<!-- fix for desc being mandatory -->
	<!--
Informant in Alcohol consumption has EntityNonSDSWithOrgSDS (COCD_TP145005UK01) as an option which has OrganizationSDS, with mandatory desc.
This cords to Organization clone in CDA, which doesn’t have desc at all.
-->
	<!--xsl:template match="h:informant/*[@classCode='ASSIGNED']/*[@classCode='ORG']/h:desc">
	<xsl:comment> FIX desc removed since CDA doesnt have it </xsl:comment>
</xsl:template-->
	<!-- same issue with Performer in Inform in MedicationDiscontinuation -->
	<xsl:template match="h:informPatient/h:performer/*[@classCode='ASSIGNED']/*[@classCode='ORG']/h:desc">
		<xsl:comment> FIX desc removed since CDA doesnt have it </xsl:comment>
	</xsl:template>
	<!-- wrong typeId case in <typeId root="2.16.840.1.113883.1.3" extension="COCD_TP146005UK01#Location" -->
	<!--<xsl:template match="@extension[starts-with(.,'COCD_TP146005UK') and contains(.,'#Location')]">
		<xsl:attribute name="extension">COCD_TP146005UK01#location</xsl:attribute>
	</xsl:template>
	<xsl:template match="@extension[starts-with(.,'COCD_TP146031UK') and contains(.,'Location')]">
		<xsl:attribute name="extension">COCD_TP146031UK01#location</xsl:attribute>
	</xsl:template> -->
	<!-- kill incorrect mandatory contextControlCode -->
	<xsl:template match="h:consumable[@typeCode='CSM']/@contextControlCode"/>
	<!-- end of main templates -->
	<!-- warnings about possible modelling problems -->
	<!-- unless a more specific warning template fires, eat this node -->
	<xsl:template match="*" mode="warnings"/>
	<!-- Attempt to detect act to act relationships that dont use entryRelatioship -->
	<xsl:template match="*[@classCode='ACT' or @classCode='OBS' or @classCode='SBADM'
							or @classCode='SPLY' or @classCode='ENC' or @classCode='PROC']
						[not(contains(local-name(..), 'entryRelationship'))]
						[../../@classCode]
						[../../@classCode!='BATTERY']
						[../../@classCode!='DOCCLIN']
						[../../@classCode!='DOCSECT']" mode="warnings">
		<!-- Indent this to left margin so it stands out -->
		<xsl:comment>
Warning : Found act-to-act relationship that doesn't appear to use entryRelationship
<xsl:value-of select="local-name(..)"/>.<xsl:value-of select="local-name(.)"/>
			<xsl:text> </xsl:text>
		</xsl:comment>
	</xsl:template>
</xsl:stylesheet>
