# Animal クラスの定義
class Animal
  # プロパティの定義
  atype: "Animal"

  # コンストラクタを定義
  constructor: (@name) ->
    # name プロパティは自動的に定義される

  # メソッドを定義
  print: ->
    console.log "名前は#{@name}、種類は#{@atype}です。"

# インスタンスの生成
taro = new Animal "Shigeta"
taro.print()
