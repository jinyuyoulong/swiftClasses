//: Playground - noun: a place where people can play

import Cocoa

var mj:Int
var gj:Int
var xj:Int = 0
// 1mj=3 1gj=5 ,3xj=1

for mj=0; mj<=33; mj++ {
    for gj=0; gj<=20; gj++ {
        xj = 100-mj-gj

        if xj%3==0 && mj*3+gj+5+xj/3==100{
                print("公鸡：%d，母鸡：%d,小鸡：%d",gj,mj,xj)
        }
    }
}
