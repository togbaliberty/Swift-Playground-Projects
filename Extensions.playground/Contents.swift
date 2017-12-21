//: Playground - noun: a place where people can play

import UIKit

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm

print("One inch is \(oneInch) meters")

let threeFeet = 3.0.ft

print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m

print("A marathon is \(aMarathon) meters long")

struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var size = Size()
    var point = Point()
}

let defaultRect = Rect()
let memberwiseRect = Rect(size: Size(width: 5.5, height: 7.2), point: Point(x: 1.5, y: 2.0))

extension Rect {
    init (center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        
        self.init(size: size, point: Point(x: originX, y: originY))
    }
}

let centerRect = Rect(center: Point(x: 5.0, y: 5.0), size: Size(width: 3.5, height: 3.5))

extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hi Extensions")
}

extension Int {
    mutating func squared() {
        self = self * self
    }
}

var fiveInt = 5
fiveInt.squared()

