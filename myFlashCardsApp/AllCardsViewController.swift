//
//  AllCardsViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/21/21.
//

import UIKit
import FirebaseDatabase

class AllCardsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Cards"
    
        
        cards()
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
                        
                    }
                }
            }
            print("fetching")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CardCell
        
        cell.word.text = "some value"
        
        return cell
    }
    
    
    
}
