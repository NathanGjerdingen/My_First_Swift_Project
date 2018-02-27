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
    
    init(numberOfPairsOfCards: Int) {
        
        for _ in 0...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        //  TODO: Shuffle the cards
        
    }
    
    var cards = [Card]()
    
    func chooseCard(at index: Int) {
        
        
        
    }
    
}
