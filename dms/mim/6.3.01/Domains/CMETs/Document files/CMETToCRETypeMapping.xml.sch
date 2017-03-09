<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://www.ascc.net/xml/schematron">
   <title>NPfIT Schematron pattern for CRE Type mappings</title>
   <ns prefix="v3" uri="urn:hl7-org:v3"/>
   <pattern name="Validate CRE Code 163141000000104 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163141000000104']]">
         <assert test="v3:code/@displayName='Investigation Results'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Investigation Results'.</assert>
         <report test="v3:code/@displayName='Investigation Results'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163141000000104 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163141000000104']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144043UK02.Finding' or name(.)='UKCT_MT144043UK02.FindingOrganizer'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144043UK02.Finding' or 'UKCT_MT144043UK02.FindingOrganizer'.</assert>
         <report test="name(.)='UKCT_MT144043UK02.Finding' or name(.)='UKCT_MT144043UK02.FindingOrganizer'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163171000000105 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163171000000105']]">
         <assert test="v3:code/@displayName='Care Professional Documentation'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Care Professional Documentation'.</assert>
         <report test="v3:code/@displayName='Care Professional Documentation'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163171000000105 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163171000000105']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144035UK01.CareProfessionalDocumentation'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144035UK01.CareProfessionalDocumentation'.</assert>
         <report test="name(.)='UKCT_MT144035UK01.CareProfessionalDocumentation'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163181000000107 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163181000000107']]">
         <assert test="v3:code/@displayName='Patient/Carer Correspondence'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Patient/Carer Correspondence'.</assert>
         <report test="v3:code/@displayName='Patient/Carer Correspondence'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163181000000107 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163181000000107']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144035UK01.PatientCarerCorrespondence'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144035UK01.PatientCarerCorrespondence'.</assert>
         <report test="name(.)='UKCT_MT144035UK01.PatientCarerCorrespondence'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163191000000109 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163191000000109']]">
         <assert test="v3:code/@displayName='Third Party Correspondence'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Third Party Correspondence'.</assert>
         <report test="v3:code/@displayName='Third Party Correspondence'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163191000000109 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163191000000109']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144035UK01.ThirdPartyCorrespondence'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144035UK01.ThirdPartyCorrespondence'.</assert>
         <report test="name(.)='UKCT_MT144035UK01.ThirdPartyCorrespondence'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163021000000107 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163021000000107']]">
         <assert test="v3:code/@displayName='Social and Personal Circumstances'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Social and Personal Circumstances'.</assert>
         <report test="v3:code/@displayName='Social and Personal Circumstances'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163021000000107 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163021000000107']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144036UK01.SocialOrPersonalCircumstance'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144036UK01.SocialOrPersonalCircumstance'.</assert>
         <report test="name(.)='UKCT_MT144036UK01.SocialOrPersonalCircumstance'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163041000000100 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163041000000100']]">
         <assert test="v3:code/@displayName='Lifestyle'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Lifestyle'.</assert>
         <report test="v3:code/@displayName='Lifestyle'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163041000000100 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163041000000100']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144036UK01.LifeStyle' or name(.)='UKCT_MT144036UK01.Smoking' or name(.)='UKCT_MT144036UK01.AlcoholIntake'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144036UK01.LifeStyle' or 'UKCT_MT144036UK01.Smoking' or 'UKCT_MT144036UK01.AlcoholIntake'.</assert>
         <report test="name(.)='UKCT_MT144036UK01.LifeStyle' or name(.)='UKCT_MT144036UK01.Smoking' or name(.)='UKCT_MT144036UK01.AlcoholIntake'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 162951000000105 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162951000000105']]">
         <assert test="v3:code/@displayName='Care Events'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Care Events'.</assert>
         <report test="v3:code/@displayName='Care Events'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 162951000000105 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162951000000105']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144037UK01.CareEvent'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144037UK01.CareEvent'.</assert>
         <report test="name(.)='UKCT_MT144037UK01.CareEvent'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 162991000000102 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162991000000102']]">
         <assert test="v3:code/@displayName='Problems and Issues'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Problems and Issues'.</assert>
         <report test="v3:code/@displayName='Problems and Issues'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 162991000000102 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162991000000102']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144038UK02.Problem'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144038UK01.Problem'.</assert>
         <report test="name(.)='UKCT_MT144038UK02.Problem'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 181331000000109 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='181331000000109']]">
         <assert test="v3:code/@displayName='Link Assertion'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Link Assertion'.</assert>
         <report test="v3:code/@displayName='Link Assertion'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 181331000000109 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='181331000000109']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144039UK02.LinkAssertion' or name(.)='UKCT_MT144039UK02.ProblemMemberAssertion' or name(.)='UKCT_MT144039UK02.ProblemLinkAssertion'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144039UK02.LinkAssertion' or 'UKCT_MT144039UK02.ProblemMemberAssertion' or 'UKCT_MT144039UK02.ProblemLinkAssertion'.</assert>
         <report test="name(.)='UKCT_MT144039UK02.LinkAssertion' or name(.)='UKCT_MT144039UK02.ProblemMemberAssertion' or name(.)='UKCT_MT144039UK02.ProblemLinkAssertion'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 185361000000102 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='185361000000102']]">
         <assert test="v3:code/@displayName='Medication'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Medication'.</assert>
         <report test="v3:code/@displayName='Medication'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 185361000000102 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='185361000000102']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144040UK01.MedicationAdministration' or name(.)='UKCT_MT144040UK01.CurrentRepeatMedication' or name(.)='UKCT_MT144040UK01.AcuteMedication' or name(.)='UKCT_MT144040UK01.DiscontinuedRepeatMedication' or name(.)='UKCT_MT144056UK01.Refusal'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144040UK01.MedicationAdministration' or 'UKCT_MT144040UK01.CurrentRepeatMedication' or 'UKCT_MT144040UK01.AcuteMedication' or 'UKCT_MT144040UK01.DiscontinuedRepeatMedication' or 'UKCT_MT144056UK01.Refusal'.</assert>
         <report test="name(.)='UKCT_MT144040UK01.MedicationAdministration' or name(.)='UKCT_MT144040UK01.CurrentRepeatMedication' or name(.)='UKCT_MT144040UK01.AcuteMedication' or name(.)='UKCT_MT144040UK01.DiscontinuedRepeatMedication' or name(.)='UKCT_MT144056UK01.Refusal'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163241000000109 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163241000000109']]">
         <assert test="v3:code/@displayName='Risks to Care Professional or Third Party'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Risks to Care Professional or Third Party'.</assert>
         <report test="v3:code/@displayName='Risks to Care Professional or Third Party'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163241000000109 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163241000000109']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144041UK01.RiskToPerson'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144041UK01.RiskToPerson'.</assert>
         <report test="name(.)='UKCT_MT144041UK01.RiskToPerson'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163001000000103 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163001000000103']]">
         <assert test="v3:code/@displayName='Diagnoses'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Diagnoses'.</assert>
         <report test="v3:code/@displayName='Diagnoses'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163001000000103 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163001000000103']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144042UK01.Diagnosis' or name(.)='UKCT_MT144048UK02.AllergyDE'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144042UK01.Diagnosis' or 'UKCT_MT144048UK02.AllergyDE'.</assert>
         <report test="name(.)='UKCT_MT144042UK01.Diagnosis' or name(.)='UKCT_MT144048UK02.AllergyDE'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163131000000108 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163131000000108']]">
         <assert test="v3:code/@displayName='Clinical Observations and Findings'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Clinical Observations and Findings'.</assert>
         <report test="v3:code/@displayName='Clinical Observations and Findings'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163131000000108 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163131000000108']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144043UK02.Finding' or name(.)='UKCT_MT144043UK02.FindingOrganizer' or name(.)='UKCT_MT144043UK02.BloodPressure' or name(.)='UKCT_MT144043UK02.Weight' or name(.)='UKCT_MT144043UK02.Height' or name(.)='UKCT_MT144043UK02.Temperature'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144043UK02.Finding' or 'UKCT_MT144043UK02.FindingOrganizer' or 'UKCT_MT144043UK02.BloodPressure' or 'UKCT_MT144043UK02.Weight' or 'UKCT_MT144043UK02.Height' or 'UKCT_MT144043UK02.Temperature'.</assert>
         <report test="name(.)='UKCT_MT144043UK02.Finding' or name(.)='UKCT_MT144043UK02.FindingOrganizer' or name(.)='UKCT_MT144043UK02.BloodPressure' or name(.)='UKCT_MT144043UK02.Weight' or name(.)='UKCT_MT144043UK02.Height' or name(.)='UKCT_MT144043UK02.Temperature'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163051000000102 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163051000000102']]">
         <assert test="v3:code/@displayName='Family History'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Family History'.</assert>
         <report test="v3:code/@displayName='Family History'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163051000000102 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163051000000102']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144044UK01.FamilyHistory'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144044UK01.FamilyHistory'.</assert>
         <report test="name(.)='UKCT_MT144044UK01.FamilyHistory'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163081000000108 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163081000000108']]">
         <assert test="v3:code/@displayName='Investigations'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Investigations'.</assert>
         <report test="v3:code/@displayName='Investigations'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163081000000108 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163081000000108']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144045UK01.Investigation'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144045UK01.Investigation'.</assert>
         <report test="name(.)='UKCT_MT144045UK01.Investigation'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 162961000000108 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162961000000108']]">
         <assert test="v3:code/@displayName='Personal Preferences'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Personal Preferences'.</assert>
         <report test="v3:code/@displayName='Personal Preferences'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 162961000000108 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='162961000000108']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144046UK01.PersonalPreference' or name(.)='UKCT_MT144056UK01.Refusal'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144046UK01.PersonalPreference' or 'UKCT_MT144056UK01.Refusal'.</assert>
         <report test="name(.)='UKCT_MT144046UK01.PersonalPreference' or name(.)='UKCT_MT144056UK01.Refusal'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163031000000109 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163031000000109']]">
         <assert test="v3:code/@displayName='Services, Care Professionals and Carers'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Services, Care Professionals and Carers'.</assert>
         <report test="v3:code/@displayName='Services, Care Professionals and Carers'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163031000000109 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163031000000109']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144047UK01.Service'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144047UK01.Service'.</assert>
         <report test="name(.)='UKCT_MT144047UK01.Service'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163101000000102 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163101000000102']]">
         <assert test="v3:code/@displayName='Provision of Advice and Information to Patients and Carers'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Provision of Advice and Information to Patients and Carers'.</assert>
         <report test="v3:code/@displayName='Provision of Advice and Information to Patients and Carers'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163101000000102 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163101000000102']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144049UK01.ProvisionOfAdviceAndInformation'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144049UK01.ProvisionOfAdviceAndInformation'.</assert>
         <report test="name(.)='UKCT_MT144049UK01.ProvisionOfAdviceAndInformation'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163091000000105 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163091000000105']]">
         <assert test="v3:code/@displayName='Administrative Procedures'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Administrative Procedures'.</assert>
         <report test="v3:code/@displayName='Administrative Procedures'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163091000000105 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163091000000105']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144050UK01.AdministrativeProcedure'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144050UK01.AdministrativeProcedure'.</assert>
         <report test="name(.)='UKCT_MT144050UK01.AdministrativeProcedure'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163221000000102 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163221000000102']]">
         <assert test="v3:code/@displayName='Allergies and Adverse Reactions'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Allergies and Adverse Reactions'.</assert>
         <report test="v3:code/@displayName='Allergies and Adverse Reactions'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163221000000102 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163221000000102']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144053UK02.Allergy' or name(.)='UKCT_MT144056UK01.Refusal'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144053UK02.Allergy' or 'UKCT_MT144056UK01.Refusal'.</assert>
         <report test="name(.)='UKCT_MT144053UK02.Allergy' or name(.)='UKCT_MT144056UK01.Refusal'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163231000000100 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163231000000100']]">
         <assert test="v3:code/@displayName='Risks to Patient'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Risks to Patient'.</assert>
         <report test="v3:code/@displayName='Risks to Patient'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163231000000100 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163231000000100']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144054UK01.RiskToPatient'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144054UK01.RiskToPatient'.</assert>
         <report test="name(.)='UKCT_MT144054UK01.RiskToPatient'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Code 163071000000106 displate name.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163071000000106']]">
         <assert test="v3:code/@displayName='Treatments'">Error : The dsiplay name '<value-of select="v3:code/@displayName"/>' is wrong for the code element, the correct value is 'Treatments'.</assert>
         <report test="v3:code/@displayName='Treatments'">The dsiplay name '<value-of select="v3:code/@displayName"/>' for the code element is correct.</report>
      </rule>
   </pattern>
   <pattern name="Validate CRE Type : 163071000000106 mapping.">
      <rule context="v3:pertinentCREType[child::v3:code[@code='163071000000106']]/v3:component/*[contains(name(self::node()),'UKCT')]">
         <assert test="name(.)='UKCT_MT144055UK01.Treatment'">Error : CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is invalid.The allowed CMETs models are 'UKCT_MT144055UK01.Treatment'.</assert>
         <report test="name(.)='UKCT_MT144055UK01.Treatment'">CMET content '<value-of select="name(.)"/>' found for the given CREType '<value-of select="../../v3:code/@code"/>' is valid</report>
      </rule>
   </pattern>
</schema>