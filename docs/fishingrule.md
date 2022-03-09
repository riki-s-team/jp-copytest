# JP Core FHIR Shorthand記載時ルール事項(案)

## 1. フォルダ構成
 フォルダ構成は下記の通り
```ruby
(project root)
├─.github #githubに関するシステムファイル
├─custom-template #IG Publisher用テンプレート
├─docs #github説明用ファイル
└─input #入力フォルダ
   ├─fsh #FHIR Shorthandファイル格納フォルダ
   │  ├─capablitystatements #capablity statement用
   │  ├─codesystems #code system用
   │  ├─others #その他
   │  ├─profiles #profile,extension用
   │  ├─searchparameters #search parameter
   │  └─valuesets #values
   ├─includes #link file
   ├─intro-notes #profileの前後説明文(-intro.md, -notes.md)
   ├─pagecontent #Markdown Page
   └─resources #resource
```
## 名称ルール

### 1. ID命名規則
#### 形式
Kabab Case形式(小文字) [ **aaa-bbb-ccc** ]を採用する。<br/>
正規表現 : ``` ([a-z]|[-])+ ```

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile | jp-{profile} <br/>`jp-patient`|  |
| extension | jp-{profile}-{element}-{extension} <br/>`jp-medicationrequest-dispenserequest-expectedrepeatcount` <br/>64文字を超える場合は、**{element}-** を省略可能とする |
| datetype | jp-{datatype} <br/>`jp-humanname `| |
| search parameter | jp-{profile}-{parameter}-sp <br/>`jp-patient-birthdate-sp` | |
| capblity statement | jp-{actor}-capablitystatement <br/>`jp-client-capablitystatement` |
| codesytesm | jp-{codesystem}-cs <br/> `jp-gender-cs` |
| valueset | jp-{valueset}-vs <br/> `jp-gender-vs` |


### 2. ファイル配置＆命名規則
#### 形式
IDをSnake Case形式(小文字) [ **aaa_bbb_ccc.fsh** ]に変換する。<br/>
正規表現 : ``` ([a-z]|[_])+.fsh ```

| 項目 | ルール | 備考 |
| --- | --- | --- |
| profile<br/>extension| profiles/{[snake]Profile ID}.fsh | profileおよびextensionは1ファイル集約 |
| datatype | others/{[snake]DateType ID}.fsh | |
| operation | others/{[snake]Operation ID}.fsh |  |
| search parameter| searchparamters/{[snake]Profile ID}_sp.fsh | postfixとして **[_sp]** があるのを注意。1ファイル集約 |
| codesystem | codesystems/{[snake]CodeSystem ID}.fsh | |
| valueset | valuesets/{[snake]ValueSet ID}.fsh | |

#### サンプル

```
# profile, extension
.\input\fsh\profiles\jp_patient.fsh

# datatype
.\input\fsh\others\jp_humanname.fsh

# search parameter
.\input\fsh\searchparameters\jp_patient_sp.fsh

# code system
.\input\fsh\codesytems\jp_gender_cs.fsh

# value set
.\input\fsh\valuesets\jp_gender_vs.fsh
```


### 3. URL定義形式
接頭語 **http://jpfhir.jp/fhir/core**, **http://jpfhir.jp/fhir/Common**

| 項目 | ルール <br/> `(例)`  |
| --- | --- | 
| profile, <br/>datatype | http://jpfhir.jp/fhir/core/StructureDefinition/{id} <br/>`http://jpfhir.jp/fhir/core/StructureDefinition/jp-patient`| 
| extension | http://jpfhir.jp/fhir/core/Extension/StructureDefinition/{id}<br/> `http://jpfhir.jp/fhir/core/Extension/StructureDefinition/jp-patient-race`|
| search<br/>parameter | http://jpfhir.jp/fhir/core/SearchParameter/{id} <br/>`http://jpfhir.jp/fhir/core/SearchParameter/jp-patient-birthdate-sp` | |
| capblity<br/>statement | http://jpfhir.jp/fhir/core/CapabilityStatement/{id} <br/>`http://jpfhir.jp/fhir/core/CapabilityStatement/jp-client-capabilitystatement` |
| codesystem | http://jpfhir.jp/fhir/Common/CodeSystem/{id} <br/>`http://jpfhir.jp/fhir/Common/CodeSystem/jp-gender-cs` |
| valueset | http://jpfhir.jp/fhir/Common/ValueSet/{id} <br/>`http://jpfhir.jp/fhir/Common/ValueSet/jp-gender-vs` |

### 4. Name命名規則
IDをKebab Case形式 → Pascal Case形式に変換する。(全ての項目共通)<br/>省略語は英大文字とする
``` 
JPPatientBirthdateSP
```

### 5. Title命名規則
NameをSpace Separator形式に変換する。(全ての項目共通)<br/>省略語は英大文字とする
``` 
JP Patient Birthdate SP
```

## 除外項目
以下の項目はsushi-config.yamlの定義が展開されるため、.fshファイルでは定義しないこと。

* version (バージョン)
* copyright (コピーライト)
* publisher (公開者)
* contract (契約者)
* licese (ライセンス)
* jurisdiction (管轄)

記載すると対象だけが別物として定義されるため、sushi-config.yamlの更新対象とならないため、注意すること。

## Must Support
JP Coreでは定義しない。（※日本国内のベースで派生先の制約を少なくしたいため）<br/>JP Coreの派生先での利用を想定している。

## コメント記載
以下のようにファイル内にグループがある場合、コメントにて区切りを入れ、グループが分かるようにすること。
```
// ==============================
//   Extension 定義
// ==============================

(　~　prifile記載　~　)

// ==============================
//   Extension 定義
// ==============================

(　~　extension記載　~　)
```