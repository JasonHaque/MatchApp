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
        cell?.flipUp()
    }
}

