// ==============================
//   Profile 定義
// ==============================
Profile: JP_MedicationRequestBase
Parent: MedicationRequest
Id: JP-MedicationRequestBase
Title: "JP_MedicationRequestBase"
Description: "このプロファイルはユーザは直接適用するものではなく、JP_MedicationRequestとJP_MedicationRequestInjectionの共通の親となる抽象プロファイルである。MedicationRequestリソースに対して、内服・外用薬剤処方、注射・点滴などのデータを送受信するため、JP_MedicationRequestとJP_MedicationRequestInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
// extension 参照宣言 基底拡張2個、内部拡張1個
* extension contains JP_MedicationDispense_Preparation named Preparation 0..*
* dosageInstruction.extension contains
    JP_MedicationRequest_DosageInstruction_UsageDuration named UsageDuration 0..1 and
    JP_MedicationRequest_DosageInstruction_PeriodOfUse named PeriodOfUse 0..1 and
    JP_MedicationRequest_DosageInstruction_Line named Line 0..* and
    JP_MedicationRequest_DosageInstruction_Device named Device 0..*
//* ^meta.versionId = "1"
* ^meta.lastUpdated = "2022-01-05T07:41:37.927+00:00"
* ^url = "http://jpfhir.jp/fhir/core/StructureDefinition/JP_MedicationRequestBase"
* ^status = #draft
* ^date = "2022-03-07"
* ^purpose = "このプロファイルはユーザは直接適用するものではなく、JP_MedicationRequestとJP_MedicationRequestInjectionの共通の親となる抽象プロファイルである。MedicationRequestリソースに対して、内服・外用薬剤処方、注射・点滴などのデータを送受信するため、JP_MedicationRequestとJP_MedicationRequestInjectionの各プロファイルの基礎となる制約と拡張のうち共通部分を定めている。"
* . ^short = "患者あるいはグループに対しての薬剤処方オーダ"
* . ^definition = "患者への薬の供給と内服指示を共に提供するオーダ。ケアプランやワークフローパターンとハーモナイズし、入院や外来でも使えるようにするため、このリソースは\"MedicationPrescription\"や\"MedicationOrder\"ではなく、\"MedicationRequest\"と呼ばれる。"
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^short = "外部から参照されるID"
* identifier ^definition = "このインスタンスが外部から参照されるために使われるIDである。処方箋全体としてのIDとしては使用しない。\r\n処方箋内で同一の用法をまとめて表記されるRp番号はこのIdentifier elementの別スライスで表現する。それ以外に任意のIDを付与してもよい。\r\nこのIDは業務手順によって定められた処方オーダーに対して、直接的なURL参照が適切でない場合も含めて関連付けるために使われる。この業務手順のIDは実施者によって割り当てられたものであり、リソースが更新されたりサーバからサーバに転送されたとしても固定のものとして存続する。"
* identifier ^comment = "これは業務IDであって、リソースに対するIDではない。"
* identifier contains
    RpNumber 1..1 and
    OrderInRp 1..1 and
    RequestIdentifier 0..*
* identifier[RpNumber] ^short = "処方箋内部の剤グループとしてのRp番号"
* identifier[RpNumber] ^definition = "処方箋内で同一用法の薬剤を慣用的にまとめて、Rpに番号をつけて剤グループとして一括指定されることがある。このスライスでは剤グループに対して割り振られたRp番号を記録する。"
* identifier[RpNumber] ^comment = "剤グループに複数の薬剤が含まれる場合、このグループ内の薬剤には同じRp番号が割り振られる。"
* identifier[RpNumber].use ..0
* identifier[RpNumber].type ..0
* identifier[RpNumber].system 1..
* identifier[RpNumber].system = "urn:oid:1.2.392.100495.20.3.81" (exactly)
* identifier[RpNumber].system ^short = "【JP-CORE】Rp番号(剤グループ番号)についてのsystem値"
* identifier[RpNumber].system ^definition = "【JP-CORE】ここで付番されたIDがRp番号であることを明示するためにOIDとして定義された。urn:oid:1.2.392.100495.20.3.81で固定される。"
* identifier[RpNumber].value 1..
* identifier[RpNumber].value ^short = "【JP-CORE】Rp番号(剤グループ番号)"
* identifier[RpNumber].value ^definition = "【JP-CORE】Rp番号(剤グループ番号)。\"1\"など。"
* identifier[RpNumber].value ^comment = "【JP-CORE】value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[RpNumber].period ..0
* identifier[RpNumber].assigner ..0
* identifier[OrderInRp] ^short = "【JP-CORE】同一RP番号（剤グループ）での薬剤の表記順"
* identifier[OrderInRp] ^definition = "【JP-CORE】同一剤グループでの薬剤を表記する際の順番。XML形式と異なりJSON形式の場合、表記順は項目の順序を意味しない。したがって、薬剤の記載順を別に規定する必要があるためIDを用いて表現する。"
* identifier[OrderInRp] ^comment = "【JP-CORE】同一剤グループ内での薬剤の順番を1から順の番号で示す。"
* identifier[OrderInRp].use ..0
* identifier[OrderInRp].type ..0
* identifier[OrderInRp].system 1..
* identifier[OrderInRp].system = "urn:oid:1.2.392.100495.20.3.82" (exactly)
* identifier[OrderInRp].system ^short = "【JP-CORE】RP番号内（剤グループ内）の連番を示すsystem値"
* identifier[OrderInRp].system ^definition = "剤グループ内番号の名前空間を識別するURI。固定値urn:oid:1.2.392.100495.20.3.82"
* identifier[OrderInRp].value 1..
* identifier[OrderInRp].value ^short = "【JP-CORE】RP番号内（剤グループ内）の連番"
* identifier[OrderInRp].value ^definition = "剤グループ内連番。"
* identifier[OrderInRp].value ^comment = "【JP-CORE】value は string型であり、数値はゼロサプレス、つまり、'01'でなく'1'と指定すること。"
* identifier[OrderInRp].period ..0
* identifier[OrderInRp].assigner ..0
* identifier[RequestIdentifier] ^short = "処方オーダーに対するID"
* identifier[RequestIdentifier] ^definition = "薬剤をオーダーする単位としての処方箋に対するID。MedicationRequestは単一の薬剤でインスタンスが作成されるが、それの集合としての処方箋のID。"
* identifier[RequestIdentifier] ^min = 0
* identifier[RequestIdentifier].system 1..
* identifier[RequestIdentifier].system = "http://jpfhir.jp/fhir/Common/IdSystem/resourceInstance-identifier" (exactly)
* status = #draft (exactly)
* status ^definition = "JP coreでは\"active\"に固定される。\r\nオーダーの現在の状態を示すコード。一般的には active か completed の状態であるだろう。"
* status ^comment = "このエレメントはmodifierとされている。StatusとはこのResourceが現在妥当な状態ではないことも示すからである。"
* status ^isModifierReason = "このエレメントは modifier である。Statusエレメントが entered-in-error という正当な情報として扱うべきではない状態の値も取り得るからである。"
* statusReason ^short = "現状の理由"
* statusReason ^definition = "現在のステータスの理由"
* statusReason ^comment = "一般的には「保留(suspended)」や「中止(cancelled)」といった例外的状態を示すために持ちいられる。MedicationRequestオーダーが発生した理由についてはreaseonCodeに記載され、この項目は用いられない。"
* intent = #order (exactly)
* intent ^definition = "JP coreでは \"order\" に固定される。\r\n投薬リクエストの意図 が提案(proposal)、計画(plan)、あるいは他の要求によるものかを示す。"
* intent ^comment = "処方をオーダーする場合、MedicationRequestのどの段階でオーダーしたのかについて、この項目を指定することが期待される。たとえば、proposalであれば患者、関係者、医師あるいは機器からの提案として作成される。\"plan\"であれば、医師、患者、関係者そして機器からの提案として生成される。\"original-order\"は医師にしか作成できない。\r\n\r\ninstance-orderはリクエストあるいはオーダーをインスタンス化する段階であり、MedicationAdministrationレコードにも使われる。\r\r\nintentはこのresourceが実際に適応される時に変化するため、このエレメントはmodifierとしてラベルされる。"
* intent ^isModifierReason = "このエレメントは全ての記述的な属性の解釈を変える。たとえば、「リクエストすることが推奨される時間」と「リクエストすることが承認された時間」、あるいは「リクエストすることが推奨される人」と「リクエストすることが承認された人」など"
* category ^short = "薬剤使用区分"
* category ^definition = "このMedicationRequest Resourceが使用される区分を示す。日本では「院外」「院内」「入院」「外来」などの区分を想定する。\r\n一般的には、外来や入院などどこでこの薬剤が投与、内服されるかを想定した区分である。\r\n処方病棟や処方した診療科をOrganization resourceで表現することが冗長である場合にはこの区分が用いられることもある。\r\n\r\nHL7 FHIRではvalue setとして http://terminology.hl7.org/CodeSystem/medicationrequest-category がデフォルトで用いられるが、日本での使用の場合持参薬をカバーする必要があり、JAHIS処方データ規約V3.0Cに記載されているMERIT-9処方オーダ表7とJHSP0007表を組み合わせて持ちいることとする。"
* category ^comment = "薬剤が投与あるいはその他の用途で利用されると想定される場面についての区分である。"
* category ^binding.strength = #example
* category ^binding.description = "MedicationRequest Resourceの区分を示すコード化された概念。たとえば、どこで服薬あるいは投与されるか、治療の種別はどうかについて。FHIRでは"
* priority ^definition = "このMedicatinRequestオーダーの優先度。他のオーダーと比較して表現される。"
* priority ^comment = "FHIRでは文字列の大きさが1MBを超えてはならない(SHALL NOT)。"
* doNotPerform ^short = "要求が禁止された行為であればTrue"
* doNotPerform ^definition = "このオーダーが実施していけないものであればTrueを表示される"
* doNotPerform ^comment = "もし、doNotPerformに指定がなければ、オーダーは実施してもよいものである。(たとえば、「実施せよ」)"
* doNotPerform ^isModifierReason = "このエレメントは実施すべきオーダーを否定するものであるため、このエレメントはmodifierとされている。（たとえば、この薬剤オーダーが不適切なものであったり初歩宇部着物ではない場合)"
* reported[x] ^short = "初期記録にはない報告"
* reported[x] ^definition = "このレコードは元々の一次記録から報告されたものか、二次的に「報告された」資料から取り込まれたものかを示す。報告の情報源についても示される。"
* medication[x] only CodeableConcept
* medication[x] MS
* medication[x] ^short = "投与される薬剤"
* medication[x] ^definition = "医薬品コードと医薬品名称。coding要素を繰り返すことでHOT9 やYJコードなど複数のコード体系で医薬品コード並記することが可能。\r\n薬される薬剤についてのID。JP Coreでは内服処方箋で使用されるMedicationRequestではcodeableConceptのみを使用する。"
* medication[x] ^comment = "日本での運用を検討した場合に、煩雑ではあるがMedication resourceを参照するのではなくcodeableConceptとして1薬剤ごとにMedicationRequestインスタンスを生成する方針とした。\r\n\r\nコードだけが指定されていても、製品を特定できる必要がある。もし、多くの情報が必要であれば、Medication Resourceを利用することが推奨される。たとえば、もし、薬剤の剤型や、ロット番号を知る必要があったり、薬剤の成分や臨時で調整されたものであったりする場合には、Medication Resourceを参照しなくてはならない。\r\n 【JP-CORE】 ひとつのtext要素と、複数のcoding 要素を記述できる。処方オーダ時に選択または入力し、実際に処方箋に印字される文字列を必ずtext要素に格納した上で、それをコード化した情報を1個以上のcoding 要素に記述する。\r\n厚生労働省標準であるHOT9コード（販社指定が不要な場合にはHOT7コード）または広く流通しているYJコードを用いるか、一般名処方の場合には厚生労働省保険局一般名処方マスタのコードを使用して、Coding要素（コードsystemを識別するURI、医薬品のコード、そのコード表における医薬品の名称の3つからなる）で記述する。\r\nなお、上記のいずれの標準的コードも付番されていない医薬品や医療材料の場合には、薬機法の下で使用されているGS1標準の識別コードであるGTIN(Global Trade Item Number)の調剤包装単位（最少包装単位、個別包装単位）14桁を使用する。\r\nひとつの処方薬、医療材料を複数のコード体系のコードで記述してもよく、その場合にcoding 要素を繰り返して記述する。 ただし、ひとつの処方薬を複数のコードで繰り返し記述する場合には、それらのコードが指し示す処方薬、医療材料は当然同一でなければならない。 また、処方を発行した医療機関内でのデータ利用のために、医療機関固有コード体系によるコード（ハウスコード、ローカルコード）の記述を含めてもよいが、その場合でも上述したいずれかの標準コードを同時に記述することが必要である。"
* medication[x] ^binding.strength = #preferred
* medication[x] ^binding.description = "処方する製剤を表すコード。"
* medication[x].id ^short = "エレメント間参照のためのユニークID"
* medication[x].id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* medication[x].coding 1..
* medication[x].coding ^short = "医薬品を表すコード"
* medication[x].coding ^definition = "医薬品を表すコード。JP Coreでは最低1個のコードを記録しなければならない。\r\n利用できるコードは下記の通りである。\r\n医薬品コード（医薬品マスター）\r\n薬価基準収載医薬品コード\r\nYJコード\r\nHOT コード（9 桁）\r\n⼀般名処⽅マスター"
* medication[x].coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。\r\n【JP-CORE】Medication要素の説明を参照のこと。"
* medication[x].coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* medication[x].coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* medication[x].coding.userSelected ^comment = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* medication[x].text ^short = "この概念のプレーンテキスト表現"
* medication[x].text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* medication[x].text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* subject only Reference(Patient)
* subject MS
* subject ^short = "処方箋が発行された対象(個人あるいはグループ)"
* subject ^definition = "JP Coreでは患者を表すPatientリソースへの参照。\r\n一般には薬剤が投与される対象となる人（あるいはグループ)を表現するResourceに対するリンク。"
* subject ^comment = "処方オーダーの対象は必須項目である。\r\n二次利用のためにどこに実際の対象がいるのかについての情報は提供されない。特定の対象に対して匿名化することも必要である。"
* subject.id ^short = "内部エレメントを参照するためのユニークID"
* subject.id ^definition = "リソース内のエレメントを参照（内部参照）するためのユニークなID。空白を含まなければどのような文字列であってもよい。"
* subject.reference 1..
* subject.reference ^short = "文字列による参照、関係、内部あるいは絶対URL"
* subject.reference ^definition = "対象となる患者を表すPatient resourceへの参照である。PatientリソースのfullUrl要素に指定されるUUID を指定すること\r\n一般には他のResourceが存在する場所への参照。参照はサービスのベースURLに対する相対的なものや、リソースがある場所を示す絶対的URLであることもある。参照はバージョンを指定していることもあればそうでないこともある。もし参照が、FHIRのRESTfulサーバ以外を対象としていれば、それはバージョンが指定されているべきである。分割された内部参照('#'で始まる)の場合は内部に含まれるResourceへの参照である。"
* subject.reference ^comment = "絶対URLを使えば安定してクラウドやWeb上にスケーラブルな対応をすることができる。一方で、相対・論理参照を使えば閉鎖されたエコシステム内部に適した柔軟な対応ができる。絶対URLをはFHIRリソースのRESTfulサーバを指定するために必要となるわけではないが、より推奨される方法である。もし、URLが\"/[type]/[id]\"で構成されていれば、FHIRのRESTfulサーバへの参照を想定していると推測することもできる。"
* subject.type ^short = "参照先の型(Patient)"
* subject.type ^definition = "参照されるPatientが型として示される。\r\n一般的には参照の対象として予定される型。もし、Reference.typeとReference.referenceがともに指定されていて、Reference.referenceがFHIRのURLであればどちらも一致させるべきである(SHALL)。\n\r\n型はResouce Definitionに対するCanonical URLであってその型も参照の対象となる。Referenceはhttp://hl7.org/fhir/StructureDefinition/に対する相対URLである。たとえば、\"Patient\"はhttp://hl7.org/fhir/StructureDefinition/Patientへの参照である。絶対URLは論理モデルにおいて、論理モデル内部での参照として飲み使用可能であり、Resouceに対しては指定できない。"
* subject.type ^comment = "このelementは参照の対象の型を指定するためのものである。他のElementで指定されていた型であってもなくても指定することができる。場合によっては、対象の型は参照（たとえば、RESTful URL)についての調査により決定されることもあるし、参照の対象から決定されることもある。もし、参照と型のどちらもが指定されていたら、参照は指定された型を決定されるべきである(SHALL)。"
* subject.identifier ^short = "文字列による参照が不明な場合の論理参照"
* subject.identifier ^definition = "対象となるresouceへのID。FHIRサーバを経由してこの参照が指定するEntityが指定できないか、実際の位置を示す既知のIDへとResourceを変換できない場合のように、ほかのresourceを直接参照することができない場合に使われる。Reference.identifireがFHIRインスタンスである何かを実際に示している必要はないが、FHIRインスタンスとして表現されると想定される業務概念を示されなくてはらならず(SHALL)、そのインスタンスは参照先のFHIRのResource型である必要がある。"
* subject.identifier ^comment = "IDが参照として与えられている場合には、参照を処理するシステムはIDをIDが利用される業務コンテキストがわかっているかどうか参照を解決するためにしか利用することができない。このIDはグローバル(たとえば国民ID）であることもあるが、そうでないこともある。そのため、この参照を利用する有効な機構（たとえば、データを連鎖させたり、包含させるなど）、サーバが参照を解決することができるとも期待できない。サーバは到達できなかったり、解決できないあるいは拒否されるような参照でもIDとして受け取ることができる。CapabilityStatement.rest.resource.referencePolicyを参照のこと。\r\n\r\nIDと正確な参照が共に提供されている場合は、正確な参照が優先される。Resourceを処理するアプリケーションも許容されるがIDが正確な参照と一致することを確認することは求められてない。\r\n\r\nアプリケーションは論理参照を正確な参照へとコンバートする際に、実際に示している論理参照を外したり、削除してもよい。\r\n\r\n参照はFHIRのResourceとして表現することができる構造となるように示されているが、アプリケーションが参照の対象について検索することを求めていない限り、実際にFHIR Resourceのインスタンスが存在していなくてもよい。IDを参照しているコンテンツは、どのリソースの型が限定的に許容されるか明示されていなくても論理的な制約を満たさなければならない。たとえば、薬剤処方を示すIDの型がReference(Observation|DIagnosticReport)であることは、正当化されないであろう。Reference.identifierのユースケースの一つは、FHIRの表現が存在しない場合に、(Any)を参照する型として利用するような場合である。"
* encounter ^short = "encounter/admission/stay のいずれかとして記録された診察"
* encounter ^definition = "JP Core profileでの使用は規定されていない。\r\nこの対象となるリソース[x]が作成される間やこの記録が作成される対象のencounterは密接に関連している。"
* encounter ^comment = "このエレメントは一般的には外来でのイベントに対応するが、診察が公式に終わる前や後にこの診察についてのコンテキストに対応して開始される活動についても対応する。もし、診療のエピソードに関連させる必要があれば、extensionとして扱われることがある。"
* supportingInformation ^short = "薬剤オーダについて補助的情報"
* supportingInformation ^definition = "薬剤をオーダーするときに補助的となる追加情報（たとえば、患者の身長や体重））を含む。"
* supportingInformation ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* authoredOn 1.. MS
* authoredOn ^short = "この処方オーダーが最初に記述された日"
* authoredOn ^definition = "JP Core profileでは必須。処方指示が最初に作成された日時。秒の精度まで記録する。タイムゾーンも付与しなければならない。"
* requester ^short = "このオーダーを発行した人・物"
* requester ^definition = "JP Core profileではこのエレメントに対する規定はない。\r\nこのオーダーを発行した責任のある人、組織、機器。"
* requester ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performer ^short = "薬剤投与・管理を行った者"
* performer ^definition = "薬物治療を実施すると予定された者。（たとえば、薬剤投与を行った者）"
* performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* performerType ^short = "薬剤投与を行った職種"
* performerType ^definition = "薬剤の投与・管理を行った職種を示す。"
* performerType ^comment = "Performerを示さずにこのエレメントが指定された場合は、このエレメントは薬剤の投与／管理が指定の職種でなければならないと言うことを示している。Performerと共に指定された場合は、もし指定されたPerformerが実施できない場合に薬剤投与・管理を行うものについての要件が示されたことを意味する。"
* recorder ^short = "投薬オーダーの入力者"
* recorder ^definition = "JP Core profileではこのエレメントに対する規定はない。\r\nたとえば口答指示や電話でのオーダーにより、他の人の代理で処方を入力した人。"
* recorder ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* reasonCode ^short = "薬を注文するあるいは注文しない理由や適応"
* reasonCode ^definition = "このエレメントに対するJP Coreの規定はない。\r\n薬剤をオーダーするあるいはしないことを示した理由。"
* reasonCode ^comment = "このエレメントは病名コードであってもよい。もし、すべての条件を示す記録があって他の詳細な記録が必要であれば、reasonReferenceを使用すること。"
* reasonReference ^short = "処方箋が書かれた理由について補足するCondition ResourceまたはObservation Resource"
* reasonReference ^definition = "薬剤がなぜオーダーされたのかを説明する条件や観察。"
* reasonReference ^comment = "薬剤オーダーの理由を示すこれは条件や観察についての参照である。もし、コードだけであればreasonCodeを使用すること。"
* instantiatesCanonical ^short = "FHIRプロトコルまたは定義のインスタンス"
* instantiatesCanonical ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesCanonical ^comment = "[Canonical References](references.html#canonical)を参照すること。"
* instantiatesUri ^short = "外部プロトコルまたは定義のインスタンス"
* instantiatesUri ^definition = "このMedicationRequestの一部あるいは全部が遵守するprotocolやguideline, ordersetなど他の定義を示すURL。"
* instantiatesUri ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* basedOn ^short = "オーダーが実施される根拠"
* basedOn ^definition = "このMedicationRequestの全部あるいは一部を満たす計画やオーダー。"
* basedOn ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* groupIdentifier ^short = "このRerquestを一部とする複数のオーダーを構成するID"
* groupIdentifier ^definition = "一人の処方者が同時期に前後して作成した全てのリクエストに共通するIDで、処方や薬品請求のIDを示す。"
* groupIdentifier ^requirements = "リクエストは\"basedOn\"での関連付け（たとえば、あるリクエストが他のリクエストを満たす）か、あるいは共通の請求伝票に書かれているを示すことで関連付けられる。同じ請求伝票にあるリクエストは最初に作成されてからは変更や維持などについては独立したものと見なされる。"
* courseOfTherapyType ^short = "薬剤投与の全体的なパターン"
* courseOfTherapyType ^definition = "患者が内服する薬剤についての管理の全体的なパターンについての記載。"
* courseOfTherapyType ^comment = "この属性は薬剤プロトコールと混同してはならない。"
* insurance ^short = "適用される保険"
* insurance ^definition = "リクエストされたサービスについて支払いが求め裸得ることになる、保険のプランや適応範囲の拡大、事前の権限付与、かつ/または事前の判定。"
* insurance ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* note ^short = "薬剤単位の備考"
* note ^definition = "他の属性では伝えることができなかったMedicationRequestについての付加的情報。"
* note ^comment = "構造化されたアノテーションが内システムでは、作成者や記録時間のない一つのアノテーションで情報を伝達している。このエレメントに情報の修正を要する可能性があるためにナラティブな情報も必要としている。Annotationsには機械処理が可能で修正される（\"modifying\")情報を伝達することに使うべきではない(SHOULD NOT)。これがSHOULDである理由はユーザーの行動を強制することはほぼ不可能であるからである。"
* dosageInstruction ^short = "服用指示"
* dosageInstruction ^definition = "⽤法や投与量を含む処⽅指⽰。患者がどのようにこの薬剤を服用するのかを示す。"
* dosageInstruction ^comment = "MedicationRequestで内服や静脈注射、筋肉注射を含めたサンプルがある。たとえば、「オンダンセトロン 8mg 経口あるいは静注1日2回嘔気時頓用」、あるいは「ノバミン®（プロクロロペラジン） 5-10mg 経口あるいは25mg経直腸1日2回嘔気・嘔吐時頓用」のようなものである。このような場合は2つの薬剤オーダーは同じグループにまとめることができるとして作成される。どのような投与経路を選択するかを決定するのは薬剤を必要とする時点の患者の状態にもとづいている。"
* dosageInstruction.extension ^slicing.discriminator.type = #value
* dosageInstruction.extension ^slicing.discriminator.path = "url"
* dosageInstruction.extension ^slicing.rules = #open
* dosageInstruction.extension ^min = 0
* dosageInstruction.extension[PeriodOfUse] only JP_MedicationRequest_DosageInstruction_PeriodOfUse
* dosageInstruction.extension[PeriodOfUse] ^sliceName = "PeriodOfUse"
* dosageInstruction.extension[PeriodOfUse] ^min = 0
* dosageInstruction.extension[UsageDuration] only JP_MedicationRequest_DosageInstruction_UsageDuration
* dosageInstruction.extension[UsageDuration] ^sliceName = "UsageDuration"
* dosageInstruction.extension[UsageDuration] ^short = "実投与⽇数"
* dosageInstruction.extension[UsageDuration] ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* dosageInstruction.extension[UsageDuration] ^min = 0
* dosageInstruction.extension[Device] only JP_MedicationRequest_DosageInstruction_Device
* dosageInstruction.extension[Device] ^sliceName = "Device"
* dosageInstruction.extension[Device] ^short = "投与機器の情報"
* dosageInstruction.extension[Device] ^definition = "投与機器の情報を記述する拡張。"
* dosageInstruction.extension[Device] ^min = 0
* dosageInstruction.extension[Line] only JP_MedicationRequest_DosageInstruction_Line
* dosageInstruction.extension[Line] ^sliceName = "Line"
* dosageInstruction.extension[Line] ^short = "投与ラインの情報"
* dosageInstruction.extension[Line] ^definition = "投与ラインの情報を記述する拡張。"
* dosageInstruction.extension[Line] ^min = 0
* dosageInstruction.sequence ^short = "服用指示の順番"
* dosageInstruction.sequence ^definition = "どの服用指示を適応するか判断するかについての順序を示したもの"
* dosageInstruction.sequence ^comment = "32 bitの数値。これ以上の値であれば10進数を使うこと。"
* dosageInstruction.sequence ^requirements = "もし、複数の服用法(Dosage)でsequenceの数値が同じであれば、その指示が同時に扱われることを示している。sequenceの数値が異なれば、服用指示(Dosage)の順番を意図している。"
* dosageInstruction.text 1..
* dosageInstruction.text ^short = "フリーテキストの用法指示。"
* dosageInstruction.text ^definition = "JP Coreでは必須。フリーテキストの用法指示。"
* dosageInstruction.text ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.text ^requirements = "フリーテキストでの用法指示はコード化するには複雑すぎる指示の場合には用いてもよい。この属性の文脈は薬剤の名前や説明が入っていない。コード化された指示がある場合は、フリーテキストでの指示は人間が服用あるいは投与するために表示されてもよい。テキストでの指示はつねに配置されることを想定されている。もし、dosage.timing属性も配置されていれば、dosage.textはtimingを同じ情報を反映すべきである。薬剤の投与あるいは調剤についての付加的な情報にはテキストでの説明が入っているべきである。"
* dosageInstruction.additionalInstruction ^short = "患者に対する補足指示や注意。たとえば、「食事と一緒に」「眠くなることがあります」"
* dosageInstruction.additionalInstruction ^definition = "どのように薬剤を内服するかについての患者への補足指示（たとえば、「食事と一緒に」や「30分から1時間前に内服」）や薬剤についての注意書き（たとえば、「眠くなることがあります」や「日光や紫外線が皮膚にあたららないようにすること」）"
* dosageInstruction.additionalInstruction ^comment = "薬剤投与や調剤についての情報（たとえば、「腹膜内ポートに可能な限り迅速に注入」や「薬剤Xの直後に」）であり、dosage.textにも複製されるべきである。"
* dosageInstruction.additionalInstruction ^requirements = "補足指示はコード化されるように意図されているが、コードがない場合はエレメントはテキストだけで表現することができる。たとえば、「大量の水で服用する」という指示はコード化されていることもあれば、されていないことおある。"
* dosageInstruction.additionalInstruction.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.additionalInstruction.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.additionalInstruction.coding ^short = "用法についてのコード"
* dosageInstruction.additionalInstruction.coding ^definition = "用法についてのコードが示される。JAMI 補⾜⽤法８桁コードを使用することを想定している。"
* dosageInstruction.additionalInstruction.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.additionalInstruction.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.additionalInstruction.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.additionalInstruction.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.additionalInstruction.coding.system 1..
* dosageInstruction.additionalInstruction.coding.system = "urn:oid:1.2.392.200250.2.2.20.22" (exactly)
* dosageInstruction.additionalInstruction.coding.system ^short = "JAMI 補⾜⽤法８桁コードを識別するURI。"
* dosageInstruction.additionalInstruction.coding.system ^definition = "JAMI 補⾜⽤法８桁コードを識別するURI"
* dosageInstruction.additionalInstruction.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.additionalInstruction.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.additionalInstruction.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.additionalInstruction.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.additionalInstruction.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.additionalInstruction.coding.code 1..
* dosageInstruction.additionalInstruction.coding.code ^short = "JAMI 補⾜⽤法コード"
* dosageInstruction.additionalInstruction.coding.code ^definition = "JAMI 補⾜⽤法コードを指定する。"
* dosageInstruction.additionalInstruction.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.additionalInstruction.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.additionalInstruction.coding.display ^short = "コードの表⽰名"
* dosageInstruction.additionalInstruction.coding.display ^definition = "システムの規則に従ってシステム内のコードの意味を表す表現。"
* dosageInstruction.additionalInstruction.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.additionalInstruction.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.additionalInstruction.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.additionalInstruction.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.additionalInstruction.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.additionalInstruction.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.additionalInstruction.text ^short = "この概念のプレーンテキスト表現"
* dosageInstruction.additionalInstruction.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* dosageInstruction.additionalInstruction.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.additionalInstruction.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.patientInstruction ^short = "患者あるいは消費者向けの指示"
* dosageInstruction.patientInstruction ^definition = "患者あるいは消費者に理解してもらうための指示。"
* dosageInstruction.patientInstruction ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.timing 1.. MS
* dosageInstruction.timing ^short = "服⽤タイミング"
* dosageInstruction.timing ^definition = "服⽤タイミングを記録する。"
* dosageInstruction.timing ^comment = "Dosage.textが設定されていることが想定されているのとは異なり、この属性は常に設定されていなくてもよい。もし、療法が設定されている場合はDosage.textはDosage.timingを反映させているべきである。"
* dosageInstruction.timing ^requirements = "患者に薬剤を投与すべき計画上のタイミング。このデータ型はさまざまな表現をとることができる。たとえば、「8時間おき」「1日3回」、「2011年12月23日から10日間、朝食全30分前に」、「2013年10月15日と2013年11月1日に」などである。しばしば、総量/総投与期間を表現するような場合に比率は期間を明示しておくことがある（たとえば、500mlを2時間でという指示は2時間と明示している)。しかしながら、比率で期間を表さない場合(たとえば、250ml/毎時）はtiming.repeat.durationで注射の総投与期間を伝える必要がある。"
* dosageInstruction.timing.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.timing.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.timing.event ^short = "服用タイミングを示す時刻"
* dosageInstruction.timing.event ^definition = "服⽤タイミングを具体的な⽇時で指定する場合に使⽤する"
* dosageInstruction.timing.repeat ^short = "イベントが発生する時刻"
* dosageInstruction.timing.repeat ^definition = "イベントがスケジュールされたルールについての記述。"
* dosageInstruction.timing.repeat ^requirements = "スケジュールされたタイミングの多くは規則的な繰り返しで決定されている。"
* dosageInstruction.timing.repeat.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.timing.repeat.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.timing.repeat.bounds[x] only Duration
* dosageInstruction.timing.repeat.bounds[x] ^short = "服⽤開始⽇から服⽤終了⽇までの全⽇数"
* dosageInstruction.timing.repeat.bounds[x] ^definition = "服⽤開始⽇から服⽤終了⽇までの全⽇数。実投与⽇数ではないことに注意する。"
* dosageInstruction.timing.repeat.bounds[x].id ..0
* dosageInstruction.timing.repeat.bounds[x].value 1..
* dosageInstruction.timing.repeat.bounds[x].value ^short = "投薬⽇数"
* dosageInstruction.timing.repeat.bounds[x].value ^definition = "投薬⽇数"
* dosageInstruction.timing.repeat.bounds[x].comparator ..0
* dosageInstruction.timing.repeat.bounds[x].unit 1..
* dosageInstruction.timing.repeat.bounds[x].code = #d (exactly)
* dosageInstruction.timing.repeat.bounds[x].system = "http://unitsofmeasure.org" (exactly)
* dosageInstruction.timing.repeat.bounds[x].unit = "日" (exactly)
* dosageInstruction.timing.repeat.bounds[x].unit ^short = "投薬⽇数の単位"
* dosageInstruction.timing.repeat.bounds[x].unit ^definition = "投薬⽇数の単位⽂字列。日で固定される"
* dosageInstruction.timing.repeat.bounds[x].system 1..
* dosageInstruction.timing.repeat.bounds[x].system ^short = "UCUM"
* dosageInstruction.timing.repeat.bounds[x].system ^definition = "単位コード UCUMを識別するURI。固定値。"
* dosageInstruction.timing.repeat.bounds[x].code 1..
* dosageInstruction.timing.repeat.bounds[x].code ^short = "投与⽇数の単位"
* dosageInstruction.timing.repeat.bounds[x].code ^definition = "単位コードUCUMにおける投与⽇数の単位。dで固定される。"
* dosageInstruction.timing.repeat.count ^short = "繰り返し服用回数"
* dosageInstruction.timing.repeat.count ^definition = "Timing仕様の全てにおいて、特定の期間に繰り返されるように指定された総回数。もし、countMaxが設定されていれば、このエレメントは許容される最低限度の回数を示す。"
* dosageInstruction.timing.repeat.count ^comment = "回数に上限、下限の範囲がある場合は、このcountで示される回数が起きるまでは、エレメントは範囲の中にあると解釈されるべきである。"
* dosageInstruction.timing.repeat.countMax ^short = "繰り返しの最大回数"
* dosageInstruction.timing.repeat.countMax ^definition = "このエレメントが設定されている場合は、回数に範囲があることを示している。したがって、[count]から[countmax]までの回数で繰り返される。"
* dosageInstruction.timing.repeat.countMax ^comment = "32bit整数。もし、値がこれを超える場合はdecimalで記録される。"
* dosageInstruction.timing.repeat.duration ^short = "継続時間"
* dosageInstruction.timing.repeat.duration ^definition = "投与されるタイミングが発生している時間。もし、durationMaxが設定されていれば、このエレメントは許容される継続時間の下限を示す。"
* dosageInstruction.timing.repeat.duration ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* dosageInstruction.timing.repeat.duration ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* dosageInstruction.timing.repeat.durationMax ^short = "継続時間(最大値)"
* dosageInstruction.timing.repeat.durationMax ^definition = "もし、このエレメントに値が設定されていれば、durationには範囲があることを示している。したがって、[duration]から[durationMax]までの継続時間の範囲で投与される。"
* dosageInstruction.timing.repeat.durationMax ^comment = "継続時間はイベントの定義の一部（たとえば、静脈注射(IV)では特定の量と速度が明示される)として示されることがある。その他、Timing仕様の一部（たとえば、運動）として示されることもある。"
* dosageInstruction.timing.repeat.durationMax ^requirements = "アクティビティによっては即時的なものではなく、その期間において維持される必要がある。"
* dosageInstruction.timing.repeat.durationUnit ^definition = "UCUM単位で表される継続時間についての単位。"
* dosageInstruction.timing.repeat.durationUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.timing.repeat.frequency ^short = "期間内にイベントが発生する回数、頻度"
* dosageInstruction.timing.repeat.frequency ^definition = "特定の期間に繰り返して発生した行為の回数。もし、frequencyMaxが設定されていれば、このエレメントはfrequencyとして認められた下限を示す。"
* dosageInstruction.timing.repeat.frequency ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* dosageInstruction.timing.repeat.frequency ^meaningWhenMissing = "frequencyが指定されていなければ、期間内に1回だけイベントが発生すると想定される。しかし、システムはこれを常時特定しておく必要がある。"
* dosageInstruction.timing.repeat.frequencyMax ^short = "期間内にイベントが発生する最大回数、最大頻度"
* dosageInstruction.timing.repeat.frequencyMax ^definition = "このエレメントに値が設定されていれば、frequencyには範囲が指定されている。つまり、期間あるいは期間の範囲内に[frequency]から[frequencyMax]回繰り返されることを示している。"
* dosageInstruction.timing.repeat.frequencyMax ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* dosageInstruction.timing.repeat.period ^short = "イベントが発生する頻度に対応する期間"
* dosageInstruction.timing.repeat.period ^definition = "繰り返し投与が行われる期間を示す。たとえば、「1日3回」であれば、3は繰り返しの頻度(frequency)であり、「1日」が期間(period)である。もし、periodMaxに値が設定されていれば、このエレメントは期間として認められた範囲の下限を示す。"
* dosageInstruction.timing.repeat.period ^comment = "IEEEの浮動小数点型を使わずに、小数点も含むdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* dosageInstruction.timing.repeat.periodMax ^short = "期間の上限（3-4時間）"
* dosageInstruction.timing.repeat.periodMax ^definition = "もし、この値が設定されていれば、期間は[period]から[periodMax]までであることを示し、「3-5日に1回投与」のような表現が認められる。"
* dosageInstruction.timing.repeat.periodMax ^comment = "IEEEの浮動小数点型を使わずに、小数点の制度も示すdecimal型のようなものを利用すること（たとえばJavaのBigInteger)。"
* dosageInstruction.timing.repeat.periodUnit ^definition = "期間を表すUCUM単位。"
* dosageInstruction.timing.repeat.periodUnit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.timing.repeat.dayOfWeek ^definition = "期間として1週間以上が指定されていれば、指定された曜日のみで投与が行われる。"
* dosageInstruction.timing.repeat.dayOfWeek ^comment = "曜日が指定されていなければ、他に指定された日には毎日投与されると想定される。frequencyとperiodエレメントはdayOfWeekと同じように使うことはできない。"
* dosageInstruction.timing.repeat.timeOfDay ^short = "一日の間で投与される時刻"
* dosageInstruction.timing.repeat.timeOfDay ^definition = "一日の間で指定された投与される時刻。"
* dosageInstruction.timing.repeat.timeOfDay ^comment = "もし、このtimeOfDayに値が指定されていれば、毎日（daysOfWeekでフィルタされた曜日の）指定された時刻に投与されると推定される。whenやfrequency, periodエレメントはtimeOfDayとは同様に使うことはできない。"
* dosageInstruction.timing.repeat.when ^short = "投薬期間についてのコード"
* dosageInstruction.timing.repeat.when ^definition = "一日の間のおおよその時間帯で投与すべきタイミングを示す。日常のイベントに関連付けられていることもある。"
* dosageInstruction.timing.repeat.when ^comment = "一つ以上のイベントが記載されている場合、そのイベントは特定のイベントの組み合わせと結びついている。"
* dosageInstruction.timing.repeat.when ^requirements = "タイミングはしばしば起床や食事、睡眠などのできごとによってしばしば決定されている。"
* dosageInstruction.timing.repeat.offset ^short = "イベントからの時間(分、前後）"
* dosageInstruction.timing.repeat.offset ^definition = "イベントからの時間(分)。もし、分で示される時間がイベントのコードが前か後かを示していない場合、offsetはイベントの後であることが想定される。"
* dosageInstruction.timing.repeat.offset ^comment = "32ビットの数値。もし、値がそれを上回るようであればdecimalを使用する。"
* dosageInstruction.timing.code ^definition = "スケジュール上のタイミングを表すコード（あるいはcode.text内のテキスト）。BID(1日2回)のようなコードはどこにでもあるが、多くの医療機関は付加的なコードを定義している。もし、コードが示されていれば、構造化されたタイミングで完全に示されたデータであると解釈され、コードまたはTimingを解釈するためのデータであると解釈される。しかし、例外的に.repeat.bounds（コードは含まれません)はコードを上書きして適用される。"
* dosageInstruction.timing.code ^comment = "BIDなどは「施設特有の時間」として定義される。たとえば、施設がBIDを「つねに朝7時と夕方6時」であると指定することがある。この指定が不適切であれば、BIDというコードは使うべきではない。その代わり、HL7が定義したBIDのコードではなく、その施設特有のコードで明示的に示すべきであり、構造化された表現を使うべきである（この場合、2回のイベントの時刻を指定する必要がある）。"
* dosageInstruction.asNeeded[x] only boolean
* dosageInstruction.asNeeded[x] ^short = "「頓用」指示"
* dosageInstruction.asNeeded[x] ^definition = "JP Coreでは頓⽤型の⽤法を指定する場合に”true”を指定し、そのコードを指定する場合は用法コードとして指定する。\r\nMedication(薬剤)が必要なときに指定された量とスケジュールのみで内服するか（Booleanで選択される）、内服する前提条件(CodeableConcept)を示している。"
* dosageInstruction.site ^short = "投与される身体部位"
* dosageInstruction.site ^definition = "投与される身体部位。外⽤薬で部位を指定する場合に使⽤する。"
* dosageInstruction.site ^comment = "もし、BodySite resourceの属性が必要な場合(たとえば、部位の指定や別々に投与経路を設定する場合)は、[bodySite](extension-bodysite.html)の標準拡張を使うこと。要約コードや非常に正確な位置の定義へのreferenceを使用することもできる。"
* dosageInstruction.site.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.site.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.site.coding ^short = "JAMI外⽤部位３桁コード"
* dosageInstruction.site.coding ^definition = "ターミノロジーを参照する際に定義されたコード"
* dosageInstruction.site.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.site.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.site.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.site.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.site.coding.system 1..
* dosageInstruction.site.coding.system = "urn:oid:1.2.392.200250.2.2.20.32" (exactly)
* dosageInstruction.site.coding.system ^short = "JAMI 外⽤部位３桁コードを識別するURI"
* dosageInstruction.site.coding.system ^definition = "JAMI 外⽤部位３桁コードを識別するURI。固定値。"
* dosageInstruction.site.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.site.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.site.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.site.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.site.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.site.coding.code 1..
* dosageInstruction.site.coding.code ^short = "JAMI 外⽤部位３桁コード"
* dosageInstruction.site.coding.code ^definition = "JAMI 外⽤部位３桁コード"
* dosageInstruction.site.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.site.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.site.coding.display ^short = "JAMI 部位コードの表⽰名"
* dosageInstruction.site.coding.display ^definition = "JAMI 部位コードの表⽰名"
* dosageInstruction.site.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.site.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.site.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.site.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.site.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.site.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.site.text ^short = "この概念のプレーンテキスト表現"
* dosageInstruction.site.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* dosageInstruction.site.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.site.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.route ^short = "投与経路"
* dosageInstruction.route ^definition = "投与経路。"
* dosageInstruction.route ^comment = "投与経路の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* dosageInstruction.route ^requirements = "治療薬剤が患者の体内に投与される生理学的な経路を特定するためのコード。"
* dosageInstruction.route.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.route.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.route.coding 1..1
* dosageInstruction.route.coding ^short = "JAMI ⽤法コード表投与経路区分２桁コード"
* dosageInstruction.route.coding ^definition = "JAMI ⽤法コード表投与経路区分２桁コードを識別するURI。JP Coreでは必須。"
* dosageInstruction.route.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.route.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.route.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.route.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.route.coding.system 1..
* dosageInstruction.route.coding.system = "http://jpfhir.jp/fhir/ePrescription/CodeSystem/route-codes" (exactly)
* dosageInstruction.route.coding.system ^short = "HL7v2-0162表をベースにしたJPFHIRでの投与経路コード表"
* dosageInstruction.route.coding.system ^definition = "HL7v2-0162表をベースにしたJPFHIRでの投与経路コード表を示すURL"
* dosageInstruction.route.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.route.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.route.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.route.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.route.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.route.coding.code 1..
* dosageInstruction.route.coding.code ^short = "JAMI ⽤法コード表投与経路区分２桁コード"
* dosageInstruction.route.coding.code ^definition = "JAMI ⽤法コード表投与経路区分２桁コード"
* dosageInstruction.route.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.route.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.route.coding.display ^short = "JAMI ⽤法コード表投与経路区分２桁コードの表⽰名"
* dosageInstruction.route.coding.display ^definition = "JAMI ⽤法コード表投与経路区分２桁コードの表⽰名"
* dosageInstruction.route.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.route.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.route.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.route.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.route.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.route.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.route.text ^short = "投与経路の⽂字列表現"
* dosageInstruction.route.text ^definition = "投与経路の⽂字列表現。コードで指定できない場合、本要素で⽂字列として指定してもよい。"
* dosageInstruction.route.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.route.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.method ^short = "投与方法"
* dosageInstruction.method ^definition = "投与方法。投与⽅法に対応するJAMI ⽤法コード表基本⽤法１桁コード。"
* dosageInstruction.method ^comment = "ターミノロジーは投与する経路あるいは剤型をあらかじめ指定するために用いられる。"
* dosageInstruction.method ^requirements = "コード化された値は体内に薬剤が投与される方法を示している。注射ではよく使われる。たとえば、緩徐に注入、深部に静注など。"
* dosageInstruction.method.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.method.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.method.coding ^short = "投与⽅法に対応するJAMI ⽤法コード表基本⽤法１桁コード"
* dosageInstruction.method.coding ^definition = "投与⽅法に対応するJAMI ⽤法コード表基本⽤法１桁コードを識別するURI。urn:oid:1.2.392.200250.2.2.20.30"
* dosageInstruction.method.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.method.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.method.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.method.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.method.coding.system 1..
* dosageInstruction.method.coding.system = "urn:oid:1.2.392.200250.2.2.20.30" (exactly)
* dosageInstruction.method.coding.system ^short = "投与⽅法に対応するJAMI ⽤法コード表基本⽤法１桁コードを示すURI"
* dosageInstruction.method.coding.system ^definition = "投与⽅法に対応するJAMI ⽤法コード表基本⽤法１桁コード。urn:oid:1.2.392.200250.2.2.20.30で固定される。"
* dosageInstruction.method.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.method.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.method.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.method.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.method.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.method.coding.code 1..
* dosageInstruction.method.coding.code ^short = "JAMI ⽤法コード表基本⽤法１桁コード"
* dosageInstruction.method.coding.code ^definition = "JAMI ⽤法コード表基本⽤法１桁コード。"
* dosageInstruction.method.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.method.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.method.coding.display ^short = "JAMI ⽤法コード表基本⽤法１桁コードの表⽰名"
* dosageInstruction.method.coding.display ^definition = "JAMI ⽤法コード表基本⽤法１桁コードの表⽰名。"
* dosageInstruction.method.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.method.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.method.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.method.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.method.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.method.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.method.text ^short = "投与⽅法のテキスト表現"
* dosageInstruction.method.text ^definition = "投与⽅法のテキスト表現。コードで指定できない場合、本要素で⽂字列として指定してもよい。"
* dosageInstruction.method.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.method.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.doseAndRate ^short = "薬剤の投与量"
* dosageInstruction.doseAndRate ^definition = "薬剤が投与される量"
* dosageInstruction.doseAndRate.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type 1..
* dosageInstruction.doseAndRate.type ^short = "⼒価区分"
* dosageInstruction.doseAndRate.type ^definition = "⼒価区分"
* dosageInstruction.doseAndRate.type ^comment = "投与速度・量の一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* dosageInstruction.doseAndRate.type ^requirements = "このtypeに値が指定されていなければ、\"ordered\"であることが想定される。"
* dosageInstruction.doseAndRate.type.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding 1..1
* dosageInstruction.doseAndRate.type.coding ^short = "⼒価区分コード"
* dosageInstruction.doseAndRate.type.coding ^definition = "⼒価区分コード"
* dosageInstruction.doseAndRate.type.coding ^comment = "コードは臨時で列記したものや、コードのリストからSNOMED CTのように公式に定義されたものまである（HL7 v3 core principle を参照)。FHIR自体ではコーディング規約を定めてはいないし、意味を暗示するために利用されない(SHALL NOT)。一般的に UserSelected = trueの場合には一つのコードシステムが使われる。"
* dosageInstruction.doseAndRate.type.coding ^requirements = "他のコードシステムへの変換や代替のコードシステムを使ってエンコードしてもよい。"
* dosageInstruction.doseAndRate.type.coding.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.doseAndRate.type.coding.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.doseAndRate.type.coding.system 1..
* dosageInstruction.doseAndRate.type.coding.system = "urn:oid:1.2.392.100495.20.2.22" (exactly)
* dosageInstruction.doseAndRate.type.coding.system ^short = "⼒価区分コードのコード体系を識別するURI"
* dosageInstruction.doseAndRate.type.coding.system ^definition = "⼒価区分コードのコード体系を識別するURI。固定値。"
* dosageInstruction.doseAndRate.type.coding.system ^comment = "URIはOID(urn:oid:....)やUUID(urn:uuid:....)であることもある。OIDやUUIDはHL7のOIDレジストリを参照していなければならない（SHALL)。そうでなければ、URIはHL7のFHIRのリストに挙げられている特別なURIであるか、用語集が明確な定義が参照されるべきである。"
* dosageInstruction.doseAndRate.type.coding.system ^requirements = "記号の定義の根拠が明確である必要がある。"
* dosageInstruction.doseAndRate.type.coding.version ^short = "用語集のバージョン - もし必要であれば追加する。"
* dosageInstruction.doseAndRate.type.coding.version ^definition = "コードが選択された際に利用されたコードシステムのバージョンである。コードの意味するところがバージョンが変わっても一貫しているように十分にメンテナンスされているコードシステムであれば、バージョンを表記する必要はないことに留意されたい。しかしながら、一貫性はなかなか保証されるものではないし、意味の一貫性が保証されていないのであればバージョンは交換されるべきである（SHOULD)。"
* dosageInstruction.doseAndRate.type.coding.version ^comment = "ターミノロジーのバージョンが文字列としてコードシステムにより定義されていない場合は、そのバージョンが公式に公開された日付を示す（FHIRのdateフォーマットで表現される）dateを用いることが推奨されている。"
* dosageInstruction.doseAndRate.type.coding.code 1..
* dosageInstruction.doseAndRate.type.coding.code ^short = "⼒価区分コード"
* dosageInstruction.doseAndRate.type.coding.code ^definition = "⼒価区分コード"
* dosageInstruction.doseAndRate.type.coding.code ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.doseAndRate.type.coding.code ^requirements = "システム内の特定のコードを参照する必要がある。"
* dosageInstruction.doseAndRate.type.coding.display ^short = "⼒価区分コードの表示名"
* dosageInstruction.doseAndRate.type.coding.display ^definition = "⼒価区分コードの表示名"
* dosageInstruction.doseAndRate.type.coding.display ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.doseAndRate.type.coding.display ^requirements = "コードが持つ意味をそのシステムを知らない人でも読めるように人間可読であるようにしている必要がある。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^short = "このコードが直接ユーザーが指定したものであるかどうか"
* dosageInstruction.doseAndRate.type.coding.userSelected ^definition = "ユーザーが直接コーディングしたかどうかを示す。たとえば、有効な項目のリスト（コードか表現）から選択したかどうか。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^comment = "選択肢の中から、直接選ばれたコードは新しく翻訳するときには最も適切なスタート地点である。何をもって「直接選ばれた」とするのかには曖昧なところがあり、このエレメントの使用について明確にして結論として何を意味するのかより完全になるよう取引先との合意が必要となる。"
* dosageInstruction.doseAndRate.type.coding.userSelected ^requirements = "このエレメントは臨床安全のために特定されてきた。System/codeのペアが明示的に選択されることは、言語処理や何らかの規則を元に推測されるよりも正確だからである。"
* dosageInstruction.doseAndRate.type.text ^short = "この概念のプレーンテキスト表現"
* dosageInstruction.doseAndRate.type.text ^definition = "入力したユーザーが見た/選択した/発したとおりの概念および・またはユーザーが意図した概念を自然言語で表現したもの。"
* dosageInstruction.doseAndRate.type.text ^comment = "textエレメントはcodingのdisplayNameエレメントと一致することがよくある。"
* dosageInstruction.doseAndRate.type.text ^requirements = "ターミノロジー由来のコードは必ずしも人間が使う言葉の全てのニュアンスを含めた正確な意味を捉えているわけではなく、適切なコードが見つからない場合もある。そのような場合でもtextエレメントは元々の意味のすべてを捉えるために使うことができる。"
* dosageInstruction.doseAndRate.dose[x] only SimpleQuantity
* dosageInstruction.doseAndRate.dose[x] ^short = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^definition = "1回投与量"
* dosageInstruction.doseAndRate.dose[x] ^comment = "この量は指定された薬剤の量を指定するものであって、各有効成分の量を指定するものではない。各成分の量はMedication resourceで伝えることができる。たとえば、有効成分が375mgである錠剤を1錠投与することを伝えたい場合、Medication resourceを利用して、XYZ成分が375mg含有しているという錠剤であることを文書化することができる。あるいは1回投与量が375mgであることを伝えるのであれば、Medication resourceをつかって単にそれが錠剤であることを示せばよい。もし、ドーパミンの静注を例に挙げて、400mgのドーパミンを500mlの注射溶液に混ぜて使うことを伝えたいのであれば、それをすべてMedication resourceで伝えることができる。もし、投与について即時に伝達することを意図していない（たとえば投与速度が示されていたり、投与時期に範囲があるような場合）のであれば、たとえば1回500mlを4時間以上かけて投与する予定を伝える場合にもMecication resourceで伝えることができます。"
* dosageInstruction.doseAndRate.dose[x].value 1..
* dosageInstruction.doseAndRate.dose[x].value ^short = "1回投与量"
* dosageInstruction.doseAndRate.dose[x].value ^definition = "1回投与量"
* dosageInstruction.doseAndRate.dose[x].unit 1..
* dosageInstruction.doseAndRate.dose[x].system 1..
* dosageInstruction.doseAndRate.dose[x].system = "urn:oid:1.2.392.100495.20.2.101" (exactly)
* dosageInstruction.doseAndRate.dose[x].system ^short = "医薬品単位略号を識別するOID。"
* dosageInstruction.doseAndRate.dose[x].system ^definition = "医薬品単位略号を識別するOID。固定値。"
* dosageInstruction.doseAndRate.dose[x].code ^short = "医薬品単位略号"
* dosageInstruction.doseAndRate.dose[x].code ^definition = "医薬品単位略号"
* dosageInstruction.doseAndRate.rate[x] only Ratio
* dosageInstruction.doseAndRate.rate[x] ^short = "単位時間内での薬剤量"
* dosageInstruction.doseAndRate.rate[x] ^definition = "単位時間内での薬剤量。JP Coreでは1 ⽇投与量を表す。"
* dosageInstruction.doseAndRate.rate[x] ^comment = "JP Coreでは日本ではまだ一般的に利用されている一日量での処方のためにrateRatioを用いる。\r\n\r\n薬剤の詳細な投与法、提供方法を伝えるために、投与速度(rate)とdoseQuantityの両方の情報を提供することができる。もし、投与速度が変更されるようであれば、ローカルルールや制限に基づいて、全ての変更は新しいバージョンのMeddicationRequestに更新された投与速度を記録するか、MedicationRequestの新しいインスタンスに新しい投与速度を記録されるようにするべきである。\r\n\r\nrateRatioとrateQuantityのいずれかを使って時間内の投与速度（たとえば100ml/hour)を指定することができる。rateQuantityを使うには、ml/hourが投与速度の単位と言うだけではなく、時間が分母として指定されているということを示しているというようなUCUM単位の文法をシステムがパース可能であることが求められる。500mlを2時間でというような投与速度指示では、rateRatioがrateQuantityで250mg/hourとするよりもセマンティクスを正確に伝えることができるかもしれない。"
* dosageInstruction.doseAndRate.rate[x] ^requirements = "患者の体内に導入される、あるいはされた薬剤の速度を指定する。一般的には、たとえば1時間あたり100mlあるいは100ml/hrのように注射の速度を示す。たとえば、500mlを2時間でというように、単位時間あたりの速さを表現することもできる。その他、200マイクログラム/minや200マイクログラム/1分, 1 リットル/8時間のような表現もできる。しばしば、投与速度を投与総量/ 投与総時間で表ような場合に投与時間が明示される（たとえば、500ml/2時間という場合は、投与時間が2時間であることを示している）。しかしながら、投与速度で投与時間が明示されない場合（たとえば、250ml/毎時)は、timing.repeat.durationが注射の総投与時間を示すためには必要となる。"
* dosageInstruction.doseAndRate.rate[x].numerator 1..
* dosageInstruction.doseAndRate.rate[x].numerator ^short = "1 ⽇投与量"
* dosageInstruction.doseAndRate.rate[x].numerator ^definition = "1 ⽇投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.value 1..
* dosageInstruction.doseAndRate.rate[x].numerator.value ^short = "1 ⽇投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.value ^definition = "1 ⽇投与量"
* dosageInstruction.doseAndRate.rate[x].numerator.comparator ..0
* dosageInstruction.doseAndRate.rate[x].numerator.unit 1..
* dosageInstruction.doseAndRate.rate[x].numerator.unit ^short = "投与量の単位"
* dosageInstruction.doseAndRate.rate[x].numerator.unit ^definition = "投与量の単位。"
* dosageInstruction.doseAndRate.rate[x].numerator.system 1..
* dosageInstruction.doseAndRate.rate[x].numerator.system = "urn:oid:1.2.392.100495.20.2.101" (exactly)
* dosageInstruction.doseAndRate.rate[x].numerator.system ^short = "医薬品単位略号を識別するOID"
* dosageInstruction.doseAndRate.rate[x].numerator.system ^definition = "医薬品単位略号を識別するOID。固定値。"
* dosageInstruction.doseAndRate.rate[x].numerator.code ^short = "医薬品単位略号"
* dosageInstruction.doseAndRate.rate[x].numerator.code ^definition = "医薬品単位略号"
* dosageInstruction.doseAndRate.rate[x].denominator 1..
* dosageInstruction.doseAndRate.rate[x].denominator ^short = "1 ⽇投与量の分⺟である「1 ⽇」を表す"
* dosageInstruction.doseAndRate.rate[x].denominator ^definition = "1 ⽇投与量の分⺟である「1 ⽇」を表す。"
* dosageInstruction.doseAndRate.rate[x].denominator.value 1..
* dosageInstruction.doseAndRate.rate[x].denominator.value = 1 (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.value ^short = "1 ⽇投与量の分⺟である「1 ⽇」"
* dosageInstruction.doseAndRate.rate[x].denominator.value ^definition = "1 ⽇投与量の分⺟である「1 ⽇」を表す。"
* dosageInstruction.doseAndRate.rate[x].denominator.comparator ..0
* dosageInstruction.doseAndRate.rate[x].denominator.unit 1..
* dosageInstruction.doseAndRate.rate[x].denominator.code = #d (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.system = "http://unitsofmeasure.org" (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.unit = "⽇" (exactly)
* dosageInstruction.doseAndRate.rate[x].denominator.unit ^short = "1 ⽇投与量の分⺟である「1 ⽇」の単位"
* dosageInstruction.doseAndRate.rate[x].denominator.unit ^definition = "1 ⽇投与量の分⺟である「1 ⽇」の単位。「日」で固定される。"
* dosageInstruction.doseAndRate.rate[x].denominator.system 1..
* dosageInstruction.doseAndRate.rate[x].denominator.system ^short = "UCUM単位コードを識別するURI"
* dosageInstruction.doseAndRate.rate[x].denominator.system ^definition = "UCUM単位コードを識別するURI"
* dosageInstruction.doseAndRate.rate[x].denominator.code 1..
* dosageInstruction.doseAndRate.rate[x].denominator.code ^short = "「⽇」を表すUCUM単位コード。"
* dosageInstruction.doseAndRate.rate[x].denominator.code ^definition = "「⽇」を表すUCUM単位コード。dで固定される。"
* dosageInstruction.maxDosePerPeriod ^short = "単位期間内の薬剤投与上限"
* dosageInstruction.maxDosePerPeriod ^definition = "単位期間内の薬剤投与上限"
* dosageInstruction.maxDosePerPeriod ^comment = "このエレメントは投与量に上限があるときに用法指示の補助として使われる。たとえば、「1回2錠4時間おきに、1日8錠まで」のような表現である。"
* dosageInstruction.maxDosePerPeriod ^requirements = "一定期間に患者に投与できる治療物質の最大容量。たとえば、24時間で1000mg。"
* dosageInstruction.maxDosePerPeriod.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.maxDosePerPeriod.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.maxDosePerPeriod.numerator ^short = "分子の値"
* dosageInstruction.maxDosePerPeriod.numerator ^definition = "分子の値"
* dosageInstruction.maxDosePerPeriod.numerator ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dosageInstruction.maxDosePerPeriod.numerator.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.maxDosePerPeriod.numerator.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.maxDosePerPeriod.numerator.value ^short = "（精度が暗示された）数値"
* dosageInstruction.maxDosePerPeriod.numerator.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dosageInstruction.maxDosePerPeriod.numerator.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dosageInstruction.maxDosePerPeriod.numerator.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dosageInstruction.maxDosePerPeriod.numerator.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dosageInstruction.maxDosePerPeriod.numerator.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerPeriod.numerator.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dosageInstruction.maxDosePerPeriod.numerator.unit ^short = "単位表現"
* dosageInstruction.maxDosePerPeriod.numerator.unit ^definition = "人間にも可読な単位表現"
* dosageInstruction.maxDosePerPeriod.numerator.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerPeriod.numerator.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dosageInstruction.maxDosePerPeriod.numerator.system ^short = "コード化された単位表現を規定するシステム"
* dosageInstruction.maxDosePerPeriod.numerator.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dosageInstruction.maxDosePerPeriod.numerator.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dosageInstruction.maxDosePerPeriod.numerator.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dosageInstruction.maxDosePerPeriod.numerator.code ^short = "単位のコード化された形式"
* dosageInstruction.maxDosePerPeriod.numerator.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dosageInstruction.maxDosePerPeriod.numerator.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dosageInstruction.maxDosePerPeriod.numerator.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dosageInstruction.maxDosePerPeriod.denominator ^short = "分母の値"
* dosageInstruction.maxDosePerPeriod.denominator ^definition = "分母の値"
* dosageInstruction.maxDosePerPeriod.denominator ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dosageInstruction.maxDosePerPeriod.denominator.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.maxDosePerPeriod.denominator.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.maxDosePerPeriod.denominator.value ^short = "（精度が暗示された）数値"
* dosageInstruction.maxDosePerPeriod.denominator.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dosageInstruction.maxDosePerPeriod.denominator.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dosageInstruction.maxDosePerPeriod.denominator.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dosageInstruction.maxDosePerPeriod.denominator.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dosageInstruction.maxDosePerPeriod.denominator.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerPeriod.denominator.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dosageInstruction.maxDosePerPeriod.denominator.unit ^short = "単位表現"
* dosageInstruction.maxDosePerPeriod.denominator.unit ^definition = "人間にも可読な単位表現"
* dosageInstruction.maxDosePerPeriod.denominator.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerPeriod.denominator.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dosageInstruction.maxDosePerPeriod.denominator.system ^short = "コード化された単位表現を規定するシステム"
* dosageInstruction.maxDosePerPeriod.denominator.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dosageInstruction.maxDosePerPeriod.denominator.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dosageInstruction.maxDosePerPeriod.denominator.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dosageInstruction.maxDosePerPeriod.denominator.code ^short = "単位のコード化された形式"
* dosageInstruction.maxDosePerPeriod.denominator.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dosageInstruction.maxDosePerPeriod.denominator.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dosageInstruction.maxDosePerPeriod.denominator.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dosageInstruction.maxDosePerAdministration ^short = "1回投与あたりの最大薬剤量"
* dosageInstruction.maxDosePerAdministration ^definition = "1回投与あたりの最大薬剤量"
* dosageInstruction.maxDosePerAdministration ^comment = "薬剤用量に上限があることについて表現することを意図している。たとえば、体表面積に応じて用量と最大量が設定されている場合、5分から10分かけて1.5mg/m2(最大2mg) 静注(IV)するというような表現はdoseQuantityが1.5mg/m2で、maxDosePerAdministrationが2mgであることで表現できる。"
* dosageInstruction.maxDosePerAdministration ^requirements = "患者に対する治1回あたりの療薬剤の総量としての最大量は投与ごとにに管理されるべきでもある。"
* dosageInstruction.maxDosePerAdministration.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.maxDosePerAdministration.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.maxDosePerAdministration.value ^short = "（精度が暗示された）数値"
* dosageInstruction.maxDosePerAdministration.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dosageInstruction.maxDosePerAdministration.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dosageInstruction.maxDosePerAdministration.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dosageInstruction.maxDosePerAdministration.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dosageInstruction.maxDosePerAdministration.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerAdministration.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dosageInstruction.maxDosePerAdministration.unit ^short = "単位表現"
* dosageInstruction.maxDosePerAdministration.unit ^definition = "人間にも可読な単位表現"
* dosageInstruction.maxDosePerAdministration.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerAdministration.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dosageInstruction.maxDosePerAdministration.system ^short = "コード化された単位表現を規定するシステム"
* dosageInstruction.maxDosePerAdministration.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dosageInstruction.maxDosePerAdministration.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dosageInstruction.maxDosePerAdministration.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dosageInstruction.maxDosePerAdministration.code ^short = "単位のコード化された形式"
* dosageInstruction.maxDosePerAdministration.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dosageInstruction.maxDosePerAdministration.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dosageInstruction.maxDosePerAdministration.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dosageInstruction.maxDosePerLifetime ^short = "患者の生涯においての最大投与量"
* dosageInstruction.maxDosePerLifetime ^definition = "患者の障害での最大投与量"
* dosageInstruction.maxDosePerLifetime ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dosageInstruction.maxDosePerLifetime ^requirements = "対象となる患者の人生において治療薬剤として投与される最大総量は管理されていることが望ましい。"
* dosageInstruction.maxDosePerLifetime.id ^short = "エレメント間参照のためのユニークID"
* dosageInstruction.maxDosePerLifetime.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dosageInstruction.maxDosePerLifetime.value ^short = "（精度が暗示された）数値"
* dosageInstruction.maxDosePerLifetime.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dosageInstruction.maxDosePerLifetime.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dosageInstruction.maxDosePerLifetime.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dosageInstruction.maxDosePerLifetime.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dosageInstruction.maxDosePerLifetime.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerLifetime.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dosageInstruction.maxDosePerLifetime.unit ^short = "単位表現"
* dosageInstruction.maxDosePerLifetime.unit ^definition = "人間にも可読な単位表現"
* dosageInstruction.maxDosePerLifetime.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dosageInstruction.maxDosePerLifetime.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dosageInstruction.maxDosePerLifetime.system ^short = "コード化された単位表現を規定するシステム"
* dosageInstruction.maxDosePerLifetime.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dosageInstruction.maxDosePerLifetime.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dosageInstruction.maxDosePerLifetime.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dosageInstruction.maxDosePerLifetime.code ^short = "単位のコード化された形式"
* dosageInstruction.maxDosePerLifetime.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dosageInstruction.maxDosePerLifetime.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dosageInstruction.maxDosePerLifetime.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest ^short = "調剤・払い出しについての承認事項"
* dispenseRequest ^definition = "薬剤オーダー(MedicationRequest, Medication Prescription, Medication Orderなどとしても表現される）や薬剤オーダーとの一部としての薬剤の払い出しあるいは提供。この情報はオーダーとしてかならず伝えられるというわけではないことに注意。薬剤部門で調剤・払い出しを完了するための施設（たとえば病院）やシステムでのサポートに関する設定をしてもよい。"
* dispenseRequest.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.extension ^slicing.discriminator.type = #value
* dispenseRequest.extension ^slicing.discriminator.path = "url"
* dispenseRequest.extension ^slicing.rules = #open
* dispenseRequest.extension ^min = 0
* dispenseRequest.extension contains
    JP_MedicationRequest_DispenseRequest_InstructionForDispense named InstructionForDispense 0..* and
    JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount named ExpectedRepeatCount 0..1
* dispenseRequest.extension[InstructionForDispense] ^short = "調剤指示"
* dispenseRequest.extension[InstructionForDispense] ^definition = "薬剤単位の調剤指示を格納する"
* dispenseRequest.extension[InstructionForDispense] ^min = 0
* dispenseRequest.extension[InstructionForDispense].value[x] ^short = "調剤指示"
* dispenseRequest.extension[InstructionForDispense].value[x] ^definition = "薬剤単位の調剤・払い出し指示"
* dispenseRequest.extension[ExpectedRepeatCount] ^short = "頓用回数"
* dispenseRequest.extension[ExpectedRepeatCount] ^definition = "頓用回数"
* dispenseRequest.extension[ExpectedRepeatCount] ^min = 0
* dispenseRequest.initialFill ^short = "初回の調剤詳細"
* dispenseRequest.initialFill ^definition = "初回の薬剤払い出しでの期間や量への指示"
* dispenseRequest.initialFill ^comment = "このエレメントを設定するときには量あるいは期間が指定されていなければならない。"
* dispenseRequest.initialFill.id ^short = "内部エレメントを参照するためのユニークID"
* dispenseRequest.initialFill.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.quantity ^short = "初回の調剤量"
* dispenseRequest.initialFill.quantity ^definition = "初回の払い出しとして提供される薬剤の量。"
* dispenseRequest.initialFill.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.quantity.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.initialFill.quantity.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.quantity.value ^short = "（精度が暗示された）数値"
* dispenseRequest.initialFill.quantity.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.initialFill.quantity.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.initialFill.quantity.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.initialFill.quantity.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.initialFill.quantity.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.quantity.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.initialFill.quantity.unit ^short = "単位表現"
* dispenseRequest.initialFill.quantity.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.initialFill.quantity.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.quantity.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.initialFill.quantity.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.initialFill.quantity.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.initialFill.quantity.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.initialFill.quantity.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.initialFill.quantity.code ^short = "単位のコード化された形式"
* dispenseRequest.initialFill.quantity.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.initialFill.quantity.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.initialFill.quantity.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.initialFill.duration ^short = "初回の調剤期間"
* dispenseRequest.initialFill.duration ^definition = "初回に行われる調剤、払い出しで予定される期間"
* dispenseRequest.initialFill.duration ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.initialFill.duration.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.initialFill.duration.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.initialFill.duration.value ^short = "（精度が暗示された）数値"
* dispenseRequest.initialFill.duration.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.initialFill.duration.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.initialFill.duration.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.initialFill.duration.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.initialFill.duration.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.duration.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.initialFill.duration.unit ^short = "単位表現"
* dispenseRequest.initialFill.duration.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.initialFill.duration.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.initialFill.duration.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.initialFill.duration.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.initialFill.duration.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.initialFill.duration.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.initialFill.duration.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.initialFill.duration.code ^short = "単位のコード化された形式"
* dispenseRequest.initialFill.duration.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.initialFill.duration.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.initialFill.duration.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.dispenseInterval ^short = "再調剤までの最短期間"
* dispenseRequest.dispenseInterval ^definition = "再調剤、払い出しを行う予定までの最短の期間"
* dispenseRequest.dispenseInterval ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.dispenseInterval.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.dispenseInterval.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.dispenseInterval.value ^short = "（精度が暗示された）数値"
* dispenseRequest.dispenseInterval.value ^definition = "計測された量。精度を含めた値が暗示される。"
* dispenseRequest.dispenseInterval.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.dispenseInterval.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.dispenseInterval.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.dispenseInterval.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.dispenseInterval.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.dispenseInterval.unit ^short = "単位表現"
* dispenseRequest.dispenseInterval.unit ^definition = "人間にも可読な単位表現"
* dispenseRequest.dispenseInterval.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.dispenseInterval.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.dispenseInterval.system ^short = "コード化された単位表現を規定するシステム"
* dispenseRequest.dispenseInterval.system ^definition = "単位をコード化して表現するシステムについてのID。"
* dispenseRequest.dispenseInterval.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.dispenseInterval.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.dispenseInterval.code ^short = "単位のコード化された形式"
* dispenseRequest.dispenseInterval.code ^definition = "単位を表現するシステムで機械処理できる形式での単位。"
* dispenseRequest.dispenseInterval.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.dispenseInterval.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.validityPeriod ^short = "許可された払い出し期間"
* dispenseRequest.validityPeriod ^definition = "このエレメントは処方の有効期間（処方が失効する日）を示す。"
* dispenseRequest.validityPeriod.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.validityPeriod.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.validityPeriod.start ^short = "境界を含む開始時刻"
* dispenseRequest.validityPeriod.start ^definition = "期間の開始を示す。境界も含まれる。"
* dispenseRequest.validityPeriod.start ^comment = "このエレメントが設定されていなければ、下限が不明であることを示す。"
* dispenseRequest.validityPeriod.end ^short = "継続中でなければ境界を含む終了時刻"
* dispenseRequest.validityPeriod.end ^definition = "期間の終了時刻。もし、期間の終了が示されていなければ、このインスタンスが生成された時点での終了時刻が不明であったか計画されていなかったかである。開始時刻(start)は過去であることもあり、終了時刻(end)は未来であることもあり、その時点での見込みあるいは予定された終了時刻を意味する。"
* dispenseRequest.validityPeriod.end ^comment = "終了時刻は全ての日付・時刻に対応する。たとえば、2012-02-03T10:00:00は2012-02-03を終了時刻(end)の値とする期間を示す。"
* dispenseRequest.numberOfRepeatsAllowed ^short = "許可された払い出し回数"
* dispenseRequest.numberOfRepeatsAllowed ^definition = "最初の払い出しに追加で許可された払い出し回数（リフィル、日本では分割処方であるが制度的に一致しない)を示す整数であり、患者が処方された薬を受け取ることができる回数である。使用上の注意：この整数には最初の払い出しが含まれない。オーダーが「30錠に加えて3回繰り返し調剤可」であれば、このオーダーで合計4回、120錠が患者に受け渡される。処方者は0回のリフィルが許可されていると示すことで、初回の払い出し以外を認めないことを明示することができる。"
* dispenseRequest.numberOfRepeatsAllowed ^comment = "もし、許可された払い出し回数を表示するのであれば、この数字に1を足すこと。"
* dispenseRequest.quantity 1.. MS
* dispenseRequest.quantity ^short = "調剤量"
* dispenseRequest.quantity ^definition = "1回の調剤で払い出される薬剤の量"
* dispenseRequest.quantity ^comment = "このエレメントはどのような量を表現するか定義するためにコンテキストにあわせてよく定義される。したがって、どのような単位でも利用することができる。使用されるコンテキストによってcomparatorエレメントで値が定義されることもある。"
* dispenseRequest.quantity.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.quantity.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.quantity.value 1..
* dispenseRequest.quantity.value ^short = "調剤量"
* dispenseRequest.quantity.value ^definition = "調剤量。精度を含めた値が暗示される。"
* dispenseRequest.quantity.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.quantity.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.quantity.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.quantity.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.quantity.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.quantity.unit 1..
* dispenseRequest.quantity.unit ^short = "単位⽂字列"
* dispenseRequest.quantity.unit ^definition = "単位⽂字列"
* dispenseRequest.quantity.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.quantity.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.quantity.system 1..
* dispenseRequest.quantity.system = "urn:oid:1.2.392.200119.4.403.1" (exactly)
* dispenseRequest.quantity.system ^short = "医薬品単位略号を識別するURL"
* dispenseRequest.quantity.system ^definition = "医薬品単位略号を識別するURL。urn:oid:1.2.392.200119.4.403.1で固定される。"
* dispenseRequest.quantity.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.quantity.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.quantity.code 1..
* dispenseRequest.quantity.code ^short = "医薬品単位略号。"
* dispenseRequest.quantity.code ^definition = "医薬品単位略号。"
* dispenseRequest.quantity.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.quantity.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.expectedSupplyDuration ^short = "調剤⽇数"
* dispenseRequest.expectedSupplyDuration ^definition = "供給される製品が使用されるか、あるいは払い出しが想定されている時間を指定する期間。"
* dispenseRequest.expectedSupplyDuration ^comment = "状況によっては、この属性は物理的に供給される量というよりも、想定されている期間に供給される薬剤の量を指定する数量の代わりに使われることもある。たとえば、薬剤が90日間供給される（オーダーされた量に基づいて）など。可能であれば、量も示した方がより正確になる。expectedSupplyDurationは外部要因に影響をうけることのある予測値である。"
* dispenseRequest.expectedSupplyDuration.id ^short = "エレメント間参照のためのユニークID"
* dispenseRequest.expectedSupplyDuration.id ^definition = "エレメント間参照のためのユニークID。空白を含まない全ての文字を使ってもよい(MAY)。"
* dispenseRequest.expectedSupplyDuration.value 1..
* dispenseRequest.expectedSupplyDuration.value ^short = "調剤⽇数"
* dispenseRequest.expectedSupplyDuration.value ^definition = "調剤⽇数"
* dispenseRequest.expectedSupplyDuration.value ^comment = "暗示された精度については常に尊重すべきである。貨幣計算では制度に関する独自のルールがある（会計についての標準的な教科書を参照すること）。"
* dispenseRequest.expectedSupplyDuration.comparator ..0
* dispenseRequest.expectedSupplyDuration.comparator ^short = "< | <= | >= | > - 値の解釈法"
* dispenseRequest.expectedSupplyDuration.comparator ^definition = "実際の値が計測して示された値よりも大きいのか小さいのかなど、値がどのように解釈され、表現されるのかを示している。たとえば、もし、comparatorエレメントが\"<\"であれば、実際の値は示された値よりも小さい(<)。"
* dispenseRequest.expectedSupplyDuration.comparator ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.expectedSupplyDuration.comparator ^requirements = "計測法に制限があって値が<5ug/L や >400mg/L として示されるような場合でも値を扱えるようなフレームワークが必要である。"
* dispenseRequest.expectedSupplyDuration.unit 1..
* dispenseRequest.expectedSupplyDuration.code = #d (exactly)
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org" (exactly)
* dispenseRequest.expectedSupplyDuration.unit = "⽇" (exactly)
* dispenseRequest.expectedSupplyDuration.unit ^short = "調剤⽇数の単位"
* dispenseRequest.expectedSupplyDuration.unit ^definition = "調剤⽇数の単位。「⽇」固定。"
* dispenseRequest.expectedSupplyDuration.unit ^comment = "FHIRの文字列は1MB以上の大きさとなってなはらない(SHALL NOT)。"
* dispenseRequest.expectedSupplyDuration.unit ^requirements = "コンテキストによってさまざまな単位の表現がある。固定された特定の表現が求められることがある。たとえば、mcgはmicrogramを表す。"
* dispenseRequest.expectedSupplyDuration.system 1..
* dispenseRequest.expectedSupplyDuration.system ^short = "UCUM単位コードを識別するURI"
* dispenseRequest.expectedSupplyDuration.system ^definition = "UCUM単位コードを識別するURI。固定値。"
* dispenseRequest.expectedSupplyDuration.system ^comment = "以下参照。 http://en.wikipedia.org/wiki/Uniform_resource_identifier"
* dispenseRequest.expectedSupplyDuration.system ^requirements = "システムによって定義される単位のコードを把握しておく必要がある。"
* dispenseRequest.expectedSupplyDuration.code 1..
* dispenseRequest.expectedSupplyDuration.code ^short = "「⽇」を表すUCUM単位コード"
* dispenseRequest.expectedSupplyDuration.code ^definition = "「⽇」を表すUCUM単位コード。固定値。"
* dispenseRequest.expectedSupplyDuration.code ^comment = "UCUMが推奨されるシステムではあるが、SNOMED CT(慣用単位のために）やISO 4217を通貨のために利用することができる。コンテキストによっては特定なシステムによるコードが付加的に求められることもある。"
* dispenseRequest.expectedSupplyDuration.code ^requirements = "どのような形式であっても機械処理できる単位形式であることが求められる。UCUMは量についての単位を提供し、SNOMED CTは他に関心のある単位を提供する。"
* dispenseRequest.performer ^short = "想定された払い出し薬局"
* dispenseRequest.performer ^definition = "処方者によって指定される調剤・払い出しを行うと想定されているOrganizationを示す。\r\n\r\nIndicates the intended dispensing Organization specified by the prescriber."
* dispenseRequest.performer ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* substitution ^short = "後発医薬品への変更可否情報"
* substitution ^definition = "後発医薬品への変更可否情報。代替薬剤を払い出してよいかどうかを示している。代替薬剤を使用しなければいけない場合もあれば、使用しない場合もある。このブロックでは処方者の意図が示される。もし、何も指定されていなければ代替薬品を用いてもよい。"
* substitution.id ^short = "内部エレメントを参照するためのユニークID"
* substitution.id ^definition = "リソース内のエレメントを参照（内部参照）するためのユニークなID。空白を含まなければどのような文字列であってもよい。"
* substitution.allowed[x] only CodeableConcept
* substitution.allowed[x] ^short = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^definition = "後発医薬品への変更可否情報。"
* substitution.allowed[x] ^comment = "代替品が許可されるかどうかは無視できないので、このエレメントはmodifierとしてラベルされる。"
* substitution.allowed[x].coding 1..1
* substitution.allowed[x].coding ^short = "後発品変更不可コード"
* substitution.allowed[x].coding ^definition = "後発品変更不可コード。"
* substitution.allowed[x].coding.system 1..
* substitution.allowed[x].coding.system = "urn:oid:1.2.392.100495.20.2.41" (exactly)
* substitution.allowed[x].coding.system ^short = "後発品変更不可コードを識別するURI"
* substitution.allowed[x].coding.system ^definition = "後発品変更不可コードを識別するURI。固定値。"
* substitution.allowed[x].coding.code 1..
* substitution.allowed[x].coding.code ^short = "後発品変更不可コード"
* substitution.allowed[x].coding.code ^definition = "後発品変更不可コード。"
* substitution.allowed[x].coding.display ^short = "後発品変更不可コード表示名"
* substitution.allowed[x].coding.display ^definition = "後発品変更不可コード表示名。"
* substitution.reason ^short = "代替品を提供した（あるいは、しなかった）理由"
* substitution.reason ^definition = "代替品にしなければならなかった、あるいは代替品が認められなかった理由を示す。"
* substitution.reason ^comment = "代替品の理由を表す一般的パターンに全てのターミノロジーが適応しているわけではない。情報モデルはCodeableConceptではなく、直接Codingをを使用してテキストやコーディング、翻訳、そしてエレメントと事前条件、事後条件の関係について管理するためにその構造を提示する必要がある。"
* priorPrescription ^short = "前回のオーダー/処方"
* priorPrescription ^definition = "関連する先行オーダーや処方を表現するMedicationRequest Resouceへのリンク。"
* priorPrescription ^comment = "参照先は実存するFHIR Resourceでなければならず(SHALL)、解決可能(アクセスコントロールや、一時的に利用不可であることなどは許容される)でなければならない(SHALL)。解決の方法はURLから取得可能であるか、Resouce型が適応できるかどうか、正規のURLとして絶対的参照を扱うことができるか、ローカルのレジストリ／リポジトリから参照することができるかである。"
* detectedIssue ^short = "実施時の臨床的問題"
* detectedIssue ^definition = "患者に対して1回以上の実施されたか提案された診療行為によって、実際に起きたあるいは起きる可能性のある臨床的問題。たとえば、薬剤官相互作用や重複治療、薬剤量についての警告など。DetectedIssueリソースへの参照。"
* detectedIssue ^comment = "このエレメントは意思決定支援システムや臨床医によって指摘された問題点を扱うことができ、問題を表すためのステップについての情報を扱ってもよい。"
* eventHistory ^short = "ライフサイクルで関心のあるイベントのリスト"
* eventHistory ^definition = "このリソースの現在のバージョンをユーザーから見て関係していそうなキーとなる更新や状態遷移と識別される過去のバージョンのこのリソースあるいは調剤請求あるいはEvent ResourceについてのProvenance resourceへの参照。"
* eventHistory ^comment = "このエレメントには全てのバージョンのMedicationRequestについてのProvenanceが取り込まれているわけではない。「関連する」あるいは重要と思われたものだけである。現在のバージョンのResouceに関連したProvenance resouceを含めてはならない(SHALL NOT)。（もし、Provenanceとして「関連した」変化と思われれば、後の更新の一部として取り込まれる必要があるだろう。それまでは、このバージョンを_revincludeを使ってprovenanceとして指定して直接クエリーを発行することができる。全てのProvenanceがこのRequestについての履歴を対象として持つべきである。）"

// ==============================
//   Extension 定義
// ==============================
Extension: JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount
Id: 996ef0bf-8b22-46e5-bc34-46c7bd6c6926
Title: "JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
Description: "頓用回数"
* ^meta.lastUpdated = "2021-12-03T12:47:27.169+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount"
* ^date = "2022-03-07"
* ^purpose = "頓用の場合など調剤量を錠数ではなく回数で表現したい場合の回数を格納する拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* . ..1
* . ^short = "頓⽤回数を表現する拡張"
* . ^definition = "頓⽤回数を表現する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_ExpectedRepeatCount" (exactly)
* value[x] 1..
* value[x] only integer
* value[x] ^short = "頓用回数"
* value[x] ^definition = "頓用回数"

Extension: JP_MedicationRequest_DispenseRequest_InstructionForDispense
Id: 91cc41f3-a701-4cbe-b9bc-7d810bb7e9e5
Title: "JP_MedicationRequest_DispenseRequest_InstructionForDispense"
Description: "調剤指示。薬剤単位の調剤指示を表現するための拡張"
* ^meta.lastUpdated = "2021-12-03T14:50:05.953+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense"
* ^date = "2022-03-07"
* ^purpose = "薬剤単位の調剤指示を表現するための拡張"
* ^context.type = #element
* ^context.expression = "MedicationRequest.dispenseRequest"
* id ..0
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DispenseRequest_InstructionForDispense" (exactly)
* value[x] only string or CodeableConcept

Extension: JP_MedicationRequest_DosageInstruction_Device
Id: 6d3333b3-d0f9-4b48-bd78-abfcbaad19fe
Title: "JP_MedicationRequest_DosageInstruction_Device"
Description: "投与装置を格納する拡張"
* ^meta.lastUpdated = "2021-12-03T16:24:50.287+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device"
* ^date = "2022-03-07"
* ^purpose = "投与装置を格納する拡張"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ^short = "投与装置"
* . ^definition = "投与装置を格納する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Device" (exactly)
* value[x] only Reference

Extension: JP_MedicationRequest_DosageInstruction_Line
Id: 3c153c8f-bc10-4109-8552-0a8ad65498d9
Title: "JP_MedicationRequest_DosageInstruction_Line"
Description: "指示ラインを格納するための拡張"
* ^meta.lastUpdated = "2021-12-03T16:23:26.879+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line"
* ^date = "2022-03-07"
* ^purpose = "指示ラインを格納するための拡張"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationAdministration.dosage"
* . ^short = "指示ライン"
* . ^definition = "指示ラインを格納する拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_Line" (exactly)
* value[x] only CodeableConcept

Extension: JP_MedicationRequest_DosageInstruction_PeriodOfUse
Id: a6ce827d-1083-49c4-b538-201c18de518d
Title: "JP_MedicationRequest_DosageInstruction_PeriodOfUse"
Description: "投与開始日を格納する拡張"
* ^meta.lastUpdated = "2021-12-03T16:16:39.185+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse"
* ^date = "2022-03-07"
* ^purpose = "処方日とは別に明示的に投与・内服開始日を指定するため。"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* . ..1
* . ^short = "投与期間の開始日を明示するための拡張"
* . ^definition = "MedcationRequestの投与期間の開始日を明示するための拡張"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_PeriodOfUse" (exactly)
* value[x] only Period
* value[x] ^short = "投与期間を表す"
* value[x] ^definition = "MedicationRequestに投与期間の開始日を明示するための拡張"
* value[x].start 1..
* value[x].start ^short = "投与期間の開始日"
* value[x].start ^definition = "明示された投与期間の開始日"

Extension: JP_MedicationRequest_DosageInstruction_UsageDuration
Id: d2a74cc1-3928-4f1d-afe8-e7b49a2b4b04
Title: "JP_MedicationRequest_DosageInstruction_UsageDuration"
Description: "隔⽇投与など、服⽤開始⽇から終了⽇までの⽇数と実投与⽇数が異なる場合に、実投与⽇数を明⽰したい場合に使⽤する拡張"
* ^meta.lastUpdated = "2021-12-03T16:20:07.109+00:00"
* ^url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration"
* ^date = "2022-03-07"
* ^purpose = "隔⽇投与など、服⽤開始⽇から終了⽇までの⽇数と実投与⽇数が異なる場合に、実投与⽇数を明⽰したい場合に使⽤する拡張"
* ^context[0].type = #element
* ^context[=].expression = "MedicationRequest.dosageInstruction"
* ^context[+].type = #element
* ^context[=].expression = "MedicationDispense.dosageInstruction"
* id ..0
* id ^short = "エレメント間参照のためのID"
* id ^definition = "JP Coreでは使用されない。"
* url = "http://jpfhir.jp/fhir/core/Extension/StructureDefinition/JP_MedicationRequest_DosageInstruction_UsageDuration" (exactly)
* value[x] only Duration
* value[x] ^short = "実投与⽇数"
* value[x] ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].id ..0
* value[x].id ^short = "エレメント間参照のためのID"
* value[x].id ^definition = "JP Coreでは使用されない。"
* value[x].value 1..
* value[x].value ^short = "実投与日数"
* value[x].value ^definition = "隔日投与などで実投与日数と処方期間が異なる場合に用いられる。"
* value[x].comparator ..0
* value[x].unit 1..
* value[x].code = #d (exactly)
* value[x].system = "http://unitsofmeasure.org" (exactly)
* value[x].unit = "日" (exactly)
* value[x].unit ^short = "実投与日数単位"
* value[x].unit ^definition = "「日」で固定される"
* value[x].system 1..
* value[x].system ^short = "UCUM"
* value[x].system ^definition = "単位コード UCUMを識別するURI。固定値。"
* value[x].code 1..
* value[x].code ^short = "単位コードUCUMにおける実投与⽇数の単位"
* value[x].code ^definition = "単位コードUCUMにおける実投与⽇数の単位。dで固定される"