import json

type
  Message* = object
    username*: string
    message*: string

proc parseMessage*(data: string): Message =
  let dataJson = parseJson(data)
  result.username = dataJson["username"].getStr()
  result.message  = dataJson["message"].getStr()

proc createMessage*(username, message: string): string =
  result = $( % {
    "username": %username, # 根据参数类型转成特定的Json类型
    "message" : %message
  } ) & "\c\l"

when isMainModule:
  block test:
    let data = """{ "username": "John", "message": "Hi!" }"""
    let parsed = parseMessage(data)
    doAssert parsed.username == "John"
    doAssert parsed.message  == "Hi!"
  block:
    let expected = """{"username":"dom","message":"hello"}""" & "\c\l"
    doAssert createMessage("dom", "hello") == expected
  block all:
    var a = { "a": 1, "b": 2 }
    echo repr(a)
    echo "All tests passed!"