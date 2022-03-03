# FHIR JPCore ver1.0用テストサイト
FHIRのJpCore環境作成のためのサンプルサイトです。

## 環境作成
 ### Node.js
最新のLTSバージョンを取得する。npmも併せてインストールされる。
下記にてインストールを確認する。
```
# version確認
node -version
npm -version
```
### sushi
```
# install
sushi install -g fsh-sushi

# version確認
sushi -v
```

### Javaランタイム
#### JavaSDK
入手先: https://www.oracle.com/java/technologies/downloads/<br/>
ver8,11,17のLSTバージョン<br/>
**Java SDKを利用する場合はライセンス注意**
#### OpenJDK
入手先: http://jdk.java.net/
ダウンロード後解凍し、フォルダに配置する。<br/>
環境変数に対象フォルダを登録し、どの環境からでも実行できるように設定すること。

### Ruby
入手先:http://jekyllrb-ja.github.io/docs/installation/
 - Ruby+Devkitを選択する
 - ridk installを選択すること(**gemをインストールするため**)

### Jekyll
```
# install
gem install jekyll bundler
# version確認
jekyll -v
```

## 編集ツール
### Visual Studio Code
 以下のツールをインストールすること
 - VSCode FHIR Shorthand (FSH) Language Support
 - markdown all in one
 - AML Language Support by Red Hat, with built-in Kubernetes syntax support
 - Json for Visual Studio Code

## コンパイル手順
1. カレントディレクトリに移動
1. _updatePublisher.bat(windows),_updatePublisher.sh(linux,mac)を実行する
   1. igpublisher.jarのダウンロードの許可
   1. スクリプト類のダウンロードの許可
1. _genonce.bat(windows), _genonce.sh(linux,max)を実行する

## マニュアル
* [MarkDown記載方法](docs/markdown.md)
