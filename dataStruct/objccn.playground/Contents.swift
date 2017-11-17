//: Playground - noun: a place where people can play

import Cocoa
import XCPlayground

let sineArraySize = 64
let frequency1 = 4.0
let phase1 = 0.0
let amplitudle = 2.0
let sineWave = (0..<sineArraySize).map {
    amplitudle * sin(2.0 * M_PI / Double(sineArraySize) * Double($0) * frequency1 + phase1)
}

func plotArrayInPlayground<T>(arrayToPlot:Array<T>, title:String){
    for currentValue in arrayToPlot{
        let xcp:XCPlaygroundPage  = XCPlaygroundPage.currentPage
        xcp.captureValue(currentValue,withIdentifier: title)
    }
}

plotArrayInPlayground(sineWave, title: "Sine wave 1")

let frequency2 = 1.0// 频率
let phase2 = M_PI / 2.0 // 相位
let amplitude2 = 1.0 //振幅
let sineWave2 = (0..<sineArraySize).map{
amplitude2 * sin(2.0 * M_PI / Double(sineArraySize) * Double($0) * frequency2 + phase2)
}
plotArrayInPlayground(sineWave2, title: "sine wave 2")

//infix operator  +++ {}
//func +++ (a: [Double], b: [Double]) -> [Double] {
//    assert(a.count == b.count, "Expected arrays of the same length, instead got arrays of two different lengths")
//
//    var result = [Double](count:a.count, repeatedValue:0.0)
//    
//    vDSP_vaddD(a, 1, b, 1, &result, 1, UInt(a.count))
//    return result
//}
//
//var combinedSineWave = [Double](count:sineArraySize, repeatedValue:0.0)
//for currentIndex in 0..<sineArraySize {
//    combinedSineWave[currentIndex] = sineWave[currentIndex] + sineWave2[currentIndex]
//}
//
//let combinedSineWave2 = sineWave +++ sineWave2

//plotArrayInPlayground(combinedSineWave, title: "Combined wave (loop addition)")
//plotArrayInPlayground(combinedSineWave2, title: "Combined wave (Accelerate)")

