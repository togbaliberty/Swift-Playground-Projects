//: Playground - noun: a place where people can play

import UIKit

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var anInt = 5
var anotherInt = 442

swapTwoInts(&anInt, &anotherInt)

print("An Int is \(anInt) and anotherInt is \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}

var aString = "Burning eyes"
var anotherString = "Infernal"
swapTwoStrings(&aString, &anotherString)

print("An Int is \(aString) and anotherInt is \(anotherString) again")

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
    let temp = a
    a = b
    b = temp
}

var aDouble = 5.3
var anotherDouble = 5.62
swapTwoDoubles(&aDouble, &anotherDouble)

print("An Int is \(aDouble) and anotherInt is \(anotherDouble) again")

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

swapTwoValues(&aString, &anotherString)
swapTwoValues(&anInt, &anotherInt)
swapTwoValues(&aDouble, &anotherDouble)

print("An Int is \(anInt) and anotherInt is \(anotherInt) again")

swap(&anotherInt, &anInt)

print("An Int is \(anInt) and anotherInt is \(anotherInt) again")

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(temp: Element) {
        items.append(temp)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfInts = Stack<Int>()

stackOfInts.push(temp: 5)
stackOfInts.push(temp: 25)
stackOfInts.push(temp: 125)

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items.last
    }
}

print("last item in the list: \(String(describing: stackOfInts.topItem))")

func findIndex(ofString valueToFind: String, in stringArray: [String]) -> Int? {
    for(index, value) in stringArray.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]

if let foundIndex = findIndex(ofString: "dog", in: strings) {
    print("The index of dog is \(foundIndex)")
}

func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    
    return nil
}

if let foundIndex = findIndex(of: "llama", in: strings) {
    print("The index of dog is \(foundIndex)")
}

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
    
//    associatedtype Iterator: IteratorProtocol where Iterator.Element == Item
//    func makeIterator() -> Iterator
}

//extension Container {
//    subscript<Indices: Sequence>(indices: Indices) -> Item where Indices.Iterator.Element == Int {
//        var result = [Item]()
//        for index in indices {
//            result.append(self[index])
//        }
//        return result
//    }
//}

struct IntStack: Container {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

