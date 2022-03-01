このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。 <p/>
**このページの実装ガイドは常に修正、追加がある改訂版開発用ページです。**<br/>
**＜Draft Ver.1＞　の固定版は、https://jpfhir.jp/jpcoreV1/ を参照してください。**<p/>

## 概要
ガイダンス: JP Coreでの全体に関わる規則や注意事項を記載しています。
 - [総合ガイダンス](generalGuidance.html)
 - [CardinaryとMust Supportの組み合わせ](MustSupportCardinality.html)
 - [欠損値の扱い](Handlingofnon-existentdata)
 - [文字コード](CharacterEncoding)
 - [検索](Search)

JP Core FHIRコンテンツ: JP Coreで利用するFHIRの詳細について記載をしています。
## Profiles （プロファイル）
---
## Administration （運営管理）
 - [JP Core Patient （患者）プロファイル](Patient)
 - [JP Core Coverage （保険・公費）プロファイル](Coverage)
 - [JP Core Encounter （来院・入院）プロファイル](Encounter)
 - [JP Core Location （所在場所）プロファイル](Location)
 - [JP Core Organization （組織）プロファイル](Organization)
 - [JP Core Practitioner （医療従事者）プロファイル](Practitioner)
 - [JP Core PractitionerRole （医療従事者役割)プロファイル](PractitionerRole)
## Medication （薬剤リスト）
 - [JP Core Medication （薬剤）プロファイル](Medication)
 - [JP Core MedicationRequest （内服・外用薬剤処方）プロファイル](MedicationRequest)
 - [JP Core MedicationRequest Injection （注射薬剤処方）プロファイル](MedicationRequestInjection)
 - [JP Core MedicationDispense （内服・外用薬剤処方調剤・払い出し記録）プロファイル](MedicationDispense)
 - [JP Core MedicationDispense Injection （注射薬剤処方調剤・払い出し記録）プロファイル](MedicationDispenseInjection)
 - [JP Core MedicationAdministration （内服・外用薬剤投与実施情報）プロファイル](MedicationAdministration)
 - [JP Core MedicationAdministration Injection （注射薬剤投与実施情報）プロファイル](MedicationAdministrationInjection)
## Diagnostic （診断）
Observation （検査）
 - [JP Core Observation Common （共通）プロファイル](ObservationCommon)
 - [JP Core Observation LabResult （検体検査結果）プロファイル](ObservationLabResult)
 - [JP Core Observation VitalSigns （バイタルサイン）プロファイル](ObservationVitalSigns)
 - [JP Core Observation BodyMeasurement （身体計測）プロファイル](ObservationBodyMeasurement)
 - [JP Core Observation PhysicalExam （身体所見）プロファイル](ObservationPhysicalExam)
 - [JP Core Observation SocialHistory （生活背景）プロファイル](ObservationSocialHistory)
## ImagingStudy （画像検査）
 - [JP Core ImagingStudy Radiology（放射線検査）プロファイル](ImagingStudyRadiology)
## DiagnosticReport （診断レポート)
 - [JP Core DiagnosticReport Common （共通）プロファイル](DiagnosticReportCommon)
 - [JP Core DiagnosticReport LabResult （検体検査レポート）プロファイル](DiagnosticReportLabResult)
 - [JP Core DiagnosticReport Radiology （放射線検査レポート）プロファイル](DiagnosticReportRadiology2)
## Clinical （診療）
 - [JP Core AllergyIntolerance （アレルギー・不耐症）プロファイル](Allergy)
 - [JP Core Condition （状態）プロファイル](Condition)
 - [JP Core Procedure （処置）プロファイル](Procedure)
## Extensions （拡張）
Profilesにて利用されるExtensionをまとめています。
- [Extensions （拡張）](Extensions)
## Operations and Search Parameters （操作および検索パラメータ）
Profilesにて利用されるSearch Parameter および Operationをまとめています。
- [Operations and Search Parameters （操作および検索パラメータ）](OperationsAndSearchParameters)
## Terminology （用語集）
- [Terminology （用語集）](Terminology)
## CapabilityStatements （機能宣言）
 - [JP Core Server Capability Statement](ServerCapabilityStatement)
 - [JP Core Client Capability Statement](ClientCapabilityStatement)
## Security （セキュリティ）
セキュリティに関する要件を記載しています。
 - [Security （セキュリティ）](Security)



