//: Playground - noun: a place where people can play

import UIKit

protocol Toggable {
    mutating func toggle()
}

enum OnOffSwitch: Toggable {
    case off, on
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

protocol SomeProtocol {
    init(someParameter: String)
}

class SomeClass: SomeProtocol {
    required init(someParameter: String) {
        // This is a protocol initializer
    }
}

protocol AnotherProtocol {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeOtherClass: SomeSuperClass, AnotherProtocol {
    required override init() {
        // This is a superclass and protocol initializer
        super.init()
    }
}

protocol RandomNumberGenerator {
    func Random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 13123223.32
    let a = 3443543.0
    let c = 645434323.0
    func Random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
generator.Random()

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.Random() * Double(sides)) + 1
    }
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        
        print("This game is using \(game.dice.sides) sided dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted \(numberOfTurns) plays long")
    }
}

let gameTracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delegate = gameTracker
game.play()

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday \(celebrator.name) on your \(celebrator.age) birthday!")
}

let birthdayPerson = Person(name: "Togba", age: 37)
wishHappyBirthday(to: birthdayPerson)

class Location {
    var latitude: Double
    var longitude: Double
    init (latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init (name: String, latitude: Double, longitude: Double) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double { return pi * radius * radius }
    init (radius: Double) {
        self.radius = radius
    }
 }

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}
