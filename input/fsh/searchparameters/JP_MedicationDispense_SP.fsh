Instance: jp-medicationdispense-code
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-code"
* name = "JPMedicationDispenseCodeSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのCode(薬品コード)に関する検索を定義します。"
* code = #code
* base = #MedicationDispense
* type = #token
* expression = "(MedicationDispense.​medication as CodeableConcept)"
* xpath = "f:MedicationDispense/f:medication"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #below
* modifier[+] = #above
* modifier[+] = #ofType
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-medicationdispense-encounter
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-encounter"
* name = "JPMedicationDispenseEncounterSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのEncounter(来院・入院)に関する検索を定義します。"
* code = #encounter
* base = #MedicationDispense
* type = #reference
* expression = "MedicationDispense.context.where(resolve() is Encounter)"
* xpath = "f:MedicationDispense/f:context"
* xpathUsage = #normal
* target = #Encounter
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-medicationdispense-identifier
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-identifier"
* name = "JPMedicationDispenseIdentifierSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのidentifierに関する検索を定義します。"
* code = #identifier
* base = #MedicationDispense
* type = #token
* expression = "MedicationDispense.identifier"
* xpath = "f:MedicationDispense/f:identifier"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #text
* modifier[+] = #not
* modifier[+] = #in
* modifier[+] = #not-in
* modifier[+] = #below
* modifier[+] = #above
* modifier[+] = #ofType
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-medicationdispense-patient
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-patient"
* name = "JPMedicationDispensePatientSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのpatient(患者)に関する検索を定義します。"
* code = #patient
* base = #MedicationDispense
* type = #reference
* expression = "MedicationDispense.subject.where(resolve() is Patient)"
* xpath = "f:MedicationDispense/f:subject"
* xpathUsage = #normal
* target = #Patient
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY


Instance: jp-medicationdispense-performer
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-performer"
* name = "JPMedicationDispensePerformerSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのperformerに関する検索を定義します。"
* code = #performer
* base = #MedicationDispense
* type = #reference
* expression = "MedicationDispense.performer.actor"
* xpath = "f:MedicationDispense/f:performer/f:actor"
* xpathUsage = #normal
* target[0] = #Practitioner
* target[+] = #PractitionerRole
* target[+] = #Organization
* target[+] = #Patient
* target[+] = #Device
* target[+] = #RelatedPerson
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #type
* modifier[+] = #identifier
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* chain[0] = "identifier"
* chain[+] = "name"
* chain[0].extension.url = $capabilityStatement-expectation
* chain[=].extension.valueCode = #SHALL
* chain[+].extension.url = $capabilityStatement-expectation
* chain[=].extension.valueCode = #SHALL


Instance: jp-medicationdispense-whenhandedover
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-whenhandedover"
* name = "JPMedicationDispenseWhenHandedOverSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのWhenHandedOver(払い出し日時)に関する検索を定義します。"
* code = #whenhandedover
* base = #MedicationRequest
* type = #date
* expression = "MedicationDispense.whenHandedOver"
* xpath = "f:MedicationDispense/f:whenHandedOver"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #SHOULD
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
* comparator[0].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* modifier = #missing
* modifier.extension.url = $capabilityStatement-expectation
* modifier.extension.valueCode = #MAY


Instance: jp-medicationdispense-whenprepared
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-medicationdispense-whenprepared"
* name = "JPMedicationDispenseWhenPreparedSP"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationDispenseリソースのWhenPrepared(準備管理用日時)に関する検索を定義します。"
* code = #whenprepared
* base = #MedicationRequest
* type = #date
* expression = "MedicationDispense.whenPrepared"
* xpath = "f:MedicationDispense/f:whenPrepared"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #SHOULD
* comparator[0] = #eq
* comparator[+] = #ne
* comparator[+] = #gt
* comparator[+] = #lt
* comparator[+] = #le
* comparator[+] = #sa
* comparator[+] = #eb
* comparator[+] = #ap
* comparator[0].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #SHALL
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* comparator[+].extension.url = $capabilityStatement-expectation
* comparator[=].extension.valueCode = #MAY
* modifier = #missing
* modifier.extension.url = $capabilityStatement-expectation
* modifier.extension.valueCode = #MAY


