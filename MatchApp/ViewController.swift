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
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    let model = CardModel()
    var cardsArray = [Card]()
    var firstPickedCardIndex : IndexPath?
    var timer: Timer?
    var matchedCardNumber : Int = 0
    var totalTime : Int = 50*1000

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArray = model.getCards()
        CardCollectionView.delegate = self
        CardCollectionView.dataSource = self
        
        //set up timer
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerBegin), userInfo: nil, repeats: true)
    }
    
    // Mark:- Timer methods
    
    @objc func timerBegin(){
        
        totalTime -= 1
        
        let seconds:Double = Double(totalTime)/1000.0
        
        TimerLabel.text = String(format: "Time remaining %.2f", seconds)
        
        if(totalTime == 0){
            TimerLabel.textColor = UIColor.red
            timer?.invalidate()
            checkForGameEnd()
        }
        
    }
    
    // Mark: - Delegate methods for collectionview
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return cardsArray.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardId", for: indexPath) as! CardCollectionViewCell
        
            
           
            return cell
       }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cardCell = cell as? CardCollectionViewCell
        
        let card = cardsArray[indexPath.row]
        cardCell?.confiegureCell(card: card)
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
            matchedCardNumber += 2
            checkForGameEnd()
            
            
        }
        else{
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            cardOneCell?.flipDown()
            cardTwoCell?.flipDown()
        }
        
        firstPickedCardIndex = nil
    }
    
    func checkForGameEnd(){
        
        if(matchedCardNumber == cardsArray.count){
            timer?.invalidate()
            showAlert(title: "Congrats", message: "You have won the game")
            
        }
        else{
            if totalTime <= 0 {
                showAlert(title: "Sorry", message: "better luck next time")
            }
        }
        
    }
    
    func showAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alert, animated: true , completion: nil)
    }
}

