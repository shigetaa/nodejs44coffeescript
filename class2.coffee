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

class Dog extends Animal
  atype: "Dog"
  print: ->
    console.log "わんわん"
    super()

class Cat extends Animal
  atype: "Cat"
  print: ->
    console.log "にゃーにゃー"
    super()

# インスタンスの生成
taro = new Dog "Taro"
taro.print()

mike = new Cat "Mike"
mike.print()