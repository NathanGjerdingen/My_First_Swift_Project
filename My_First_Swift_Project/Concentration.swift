//
//  Concentration.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/26/18.
//  Copyright © 2018 Nathan. All rights reserved.
//
//  This is the Model for the program.

import Foundation

class Concentration {
    
    var cards = [Card]()
    var indexOfOneAndOlnyFaceUpCard: Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards...
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOlnyFaceUpCard, matchIndex != index {
                
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOlnyFaceUpCard = nil
                
            } else {
                
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOlnyFaceUpCard = index
            }
        }
    }
    
}
