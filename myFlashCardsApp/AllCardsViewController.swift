//
//  AllCardsViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/21/21.
//

import UIKit

class AllCardsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        title = "Cards"
        
        let cardView = UIView()
        cardView.frame = CGRect(x: 50, y: 150, width: 130, height: 100)
        cardView.backgroundColor = .orange
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.someAction(_:)))
        self.view.addSubview(cardView)
        cardView.addGestureRecognizer(gesture)
        
        let cardView2 = UIView()
        cardView2.frame = CGRect(x: 50, y: 300, width: 130, height: 100)
        cardView2.backgroundColor = .orange
        self.view.addSubview(cardView2)
        
        let cardView3 = UIView()
        cardView3.frame = CGRect(x: 50, y: 450, width: 130, height: 100)
        cardView3.backgroundColor = .orange
        self.view.addSubview(cardView3)
        
        
//        let label = UILabel()
//        label.frame = CGRect(x: 50, y: 150, width: 100, height: 100)
//        label.textAlignment = .center
//        label.text = "label"
//        cardView.addSubview(label)
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        print("flipping card")
        let cardView = UIView()
        cardView.frame = CGRect(x: 50, y: 150, width: 130, height: 100)
        cardView.backgroundColor = .white
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.anotherAction(_:)))
        self.view.addSubview(cardView)
        cardView.addGestureRecognizer(gesture)
       }
    
    @objc func anotherAction(_ sender:UITapGestureRecognizer){
        print("flipping card")
        let cardView = UIView()
        cardView.frame = CGRect(x: 50, y: 150, width: 130, height: 100)
        cardView.backgroundColor = .orange
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.someAction(_:)))
        self.view.addSubview(cardView)
        cardView.addGestureRecognizer(gesture)
       }


}
