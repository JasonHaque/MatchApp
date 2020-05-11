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
        var generatedNumbers = [Int]()
        
        while generatedNumbers.count < 8{
            
            let randomNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randomNumber) == false{
                
                
                let cardOne = Card()
                let cardTwo = Card()
                cardOne.cardName = "card\(randomNumber)"
                cardTwo.cardName = "card\(randomNumber)"
                
                generatedCards += [cardOne,cardTwo]
                
                print(randomNumber)
                generatedNumbers.append(randomNumber)
            }
            
            
            
            
        }
        
        generatedCards.shuffle()
        
        return generatedCards
        
        
    }
}
