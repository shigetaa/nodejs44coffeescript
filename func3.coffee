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