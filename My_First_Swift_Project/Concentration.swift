//
//  Concentration.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/26/18.
//  Copyright © 2018 Nathan. All rights reserved.
//
//  This is the Model for the program.

import Foundation

struct Concentration {
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards.")
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards...
    }
    
    private(set) var cards = [Card]()
    
    //
    //  Computed Property Example
    //
    
    private var indexOfOneAndOlnyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    //
    //  Assertion Example
    //
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chose index is not in the cards.")
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOlnyFaceUpCard, matchIndex != index {
                
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOlnyFaceUpCard = index
            }
        }
    }
    
}
