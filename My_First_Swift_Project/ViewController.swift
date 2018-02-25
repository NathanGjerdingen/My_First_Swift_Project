//
//  ViewController.swift
//  My_First_Swift_Project
//
//  Created by Nathan on 2/24/18.
//  Copyright © 2018 Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButton: [UIButton]!
    var emojiChoises = ["🤯","😎","🤯","😎"]
    
    // Function for when 😎 button is touched...
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        
        if let cardNumber = cardButton.index(of: sender) {
            flipCard(withEmoji: emojiChoises[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButton.")
        }
        
    }
    
    // Function that flips a card...
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        
        // Check if the card equals the current emoji...
        if button.currentTitle == emoji {
            
            // If correct emoji, backgroud color is changed and title
            // is set to nothing...
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        
        } else {
            
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            
        }
        
    }

}
