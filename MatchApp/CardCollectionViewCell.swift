//
//  CardCollectionViewCell.swift
//  MatchApp
//
//  Created by Sanviraj Zahin Haque on 10/5/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var CardBack: UIImageView!
    
    @IBOutlet weak var CardFront: UIImageView!
    
    var card:Card?
    
    func confiegureCell(card : Card){
        
        self.card = card
        
        CardFront.image = UIImage(named : card.cardName)
        
        if card.isMatched == true{
            CardFront.alpha = 0
            CardBack.alpha = 0
            return
        }
        else{
            CardFront.alpha = 1
            CardBack.alpha = 1
        }
        
        if card.isFlipped == true{
            flipUp(speed:0)
        }
        else{
            flipDown(speed:0,delay: 0)
        }
        
    }
    
    func flipUp(speed:TimeInterval = 0.3){
        UIView.transition(from: CardBack, to: CardFront, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        card?.isFlipped = true
    }
    
    func flipDown(speed:TimeInterval = 0.3, delay:TimeInterval = 0.5 ){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+delay) {
            UIView.transition(from: self.CardFront, to: self.CardBack, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        }
         
        card?.isFlipped = false
    }
    
    func remove(){
        CardBack.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.CardFront.alpha = 0
        }, completion: nil)
    }
    
}
