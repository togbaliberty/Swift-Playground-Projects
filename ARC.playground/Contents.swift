//: Playground - noun: a place where people can play

import UIKit

class Apartment {
    let unit: String?
    init(unit: String) {
        self.unit = unit
        print("\(String(describing: unit)) apartment being initialized")
    }
    weak var tenant: Person?
    deinit {
        print("\(String(describing: unit)) apartment being deinitialized")
    }
}

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    
    var apartment: Apartment?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var person1: Person?
var person2: Person?
var person3: Person?

person1 = Person(name: "Togba Liberty")

person2 = person1
person3 = person1

person1 = nil
person2 = nil

person3 = nil

var person4: Person?
var apartment1: Apartment?

person4 = Person(name: "John Mayor")
apartment1 = Apartment(unit: "4A")

person4!.apartment = apartment1
apartment1!.tenant = person4

person4 = nil
apartment1 = nil

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(self.name) has being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("\(self.number) has being deinitialized")
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

let country = Country(name: "Liberia", capitalName: "Monrovia")

print("I am from \(country.capitalCity.name), \(country.name)")

class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is deinitialized")
    }
}

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph!.asHTML())

paragraph = nil
