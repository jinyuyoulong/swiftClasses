//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var arr = ["22","433"]
arr.removeAll()
print("\(Unmanaged<AnyObject>.passRetained(arr as AnyObject))")
arr.append("45")
arr.append("43")
arr.removeAll(keepingCapacity: true)
print("\(Unmanaged<AnyObject>.passRetained(arr as AnyObject))")
