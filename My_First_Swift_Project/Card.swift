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

struct Card: Hashable {
    
    var hashValue: Int { return identifier}
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
