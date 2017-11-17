//: Playground - noun: a place where people can play

import UIKit

// 例：求2得N次方 前置运算符 ^
prefix operator ^
prefix func ^(vector: Double)-> Double{
    return pow(2, vector)
}
print(^5)

// 后置：返回2次方
postfix operator  ^
postfix func ^ (vector: Int) -> Int {
    return vector * vector
}
print(5^)  // 25


//中间：计算N的M次方，左结合，优先级为255 
//必须写优先级
//precedencegroup Additive {higherThan: Range}
//precedencegroup Multiplicative {higherThan: Additive}
//precedencegroup Equivalence {
//    higherThan: Comparative
//    lowerThan: Additive
//}

infix operator ^^ : MultiplicationPrecedence
precedencegroup MultiplicationPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}
func ^^(left: Double, right: Double) -> Double {
    return pow(left, right)
}
print(2 ^^ 10 - 2 ^^ 3)  // 1024 － 8 ＝ 1016

//  自定义运算符仅能包含这些字符：
//  / = - + * % < >！& | ^。~

//  运算符位置：
//  前置运算符    prefix
//  中间运算符    infix
//  后置运算符    postfix

//  结合性        associativity
//  可取值范围    left，right和none
//
//  优先级        precedence
//  可取值范围    0～255

