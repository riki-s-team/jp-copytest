Instance: jp-core-location-address
InstanceOf: SearchParameter
Usage: #definition
* url = "http://jpfhir.jp/fhir/core/SearchParameter/StructureDefinition/jp-core-location-address"
* name = "JPCoreLocationAddress"
* status = #active
* experimental = false
* date = "2021-12-01"
* publisher = "FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)"
* description = "Locationリソースのaddressに関する検索を定義します。"
* code = #address
* base = #Location
* type = #string
* expression = "Location.address"
* xpath = "f:Location/f:address"
* xpathUsage = #normal
* multipleOr = true
* multipleOr.extension.url = $capabilityStatement-expectation
* multipleOr.extension.valueCode = #MAY
* multipleAnd = true
* multipleAnd.extension.url = $capabilityStatement-expectation
* multipleAnd.extension.valueCode = #MAY
* modifier[0] = #missing
* modifier[+] = #exact
* modifier[+] = #contains
* modifier[0].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY
* modifier[+].extension.url = $capabilityStatement-expectation
* modifier[=].extension.valueCode = #MAY