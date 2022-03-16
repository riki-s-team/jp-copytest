# FHIR JPCore ver1.1用テストサイト
FHIRのJpCore環境作成のためのサンプルサイトです。

# 注意事項
このドキュメントは日本医療情報学会NeXEHRS課題研究会「HL7®FHIR® 日本実装検討WG」で作成した実装ガイドのドラフトVer.1.1 です。このバージョンは日本HL7協会による承認を受けていません。今後、予告なく内容に変更があります。実装や利用は全て自己責任で行ってください。
このページの実装ガイドは常に修正、追加がある改訂版開発用ページです。

## クライアント環境
* [FHIR Shorthand & IG Publiser環境作成方法 **(作成中)** ](docs/enviroment.md)

## クライアントコンパイル手順
1. ターミナル（コマンドプロンプト）を開き、対象ディレクトリにカレントを移動する
1. Sushiを実行し、エラーが発生していないことを確認する
1. 初めて実行する場合は、_updatePublisher.bat(windows),_updatePublisher.sh(linux,mac)を実行する。
   1. igpublisher.jarのダウンロードの許可
   1. スクリプト類のダウンロードの許可
1. _genonce.bat(windows), _genonce.sh(linux,mac)を実行する
1. OutputフォルダにHtml一式が格納される

## GitHubAction 自動ビルド＆デプロイ
* [ビルド状況](https://github.com/findex-miyakawa/fhir-jpcore-ig-test/actions)
* [ビルド警告情報](https://findex-miyakawa.github.io/fhir-jpcore-ig-test/qa.html)
* [最新ビルド結果](https://findex-miyakawa.github.io/fhir-jpcore-ig-test/)

## FSH & Markdown記載ルール
* [FHIR Shorthandコーディングルール **(作成中)** ](docs/fishingrule.md)
* [プロファイル説明Markdown編集ルール **(作成中)** ](docs/template_intronotes.md)
* [github 更新ルール **(作成中)** ](docs/githubflow.md)
* [JP Core IG用語 **(作成中)** ](docs/terminology_ig.md)

## 資料・学習用サイト等
* [FHIR Shorthand FSH School(外部リンク)](https://fshschool.org/)
* [FHIR Shorthand Overview(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/overview.html)
* [FHIR Shorthand Language Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/reference.html)
* [FHIR Shorthand Quick Reference(外部リンク)](https://build.fhir.org/ig/HL7/fhir-shorthand/FSHQuickReference.pdf)
* [Markdown記法 Basic(外部リンク)](https://www.markdownguide.org/basic-syntax/)
* [Markdown記法 Extended(外部リンク)](https://www.markdownguide.org/extended-syntax/)
