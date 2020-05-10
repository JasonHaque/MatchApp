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
        
    }
    
}
