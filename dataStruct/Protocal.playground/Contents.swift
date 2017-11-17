//: Playground - noun: a place where people can play

import UIKit

protocol SomeProtocol {
    func signatureFinshWithImage(str:String)-> Bool
}

protocol Anotherprotocol : class {
    func method2()->String
}
class testClass: SomeProtocol {
    var haha:String?

    func signatureFinshWithImage(str: String) -> Bool {
        self.haha = str
        return true
    }
}

class Class1 {
    var mdelegate : SomeProtocol

    init (delegate: SomeProtocol){
        self.mdelegate = delegate
    }

    func method1() {
        self.mdelegate.signatureFinshWithImage("jaja")
    }
}


let classss = Class1(delegate: testClass())
classss.method1()

