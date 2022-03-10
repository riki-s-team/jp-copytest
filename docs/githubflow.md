# リリース運用ルール(作成中)
---

## github運用
GitHub Flowを採用する。<br/>
major version変更をともなう場合は、別reposiotyを構築する。

### brunch(分岐)役割
|ブランチ|説明|
| --- | ---|
| main | プロダクトリリースおよび開発を行なうためのブランチ。リリースはタグ付けにより区別する。mainブランチへのマージは権限のあるもののみが実施する。|
| feature | mainから分岐し、コンパイルエラーと責任者レビューを実施したらmainにマージする。featureブランチ作成は誰でも行なうことができる。mainブランチへのマージが実施されたらブランチの削除を行なう。|

### アクタ
|役割|説明|
|---|---|
|リリース責任者|mainブランチに対して、releaseタグの付与を行なう。<br/>fshファイルに対するversion,statusの一括変更等を行なう。|
|マージ責任者|freature→mainへのブランチマージを実施する。<br/>各SWGにて最低１名のMainブランチに対するマージ担当者を用意する。|
|ソース修正者|featureブランチに対する修正を行なう。<br/>原則、誰が行なってもよい。SWGを超える(**FHIR WG以外の修正を受け入れる？**)|

### 修正の流れ
* 修正者はfeatureブランチを作成しソース修正を行う。
* 修正者は修正が完了した時点で、マージ責任者に修正が終わった旨を伝達する。
  * 完了前にコンパイルを行ない、ビルドエラーが発生いないかを確認する。
  * 修正完了の報告の手段としてPull Requestを利用することも可能とする。
    * Pull Request作成時に競合が起きていないかを確認すること。
    * Pull Reqseust発行の際に、なるべくレビュー者を設定すること。

* マージ責任者は修正内容を確認し、Mainブランチにマージを実施する。
  * マージ方法はPull Requestおよび手動マージのどちらでも可能
  * マージが終わったら、featureブランチを削除を行なう。
  * マージ後ビルドが通らなくなった場合は、速やかに対策を講じること。

### コンフリクト発生時の対処
* 先勝ちルールであるため、マージする側が考慮して修正する。
* マージの判別が付かない場合は、Slack等でサポートを依頼する。

### featureブランチ命名規則
現在どのような修正を行なっているのかを分かりしやすくするため下記命名規則を適用する。
#### SWG関連の修正
feature/swg[1-6]-(修正内容) 

```
git checkout -b feature/swg3-JP_Patient_Raceの見直し
```

#### SWG関連に属さない（跨る）修正
feature/ext-(修正内容)

```
git checkout -b feature/ext-versionの一括変更
```

---
## 以下作成中
### git commit コメント

* Refactor subsystem X for readability
* Fixed bug with Y
* Update getting started documentation
* Remove deprecated methods
* Release version 1.0.0
* merge pull request XXX.
* Changing behavior of X
* Sweet new API methods

#### Isssueとの連動(作成中)

```
// (close|closed|fix|fixed|resolve|resolved) #{isssue number}

fix  fixed #
```


### 心がけ(作成中)
* 頻度よく作業前にはfetchを必ず行なうこと。
* コンフリクトを起さないためには細かく分岐・マージを繰り返すこと。

## リリース
### Version発番ルール
(major).(miner).(patch)(status)

``` 
version : 1.1.0a
```

|バージョン説明||
| --- | --- |
| major | 親fhirバージョンの変更するなどの大きな修正がともなう場合に発番する。|
| miner | 機能追加等のバージョンアップの際に採番する。 |
| patch | バグフィックス等の軽微な修正があった場合に採番する。 |
| status | リリース前にはアルファ版 a, ベータ版 bを付与する。|


### Status

### 成熟度


## Isssue
### 発番

### 記載内容
