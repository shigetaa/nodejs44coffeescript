# CoffeeScriptとは

## なぜCoffeeScript

今では、おおくの開発者がCoffeeScriptを利用してJavaScriptを書いています。
CoffeeScriptは実行されるときにJavaScriptに変換されて実行されるのです。
つまり、CoffeeScriptで書けば、結果的にはJavaScriptのコードを書いたことになるのです。
しかも、CoffeeScriptはJavaScriptに比べて簡潔で、プログラムの可読性が向上しています。

> CoffeeScript -> (コンパイル) -> JavaScript -> (実行)


## CoffeeScript のインストール

CoffeeScriptのインストールは、npm を利用してインストールを行う事ができます。
以下のコマンドを実行するとインストールが完了します。

```bash
npm i -g coffee-script
```

## プログラムの実行方法

簡単なプログラムを書いて、その実行方法を確認していきましょう。
`test-sum.coffee`と言う名前のファイルを作成して以下の様に記述してみます。
```javascript
v = 0
for i in [1..10]
  v += i
console.log(v)
```

実行するには、以下のコマンドを実行します。
```bash
coffee test-sum.coffee
```
```bash
55
```

また、明示的に、JavaScriptへ変換するには、次の様に記述します。
以下のコマンドを実行すると、同じディレクトリに `test-sum.js` 変換したファイルが生成されます。
```bash
coffee -c test-sum.coffee
```

## CoffeeScript の基本文法をチェック

では、CoffeeScript の基本文法をチェックしていきましょう。
まず、JavaScript と違って、文末にセミコロン「 `;` 」が不要です。
```javascript
console.log "Hello"
```
ただし、複数の分を一行に記述したい場合は、セミコロンを使って文を区切る必要があります。
```javascript
console.log "Hello"; console.log "World"
```
上記の例を見ても分かると思いますが、関数やメソッドの引数を指定する際に括弧 (...) が不要です。
下記の記述は巻子を二つ並べて記述したものです。
```javascript
console.log Math.floor 3.15
```
上記の記述は以下の様に記述したのと同じ意味になります。したがって「３」が表示されます。
```javascript
console.log( Math.floor(3.15) )
```
括弧は書いても書かなくても良いのですが、引数の対応関係が不明になる場合には、明示的に括弧で囲っておくとよいでしょう。

### CoffeeScript のコメント

CoffeeScript では、コメントが2種類あります。
単一行コメントが「 `#` 」、複数行コメントが「 `### ... ###` 」の形式です。
```coffee
# 単一行コメント

###
複数行
コメント
###
```
単一行のコメントは、コンパイル時に消去されますが、複数行のコメントは、生成された、JavaScript にもそのまま、複数行のコメントとして記述されます。

### 制御構文はインデントでレベルを明示する
### 変数の宣言
### 文字列について

## 真と偽

## 配列

## 演算子
### 範囲の比較を行う
### 変数の存在をチェックする
### 連続する数値の表現、範囲演算子

## 制御構文
### if..else..
### if..then..else
### unless
### switch..when..else
### while / until
### for..in / for..of

## 関数の記述
### 引数のデフォルト値
### 可変長引数
### 無名関数

## オブジェクト指向
### クラス定義
### 継承
### 静的メンバー
### メンバーを動的に追加する
