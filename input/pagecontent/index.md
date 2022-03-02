このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。 <br/>
**このページの実装ガイドは常に修正、追加がある改訂版開発用ページです。**

### 概要
ガイダンス: JP Coreでの全体に関わる規則や注意事項を記載しています。
* [総合ガイダンス](generalGuidance.html)
* [CMust SupportとCardinality(多重度)のルール](mustSupportCardinality.html)
* [欠損値の扱い](handlingOfNonExistentData.html)
* [文字コード](characterEncoding.html)
* [検索](stringSearch.html)

### JP Core FHIRコンテンツ
JP Coreで利用するFHIRの詳細について記載をしています。

#### Profiles （プロファイル）
JP Core FHIRコンテンツ: JP Coreで利用するFHIRの詳細について記載をしています。
* [Administrationグループ （運営管理）](group-administration.html)
  * [JP Core Patient （患者）プロファイル]
  * [JP Core Coverage （保険・公費）プロファイル]
  * [JP Core Encounter （来院・入院）プロファイル]
  * [JP Core Location （所在場所）プロファイル]
  * [JP Core Organization （組織）プロファイル]
  * [JP Core Practitioner （医療従事者）プロファイル]
  * [JP Core PractitionerRole （医療従事者役割)プロファイル]
* [Medicationグループ （薬剤リスト）](group-medication.html)
  * [JP Core Medication （薬剤）プロファイル]
  * [JP Core MedicationRequest （内服・外用薬剤処方）プロファイル]
  * [JP Core MedicationRequest Injection （注射薬剤処方）プロファイル]
  * [JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル]
  * [JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル]
  * [JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル]
  * [JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル]
* [Diagnosticグループ （診断）](group-diagnostic.html)
  * Observation （検査）
    * [JP Core Observation Common （共通）プロファイル]
    * [JP Core Observation LabResult （検体検査結果）プロファイル]
    * [JP Core Observation VitalSigns （バイタルサイン）プロファイル]
    * [JP Core Observation BodyMeasurement （身体計測）プロファイル]
    * [JP Core Observation PhysicalExam （身体所見）プロファイル]
    * [JP Core Observation SocialHistory （生活背景）プロファイル]
  * ImagingStudy （画像検査）
    * [JP Core ImagingStudy Radiology（放射線検査）プロファイル]
  * DiagnosticReport （診断レポート)
    * [JP Core DiagnosticReport Common （共通）プロファイル]
    * [JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル]
    * [JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル]
* [Clinicalグループ（診療）](group-clinical.html)
  * [JP Core AllergyIntolerance （アレルギー不耐症）プロファイル]
  * [JP Core Condition （状態）プロファイル]
  * [JP Core Procedure （処置）プロファイル]

#### Extensions （拡張）
Profilesにて利用されるExtensionをまとめています。
- [Extensions （拡張）](Extensions)

#### Operations and Search Parameters （操作および検索パラメータ）
Profilesにて利用されるSearch Parameter および Operationをまとめています。
- [Operations and Search Parameters （操作および検索パラメータ）](OperationsAndSearchParameters)

#### Terminology （用語集）
- [Terminology （用語集）](Terminology)

### CapabilityStatements （機能宣言）
 - [JP Core Server Capability Statement](ServerCapabilityStatement)
 - [JP Core Client Capability Statement](ClientCapabilityStatement)

### Security （セキュリティ）
セキュリティに関する要件を記載しています。
 - [Security （セキュリティ）](security.html)

{% include markdown-link-references.md %}



