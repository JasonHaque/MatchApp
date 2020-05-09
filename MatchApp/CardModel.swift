//
//  CardModel.swift
//  MatchApp
//
//  Created by Sanviraj Zahin Haque on 10/5/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import Foundation

class CardModel{
    
    
    func getCards() -> [Card]{
        
        var generatedCards = [Card]()
        
        for _ in 1...8{
            
            let randomNumber = Int.random(in: 1...13)
            
            let cardOne = Card()
            let cardTwo = Card()
            cardOne.cardName = "card\(randomNumber)"
            cardTwo.cardName = "card\(randomNumber)"
            
            generatedCards += [cardOne,cardTwo]
            
            
        }
        
        generatedCards.shuffle()
        
        return generatedCards
        
        
    }
}
