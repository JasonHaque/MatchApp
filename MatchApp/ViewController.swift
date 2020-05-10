//
//  ViewController.swift
//  MatchApp
//
//  Created by Sanviraj Zahin Haque on 10/5/20.
//  Copyright © 2020 Sanviraj Zahin Haque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let model = CardModel()
    var cardsArray = [Card]()

    override func viewDidLoad() {
        super.viewDidLoad()
        cardsArray = model.getCards()
        
    }


}

