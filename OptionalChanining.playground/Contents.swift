//: Playground - noun: a place where people can play

import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

var john = Person()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("John's residence is not available yet")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("John's residence is not available yet")
}

class ModifiedResidence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        if let buildingInfo = address?.buildingIdentifier() {
            print("The number of rooms at \(buildingInfo) is \(numberOfRooms)")
        } else {
            print("The number of rooms are \(numberOfRooms)")
        }
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
