//: Playground - noun: a place where people can play

import Cocoa

class Person {
    var name: String?
    var age: Int = 0
}

///////////////////////////////////
let p = Person()
p.name = "name"
p.age = 23

let mirror: Mirror = Mirror(reflecting: p)

print(mirror.subjectType)

for p in mirror.children {
    let propertyNameString = p.label! // 使用!因为label 是 optional类型
    let v = p.value // 这个是属性的值，name 是可选属性打印为Optional("小强")

    print("propertyNameString \(propertyNameString)")
    print("value is \(v)")

}
