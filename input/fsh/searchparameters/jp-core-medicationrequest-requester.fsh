Instance: jp-core-medicationrequest-requester
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-medicationrequest-requester"
* name = "JPCoreMedicationRequestrRequester"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "MedicationRequestリソースのrequesterに関する検索を定義します。"
* code = #requester
* base = #MedicationRequest
* type = #reference
* expression = "MedicationRequest.requester"
* xpath = "f:MedicationRequest/f:requester"
* xpathUsage = #normal
* target[0] = #Practitioner
* target[+] = #PractitionerRole
* target[+] = #Organization
* target[+] = #Patient
* target[+] = #RelatedPerson
* target[+] = #Device
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