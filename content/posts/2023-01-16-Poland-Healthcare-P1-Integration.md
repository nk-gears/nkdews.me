---
title: 'API Integration Notes for Poland Health & Medical Service P1 Platform— CSIOZ'
author: Nirmal
date: '2023-01-16'

categories:
  - api
tags:
  - csioz
  - poland
slug: /api-integration-notes-for-poland-health-medical-service-p1-platform-csioz
---

The National Centre of Healthcare Information Systems in Poland Proposed a new Electronic Platform named P1 for Collecting, Analysing and Sharing Digital Resources about Medical Events. Accordingly they built a platform named P1 so that healthcare providers can send the data to common platform and it also enables Patient to access their medical data using the official IKP Site.

It’s mandatory that all Health Providers in Poland need to integrate their System with the P1 Platform API Service. In this post i would like to share some of the process involved in integrating these API’s.

The following are the core api’s provided by P1 Platform

- Recepta : Issue New Prescription, Get Prescription Details, Cancel Prescription
- Skierowanie : Issue Referrals, Get Referral details and Cancel Referral
- Medical Events, Index EMR, Exchange EMR : Create New Medical Events including Diagnosis, Procedures and Diagnosis or USB Imaging Documents which can be accessed by authorised other Health Providers.

**P1 Platform Environment**

P1 Platform has a sandbox and production environment. The service endpoints for these 2 environments are slightly different.

- Sandbox : https://isus.ezdrowie.gov.pl/
- Production [https://sus.ezdrowie.gov.pl/](https://isus.ezdrowie.gov.pl/)

Sandbox environment can be accessed only with a valid X509 certificate which can be acquired by the Healthcare Service Provider by registering with P1 Platform. The sandbox url provides the necessary details for the providers to integrate the api with documentation, sample code, utility jar files along with a SOAP XML Test Project. It’s been a hard for non-polish developers to understand these manuals as they don;t provide in english. But a simple google translator service should help to convert these to any local language.

The sample code in the SOAP XML Project uses Java 1.8 but it’s up to the providers choice of choosing their own preferred language for the integration. Since these API’s are based on SOAP and most of the Programming Languages like Java, C#, PHP, Python has good support for SOAP/WSDL Service Consumption by generating the Service Client Code.

The following are some of the standards used by P1

PIK HL7 CDA - Interoperable standardisation of medical documents allowing their processing and their safe exchange between parties

HL7 FHIR - Adopted to create an architecture for a ‘medical event’ as an HL7 FHIR Resource

**IKP Site**

- The IKP Site refers to the patient portal in which the users can access their medical records and history of events including all prescriptions, referrals and medical events. [https://pacjent.gov.pl/ikp](https://pacjent.gov.pl/ikp/historia-leczenia/zdarzenia-medyczne/15758144497)
- During sandbox development, we need to use a separate url to access the details of the sandbox patient. https://iikp.ezdrowie.gov.pl/ikp/zaloguj
- We can also create new patients and issue prescriptions for them. Once a new patient is created we can start issuing prescriptions or referrals or medical events to that sandbox patient.

**SOAP or REST API ?**
Some of the services are provided in SOAP only channel and some services like medical events (fhir compatible API’s) supports both SOAP and REST based API .

All these API’s uses a combination of Certificates and Access token to communicate with the P1 API. Please see below for more details

**X509 Certificates, Credentials and Tokens**

**Common Terminology**

- Individual Practice
- Clinical Practice
- RWPDL
- **OID** — identifiers on Entities and Object references

Let’s deep dive into each of the API Services provided by P1.

**Recepta Workflow & Integration**

- Medical professional issues and digitally signs an e-prescription
- Details sent to P1 in the form of Recepta Package (Pakiet e-recept)
- Patient receives the access code or PIN (4 digit number) to their register Mobile. Patient can also access the data in the IKP
- Only the Medical Profession who issued the prescription can access data.
- Patient Provides the PESEL and PIN to the Pharmacist. Pharmacist verifies the data from P1 and provides the medicine to the Patient.

```
# Recepta Endpoint
# Sandbox
https://isus.ezdrowie.gov.pl/services/ObslugaReceptyWS
# Production
https://sus.ezdrowie.gov.pl/services/ObslugaReceptyWS
```

**Skierowanie Integration**

- Medical Professional Issues and digital signs an e-Referral.
- P1 System verifies the e-referral, stores and generates the code and access key.
- Patient receives the e-referral and can be used in the referred location.
- A used e-referral is marked in the P1 System as ‘completed’ and can not be used to schedule or provide any other healthcare service

```
# Referral Endpoint
# Sandbox
https://sus.ezdrowie.gov.pl/services/ObslugaSkierowaniaWS
# Production
https://sus.ezdrowie.gov.pl/services/ObslugaSkierowaniaWS
```

**Medical Event Integration**

- Each entity providing this service should report themedical event to the e-health system (P1). The medical event package contains the following information.

```
Event Date
Patient's name and pesel
Data of the entity performing medical activity
Medical worker details along with the registered Number
Type of event
The ICD-10 recognition code and the ICD-9 code 
```

All these information are created separately in the form of

- Encounter (visit info)
- Condition
- Procedure
- Provenance (Finally sign all these data and submit to P1)

Note :
The message about the medical event also does not contain information about the e-prescription or e-referral created during the visit, which are sent independently through the SOAP API.

```
# Medical Event - FHIR Based Endpint
# Sandbox
https://isus.ezdrowie.gov.pl/fhir
# Production
https://sus.ezdrowie.gov.pl/fhir
```

**Medicine Database**

- When issuing prescriptions only a valid medicines are accepted. All these medicines will have a unique EAN code. If there are any discrepancy between the EAN and the Medicine name then prescriptions will not be issued.
- When issuing Strong Medicines then the composition of the active substances need to be specified in it.
- Some Prescription can also be marked as urgent (CITO).
- If the medicines has refund then it needs to have the percentage of refund applicable.

**Generating Printable Document
**P1 recommends to use the Transforata library — Conversion of XML Docs to html/pdf format using xsl templates.

```
msxsl.exe 2.16.840.1.113883.3.4424.13.10.1.26-3.xml pl_informacja_o_receptach_1.3.1.xsl -o recepty_pielegniarskie.html kluczPakietu=00010203040506070809101112131415161718192023 kodPakietu=2344 termin="23 maja 2023 godz. 13:00"
```

Please reach out to my Twitter DM @nirmal_kumar for any support or queries on integration.
