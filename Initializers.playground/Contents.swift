//: Playground - noun: a place where people can play

import UIKit

struct Tetherball {
    var timer: Double
    var player: Int
    
    init() {
        timer = 0.0
        player = 1
    }
}

var tetherballGame = Tetherball()

print("Initial tetherball game setup: \(tetherballGame)")

class Food {
    var name: String
    
    init (name: String) {
        self.name = name
    }
    
    convenience init () {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Chicken")

let mysteryMeat = Food()

class RecipeIngredient: Food {
    var quantity: Int
    
    init (name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init (name: String) {
        self.init(name: name, quantity: 1)
    }
}

let mysteryItem = RecipeIngredient()
let meat = RecipeIngredient(name: "Goat")
let eggs = RecipeIngredient(name: "Eggs", quantity: 7)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        get {
            return "\(quantity) x \(name)" + (purchased ? " ✔" : " ✘")
        }
    }
}

var shoppingList = [ShoppingListItem()]
shoppingList.append(ShoppingListItem(name: "Goat Meat", quantity: 3))
shoppingList.append(ShoppingListItem(name: "Fish"))

shoppingList.map({ print($0.description) })
