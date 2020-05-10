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
        
        if card.isFlipped{
            flipUp(speed:0)
        }
        else{
            flipDown(speed:0)
        }
        
    }
    
    func flipUp(speed:TimeInterval = 0.3){
        UIView.transition(from: CardBack, to: CardFront, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        card?.isFlipped = true
    }
    
    func flipDown(speed:TimeInterval = 0.3){
         UIView.transition(from: CardFront, to: CardBack, duration: speed, options: [.showHideTransitionViews,.transitionFlipFromLeft], completion: nil)
        card?.isFlipped = false
    }
    
    func remove(){
        CardBack.alpha = 0
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.CardFront.alpha = 0
        }, completion: nil)
    }
    
}
