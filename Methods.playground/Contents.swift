//: Playground - noun: a place where people can play

import UIKit

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        count += amount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()

counter.increment()

counter.increment(by: 10)

counter.reset()

struct Point {
    var x = 0.0, y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let point = Point()
let x = 5.0

if point.isToTheRightOf(x: 5.0) {
    print("This point is to the right of the line where x == \(x)")
}

struct AnotherPoint {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var anotherPoint = AnotherPoint(x: 1.0, y: 1.0)

anotherPoint.moveBy(x: 5.0, y: 3.5)

print("The point is now at (\(anotherPoint.x), \(anotherPoint.y))")


struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "ToTelLity")

player.complete(level: 2)

print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "Yahoo")

if player2.tracker.advance(to: 6) {
    print("player is on level 6")
} else {
    print("level 6 is not unlocked")
}
