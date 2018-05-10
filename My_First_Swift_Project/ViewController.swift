//
//  ViewController.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/24/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

//  Start at 47.55 on second lecture...

class ViewController: UIViewController {
    
    //
    //  'Lazy' is a term you can lead a var with saying that the vairable doesn't
    //  need to be initialized until it is used...
    //
    //  NOTE: Cannot have 'didSet'...
    //
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    //
    //  'didSet' is a function you can append to a variable to make it do something
    //  every time the value is touched...
    //
    
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    
    //  List of button Outlets for the UI...
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    //  Function for when a card is touched...
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons.")
        }
    }
    
    func updateViewFromModel() {
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
    
    var emojiChoises = ["🤯","😎","🤖","👾","👹","☠️","💩","👽",]
    
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoises.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoises.count)))
            emoji[card.identifier] = emojiChoises.remove(at: randomIndex)
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
