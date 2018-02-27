//
//  Card.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/26/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

import Foundation

//  Structs has no inheritance.
//  Structs are copied, not passed by reference.

struct Card {
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    
    
}
