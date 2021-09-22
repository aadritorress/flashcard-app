//
//  AllCardsViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/21/21.
//

import UIKit
import FirebaseDatabase

class AllCardsViewController: UIViewController {
    
    
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Cards"
        
//        let labelE = UILabel()
//        labelE.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
//        labelE.textAlignment = .center
//        labelE.text = "english word"
//        labelE.sizeToFit()

        let cardViewE = UIView()
        cardViewE.frame = CGRect(x: 50, y: 150, width: 170, height: 100)
        cardViewE.backgroundColor = .orange
        let gesture2 = UITapGestureRecognizer(target: self, action: #selector(self.PortugueseAction(_:)))
        self.view.addSubview(cardViewE)
//        cardViewE.addSubview(labelE)
        cardViewE.addGestureRecognizer(gesture2)
        
        cards()
        
    }
    
    @objc func PortugueseAction(_ sender:UITapGestureRecognizer){
       
//        let labelP = UILabel()
//        labelP.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
//        labelP.textAlignment = .center
//        labelP.text =
//        labelP.sizeToFit()
        
        let cardViewP = UIView()
        cardViewP.frame = CGRect(x: 50, y: 150, width: 170, height: 100)
        cardViewP.backgroundColor = .white
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.EnglishAction(_:)))
        self.view.addSubview(cardViewP)
//        cardViewP.addSubview(labelP)
//        cardViewP.addGestureRecognizer(gesture)
       }

    var cardsArray: [CardModel] = []
    
    func cards() {
        database.observe(.value) { [self] snapshot in
//            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any] {
                for (key, value) in dict {
                    let card = CardModel(dict: value as! [String : Any])
                    card?.english
                    card?.portuguese
                    if let card = card {
                        self.cardsArray.append(card)
//                        print("array: \(cardsArray)")
                        print("card: \(card)")
                        let cardViewP = UIView()
                        cardViewP.frame = CGRect(x: 50, y: 150, width: 170, height: 100)
                        cardViewP.backgroundColor = .white
                        self.view.addSubview(cardViewP)
                        
                    }
                }
            }
            print("fetching")
        }
    }
}
