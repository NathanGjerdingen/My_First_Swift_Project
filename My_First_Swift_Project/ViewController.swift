//
//  ViewController.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/24/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //
    //  'Lazy' is a term you can lead a var with saying that the vairable doesn't
    //  need to be initialized until it is used...
    //
    //  NOTE: Cannot have 'didSet'...
    //
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count+1) / 2
    }
    
    //
    //  'didSet' is a function you can append to a variable to make it do something
    //  every time the value is touched...
    //
    
    private(set) var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    //  List of button Outlets for the UI...
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    //  Function for when a card is touched...
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons.")
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    private var emojiChoises = ["🤯","😎","🤖","👾","👹","☠️","💩","👽",]
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            emoji[card.identifier] = emojiChoises.remove(at: emojiChoises.count.arc4random)
        }
        
        //
        //  Sytax below is equivilent to the following code...
        //
        //  if emoji[card.identifier] != nil {
        //      return emoji[card.identifier]!
        //  } else {
        //      return "?"
        //  }
        //
        
        return emoji[card.identifier] ?? "?"
        
    }

}

//
//  Extentison example.
//

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

