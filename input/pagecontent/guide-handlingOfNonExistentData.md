### 欠損値（データが存在しない場合）の扱い
---
FHIR®では[JSON](https://www.hl7.org/fhir/json.html#2.6.2)および[XML](https://www.hl7.org/fhir/xml.html)いずれにおいてもオブジェクトは空ではならない。リソース内にエレメントが存在している場合、そのエレメントはそのタイプに応じた何らかのプロパティか1つ以上の拡張を持つ必要がある（[2.6.2 JSON Representation of Resources](https://www.hl7.org/fhir/json.html#:~:text=Objects%20are%20never%20empty), [2.6.1 XML Representation of Resources](https://www.hl7.org/fhir/xml.html#:~:text=FHIR%20elements%20are%20never%20empty)）。string型の値は空文字列であってはならず、そのプロパティが存在するのであれば、1字以上の文字を含む必要がある（[2.24.0.1 Primitive Types](https://www.hl7.org/fhir/datatypes.html#:~:text=strings%20SHOULD%20always%20contain%20non-whitespace)）。

データがない場合に、[Data Absent Reason拡張](https://www.hl7.org/fhir/extension-data-absent-reason.html)を用いて、データが欠損している理由を表すことができる。

JP Core の検索要求するクライアント(Requester)およびサーバ(Responder)は以下の要求を満たすこと **(SHALL)**
#### クライアント(Requster)
---
##### 実装ガイドに準拠するクライアントは、Cardinalityが1以上が付与された要素を含むリソースを受信した場合、エラーを発生させたりアプリケーションを失敗させることなく、それらの値を処理することができなければならない **(SHALL)**。

 **例)**
Readインタラクションの応答として、Cardinalityが１以上の 要素であるPatient.maritalStatus を含むPatient リソースを受信した場合、
要求者はその値をエラーなく処理しなければならない。

```
 {
    "resourceType" : "Patient",
    ...
    "maritalStatus"　:　{
        "coding": [{
            "system": "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus",
            "code": "M",
            "display": "Married"
        }]
    },
    ...
}, 
```

##### 実装ガイドに準拠するクライアントは、欠損データであることを宣言した Cardinalityが1以上のデータ要素を含むリソースインスタンスを処理できなければならない **(SHALL)**。
 **例)**
Patient.birthDateの値に欠損情報が付与されているリソースを、要求者は処理できなければならない。なお、birthDateはdate型というprimitive typeであり、そのextensionは"_"を先頭につけたプロパティに対して設定される([2.6.2.3 JSON representation of primitive elements](https://www.hl7.org/fhir/json.html#primitive))。

```
{
    "resourceType " : "Patient",
    ...
    "_birthDate ": {
        "extension" : [{
            "url " : "http://hl7.org/fhir/StructureDefinition/data-absent-reason",
            "valueCode" : "unknown"
        }]
    },
    ...
} 
```

#### サーバ(Responder)
---

##### 要素の値を保持している場合
JP Core 実装ガイドに準拠するサーバは、当該要素の値を保持している場合には、要求された検索結果のリソースのデータ要素として含めることができるべきである。 **(SHOULD)**

