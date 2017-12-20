//: Playground - noun: a place where people can play

import UIKit

struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠︎", hearts="♡", diamonds="♢", clubs="♣︎"
    }
    
    enum Rank: Int {
        case two=2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        
        struct Values {
            let first: Int, second: Int?
        }
        
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    
    var description: String {
        return "suit is \(suit.rawValue), value is \(rank.values.first)" + (rank.values.second != nil ? "or \(rank.values.second)" : "" )
    }
}

let heartSymbol = BlackjackCard.Suit.hearts.rawValue
