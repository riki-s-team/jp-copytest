### JP Core MedicationDispense（内服・外用薬剤処方調剤・払い出し記録）プロファイル

#### 概略
<br>

| 項目           | 内容                                                       |
| -------------- | ---------------------------------------------------------- |
| 定義URL        | http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationDispense |
| バージョン     | 1.0.0                                                      |
| 名前           | JPCoreMedicationDispenseProfile                                   |
| タイトル       | JP Core MedicationDispense Profile                               |
| ステータス     | アクティブ（2021-08-26）                                   |
| 定義           | このプロファイルはMedicationDispenseリソースに対して、内服・外用薬剤処方調剤・払い出し記録のデータを送受信するための基礎となる制約と拡張を定めたものである。 |
| 公開者         | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI) |
| Copyright      | FHIR® Japanese implementation research working group in Japan Association of Medical Informatics (JAMI)  |
| ソースリソース | https://simplifier.net/jp-core-draftv1/jpmedicationdispense |

<br>

このプロファイルは内服、外用の薬剤処方の調剤情報をMedicationDispenseリソースを使用して表現する。薬剤処方は指示する項目、使用する用語集、プロセスなどにおいて諸外国と日本では異なっており、日本国内で規格を運用するためにExtensionの追加や用語集の追加・変更を行った。現在、日本での処方関連規格として利用されているJAHIS 処方データ交換規約 Ver 3.0C、JAHIS電子版お薬手帳データフォーマット仕様書Ver.2.4を参考にした。
以下、このプロファイルのMedicationDispenseリソースを「JP Core MedicationDispenseリソース」と呼ぶ。

薬剤処方のFHIR仕様に関しては、先行事例として令和２年度厚⽣労働科学特別研究事業「診療情報提供書, 電⼦処⽅箋等の電⼦化医療⽂書の相互運⽤性確保のための標準規格の開発研究」研究班で策定された「電子処方箋HL7 FHIR記述仕様書案」（https://std.jpfhir.jp/ ）があるが、その中で院外処方以外でも利用できる仕様については可能な限り取り入れるようにした。ただし、拡張のURLは新たにJP Coreの命名規則に基づいて命名している。

##### 背景および想定シナリオ
このプロファイルは、以下のようなユースケースを想定している。

- 医療機関内の薬剤部門システムや調剤薬局のシステムから特定の患者の処方調剤情報を検索する
- 電子処方箋において院外処方箋の調剤情報を記述する

##### スコープ
###### 対象
このプロファイルの対象は内服、外用の一般的な薬剤処方の調剤情報を電子的に連携するためのメッセージを記述することである。

###### 対象としないこと
このプロファイルは内服、外用の薬剤に関するものであり、注射薬剤については対象としない。注射薬剤は、指示の仕方や指示する項目が内服、外用とは大きく異なるため、別のプロファイルとして記述することとする。

また、このプロファイルのMedicationDispenseリソースは薬剤の調剤に関するものであり、指示（オーダー）、内服確認や実施記録は対象としない。それぞれ、MedicationRequest, MedicationAdministrationが対応するリソースである。

#### 関連するプロファイル
JP Core MedicationDispenseリソースは、以下のリソースから直接参照される。

- JP Core Observationリソース

JP Core MedicationDispenseリソースは、以下のリソースを直接参照する。

- JP Core Patientリソース
- JP Core Encounterリソース
- JP Core Practitionerリソース
- JP Core PractitionerRoleリソース
- JP Core Organizationリソース
- JP Core Coverageリソース
- JP Core MedicationRequestリソース
- JP Core Medicationリソース
