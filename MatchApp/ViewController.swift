//
//  ViewController.swift
//  MatchApp
//
//  Created by Sanviraj Zahin Haque on 10/5/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
   
    
    @IBOutlet weak var CardCollectionView: UICollectionView!
    
    let model = CardModel()
    var cardsArray = [Card]()
    var firstPickedCardIndex : IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArray = model.getCards()
        CardCollectionView.delegate = self
        CardCollectionView.dataSource = self
    }
    
    // Mark: - Delegate methods for collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return cardsArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardId", for: indexPath) as! CardCollectionViewCell
        
            let card = cardsArray[indexPath.row]
            cell.confiegureCell(card: card)
           
            return cell
       }
       

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        if cell?.card?.isFlipped == false && cell?.card?.isMatched == false{
            
            cell?.flipUp()
            
            if(firstPickedCardIndex == nil){
                firstPickedCardIndex = indexPath
            }
            else{
                checkMatch(indexPath)
            }
            
            
        }
       
    }
    
    
    // Mark: - Game Logic
    
    func checkMatch(_ secondCardIndex : IndexPath){
        
        let cardOne = cardsArray[firstPickedCardIndex!.row]
        let cardTwo = cardsArray[secondCardIndex.row]
        let cardOneCell = CardCollectionView.cellForItem(at: firstPickedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = CardCollectionView.cellForItem(at: secondCardIndex) as? CardCollectionViewCell
        
        if(cardOne.cardName == cardTwo.cardName ){
            
            cardOne.isMatched = true
            cardTwo.isMatched = true
            cardOneCell?.remove()
            cardTwoCell?.remove()
            
            
        }
        else{
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        firstPickedCardIndex = nil
    }
}

