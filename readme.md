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
```coffee
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
```coffee
console.log "Hello"
```
ただし、複数の分を一行に記述したい場合は、セミコロンを使って文を区切る必要があります。
```coffee
console.log "Hello"; console.log "World"
```
上記の例を見ても分かると思いますが、関数やメソッドの引数を指定する際に括弧 (...) が不要です。
下記の記述は巻子を二つ並べて記述したものです。
```coffee
console.log Math.floor 3.15
```
上記の記述は以下の様に記述したのと同じ意味になります。したがって「３」が表示されます。
```coffee
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

CoffeeScript にも、JavaScript と同じように、`if` `switch` `for` `while` などの制御構文があります。
ただし、JavaScript と違って、インデントでブロックを表現することになっています。
```coffee
name = "Shigeta"
if name.length > 1
  console.log "Hello, #{name}"
else
  console.log "empty name"
```

### 変数の宣言

JavaScript では変数を宣言する際、`var` キーワードが必要ですが、CoffeeScript では不要です。値を最初に代入した場所で変数が生成され、スコープが決定されます。
```coffee
hoge = 30
```
これを JavaScript にコンパイルすると以下の様になります。
```javascript
var hoge;
hoge = 30;
```

### 文字列について

文字列リテラルは、ダブルクォーテーション「 `"` 」あるいは、シングルクォーテーション「 `'` 」で囲って表現します。ダブルクォーテーションで囲った文字列には、変数を埋め込んで記述する事ができます。
```coffee
# 変数の宣言
name = "Shigeta"
age = 44
console.log "私は、#{name}と申します。"
console.log "今年で、#{age}才になります。"
```
上記のプログラムを実行すると、文字列の中の「 `#{変数}` 」が展開されて、以下の様に表示されます。
```bash
coffee str.coffee
```
```bash
私は、Shigetaと申します。
今年で、44才になります。
```
複数行の文字列を記述するのに便利な、ヒアドキュメントも用意されています。
これは、文字列展開のある `"""` と 展開のない `'` の二種類があります。

```coffee
name = "Shigeta"
age = 44
message = """
  私は、#{name}と申します。
    今年で、#{age}才になります。
  """
console.log message
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee str-hdoc.coffee
```
```bash
私は、Shigetaと申します。
  今年で、44才になります。
```
上記の結果を見ると分かる様に、ヒアドキュメントの中でも文字列の展開もされて、「私は、」行頭のインデントを無視する様になってます。

## 真と偽

JavaScript では真偽値として、`true` と `false` を利用できました。
CoffeeScript では、これに加えて `on` と `off` 、`yes` と `no` を指定することができます。
意味としては、`true` と `false` と同じなのですが、文脈に応じて使い分けるとプログラムが読みやすくなるでしょう。

## 配列

配列やオブジェクトを指定する時、JavaScript と同じく、配列を `[]`で、オブジェクトを `{}` で表現出来ます。
ただし、配列の区切り文字として、カンマ「 `,` 」だけでなく改行も利用出来ます。
また、最後の要素がカンマで終わってもエラーにならない様になってます。
```coffee
fruits = [
  "Orange"
  "Banana"
  "Apple"
]

info = {
  id: "a1234"
  price: 300
  origin: "Osaka"
};

oslist = ["Windows", "OS X", "Linux",]
```
YAMLと同じように、インデントで階層を付けると、入れ子のオブジェクトを表現することができます。
[YAMLとは](https://github.com/shigetaa/nodejs43data#yaml%E5%BD%A2%E5%BC%8F%E3%81%A8%E3%81%AF)
```coffee
fruits = 
  Orange: 
    price: 200
    origin: "Osaka"
  Banana:
    price: 240
    origin: "Kobe"
  Apple:
    price: 400
    origin: "Kyoto"

console.log fruits
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee like-yaml.coffee
```
```javascript
{
  Orange: { price: 200, origin: 'Osaka' },
  Banana: { price: 240, origin: 'Kobe' },
  Apple: { price: 400, origin: 'Kyoto' }
}
```

## 演算子

演算子は、JavaScript とほぼ同じですが、以下のような演算子も用意されています。
| CoffeeScript | JavaScript | 利用例        |
| :----------- | :--------- | :------------ |
| is           | ===        | a is "hoge"   |
| isnt         | !==        | a isnt "hoge" |
| not          | !          | not true      |
| and          | &&         | a and b       |
| or           | \|\|       | a or b        |

その他に気を付けなければならないのが、CoffeeScript で比較演算子「`==`」は、JavaScript の「`===`」に変換されるという点です。
JavaScript で「`===`」は厳密な比較を表し、変数の値だけではなく型が一致してないと false が返ります。

### 範囲の比較を行う

JavaScript では「 `10 <= x && x <=30` 」のように記述することがあります。
これは、10以上30以下を表す式です。
CoffeeScript では「 `10 <= x <= 30` 」と書くことができます。
両者を比較してみると、CoffeeScript の方が直感的に記述出来る事がわかります。

### 変数の存在をチェックする

変数が未定義かどうか調べるのに「 `?` 」演算子を利用することが出来ます。
これは、変数が未定義で、かつ、null でないかどうかを調べる事ができます。
```coffee
obj = { name: "Shigeta", age: 30}
console.log obj.name?   # 結果 -> true
console.log obj.weight? # 結果 -> false
```
この「 `?` 」演算子を利用することで、変数が未定義の場合にデフォルト値を指定する事ができます。
```coffee
value = sval ? 100
```
CoffeeScript では 「 `?` 」が**存在演算子**となる為、JavaScript の参考演算子は利用できません。

### 連続する数値の表現、範囲演算子

範囲演算子「 1`..`10 」が利用できるので、数値配列を手軽に生成出来ます。
例えば、１から１０の値を生成する場合には、以下の様に記述できます。
```coffee
range = [1..10]
```
また、範囲演算子には「 1`...`10 」(ドットが3つ)の物もあり、これを使う場合は、末尾の値が除かれます。
例えば、「 1`...`10 」と書いた場合は、1から9までの値をしていした「 1`..`9 」と等しくなります。

## 制御構文

CoffeeScript の制御構文を1つずつ確認していきます。
CoffeeScript の制御構文ブロックはインデントで表現します。

### if..else..

インデントを使うので、条件分岐はシンプルに記述できます。
以下の様に`if`構文を連続でつなぐことも出来ます。
```coffee
age = 18
if age < 20
  console.log "少年"
else if age < 30
  console.log "青年"
else if age < 50
  console.log "中年"
else
  console.log "老人"
```
そして、**後置形式**の`if`も指定出来ます。
この場合は、条件式が真の時のみ、前方の式が実行されることになります。
```coffee
x = 50
console.log "30" if x is 30
console.log "50" if x is 50
console.log "70" if x is 70
```
上記の、プログラウ実行すると、`x`が50 なので、`if x is 50`を指定した式が実行されます

### if..then..else
また、一行で`if`構文を書くときには、`if` .. `then` .. `else` ..を使うことができ、JavaScript の三項演算子の様に使うことができます。
```coffee
age = 12
price = if age > 12 then 500 else 150
console.log "#{age}才は、#{price}円です"
```
上記のプログラムを実行すると、以下の様に表示されます。

```bash
coffee if.coffee
```
```bash
12才は、150円です
```

### unless

`if` 構文は、条件式が `true` の時に続くブロックを実行しましたが、
`unless` 構文は条件式が `false` の場合に続くブロックを実行します。
```coffee
v = 20
unless v is 15
  console.log "#{v} != 15"
```

### switch..when..else

式の値に応じて処理を分岐するのが、`switch`構文です。
JavaScript の `switch`とは異なり、`case` 句の代わりに `when` 句を使い、
`default` 句の代わりに `else` 句を利用します。
`when` 句には、カンマで区切って複数の値を指定できます。
条件を抜けるための `break` は不要で、次の when が来たらそこで処理を自動的に抜けます。
```coffee
start = 2
switch start
  when 1
    console.log "start 1"
  when 2
    console.log "start 2"
  when 3,4,5
    console.log "start 3-5"
  else
    console.log "start else"
```
上記のプログラムを実行すると、以下の様に表示されます。

```bash
coffee switch.coffee
```
```bash
start 3-5
```

### while / until

条件式が `true` の間、繰り返しブロックを実行するのが、`while` 構文です。
これに対して条件式が `false` の間繰り返すのが、`until` 構文です。

```coffee
i = 1
while i <=5
  console.log i
  i++

console.log "---"

until i < 0
  console.log i
  i--
```
上記のプログラムを実行すると、以下の様に表示されます。

```bash
coffee while.coffee
```
```bash
1
2
3
4
5
---
6
5
4
3
2
1
0
```
### for..in / for..of

配列から順に値を取り出して特定の処理を繰り返すのが、`for .. in`構文です。
そして、オブジェクトから順に値を取り出して処理を繰り返すのが、`for .. or`構文です。

まずは、`for .. in`構文を`for-in.coffee`ファイルとして作成してみましょう。
```coffee
fruits = ["Tomato", "Banana", "Apple", "Orange"]
for name in fruits
  console.log "I like #{name}."
```
上記のプログラムを実行すると、以下の様に表示されます。

```bash
coffee for-in.coffee
```
```bash
I like Tomato.
I like Banana.
I like Apple.
I like Orange.
```

JavaScript の `for .. in`構文では、反復子の変数に要素番号が代入されるだけでしたが、CoffeeScript では、要素そのものが代入されるので便利です。
要素番号事態が必要な場合には、「 `for value, index in 配列` 」のような書式で記述できます。
```coffee
fruits = ["Tomato", "Banana", "Apple", "Orange"]
for name,index in fruits
  console.log "#{index} : #{name}."
```
上記のプログラムを実行すると、以下の様に表示されます。

```bash
coffee for-key2id-in.coffee
```
```bash
0 : Tomato.
1 : Banana.
2 : Apple.
3 : Orange.
```

次に、`for .. of`構文を`for-of.coffee`ファイルとして作成してみましょう。

```coffee
mail_info = {
	subject: "こんにちは"
	from: "shigeta@xxx.xxx"
	body: "お久しぶりです。"
}

for key, value of mail_info
  console.log "#{key} : #{value}"
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee for-of.coffee
```
```bash
subject : こんにちは
from : shigeta@xxx.xxx
body : お久しぶりです。
```

## 関数の記述

関数を記述するには、次の書式で書きます。
ちなみに、`return`を記述する必要がなく、最後の式が戻り値となります。
> ( 引数１, 引数２, ...) -> 式

では、簡単に掛け算を行う関数を定義してみます。
`func1.coffee`と言う名前のファイルを作成して以下の様に記述してみます。
```coffee
multiply = (a, b) ->
  a * b

console.log multiply 2, 3
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee func1.coffee
```
```bash
6
```

次に、二乗を計算するx2と言う関数と、四乗を計算するx4と言う関数を定義してみます。
`func2.coffee`と言う名前のファイルを作成して以下の様に記述してみます。
```coffee
x2 = (n) -> n * n
x4 = (n) -> n * n * n * n

console.log(x2(3),x4(2))
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee func2.coffee
```
```bash
9 16
```

引数が無い、関数を記述する場合には`(引数)`の部分を省略することができます。
しかし関数を呼び出す際には、関数名の後に`()`が必要になります。
また、戻り値が不要な場合は、`return`文を記述する必要があります。
```coffee
# 引数の無い関数
func = ->
  console.log "hello"
  return

# 引数の無い関数を呼び出す
func()
```

### 引数のデフォルト値

関数定義の際に、引数のデフォルト値を指定することができます。
`func3.coffee`と言う名前のファイルを作成して以下の様に記述してみます。
```coffee
# 第一引数の文字列を第二引数の文字で区切る
# 第一引数 str に文字列
# 第二引数 demi に区切り文字 初期値 ,
splitStr = (str, demi = ",") ->
  str.split(demi)

# 第二引数を省略して関数を呼び出す
s1 = "1, 2, 3"
console.log splitStr(s1)

# 第二引数の区切り文字を指定して関数を呼び出す
s2 = "a:b:c"
console.log splitStr(s2, ":")
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee func3.coffee
```
```bash
[ '1', ' 2', ' 3' ]
[ 'a', 'b', 'c' ]
```

### 可変長引数

関数定義の際に、引数の末尾に「 `...` 」と記述すると、可変長引数を指定出来ます。
可変長引数は配列の形で取得できます。
```coffee
sum = (args...) ->
  total = 0
  for arg in args
    total += arg
  total

console.log sum 1,2,3
console.log sum 3,4,5
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee func4.coffee
```
```bash
6
12
```

### 無名関数

無名関数も同じように「 `(引数)->` 」の書式で記述する事ができます。
以下は、定期的にコールバック関数を実行する setinterval()関数の利用例となっています。
一秒ごとに無名関数の形で指定したコールバック関数が実行されます。
```coffee
counter = 5
setInterval ->
  console.log counter
  counter--
  if counter is 0
    process.exit()
,1000
```
上記のプログラムを実行すると、以下の様に表示されます。
```bash
coffee func5.coffee
```
```bash
5
4
3
2
1
```

## オブジェクト指向
### クラス定義
### 継承
### 静的メンバー
### メンバーを動的に追加する
