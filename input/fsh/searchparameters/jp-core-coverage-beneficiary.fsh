Instance: jp-core-coverage-beneficiary
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-coverage-beneficiary"
* name = "JPCorecoverageBeneficiary"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "Coverageリソースのbeneficiaryに関する検索を定義します。"
* code = #beneficiary
* base = #Coverage
* type = #reference
* expression = "Coverage.beneficiary"
* xpath = "f:Coverage/f:beneficiary"
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