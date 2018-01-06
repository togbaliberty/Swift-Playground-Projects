//: Playground - noun: a place where people can play

import UIKit

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var testTrackedString = TrackedString()

testTrackedString.value = "Testing tracked string"
testTrackedString.value += "This should increment the number of edits"

print("Number of edits: \(testTrackedString.numberOfEdits)")

public struct TrackAnotherString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    
    public init () {}
}
