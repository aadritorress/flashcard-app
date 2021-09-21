//
//  CreateCardsViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/20/21.
//

import UIKit
import FirebaseDatabase

class CreateCardsViewController: UIViewController {
    
    private let database = Database.database().reference()
    
    
    private let portuguese: UITextField = {
        let portuguese = UITextField()
        portuguese.placeholder = "portuguese"
        portuguese.layer.borderWidth = 1
        portuguese.backgroundColor = .white
        portuguese.translatesAutoresizingMaskIntoConstraints = false
        portuguese.layer.borderColor = UIColor.brown.cgColor
        return portuguese
    }()
    
    private let english: UITextField = {
        let english = UITextField()
        english.placeholder = "english"
        english.layer.borderWidth = 1
        english.backgroundColor = .white
        english.translatesAutoresizingMaskIntoConstraints = false
        english.layer.borderColor = UIColor.brown.cgColor
        return english
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Add Card", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addCard), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Create"
        viewBuild()
        viewContraints()
        
        database.child("new-card").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return
            }
            print("value: \(value)")
        })
    }
    
    func viewBuild(){
        view.addSubview(portuguese)
        view.addSubview(english)
        view.addSubview(button)
    }

    func viewContraints(){
        NSLayoutConstraint.activate([
            portuguese.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            portuguese.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            portuguese.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

            english.topAnchor.constraint(equalTo: portuguese.bottomAnchor, constant: 30),
            english.leftAnchor.constraint(equalTo: portuguese.leftAnchor),
            english.rightAnchor.constraint(equalTo: portuguese.rightAnchor),

            button.topAnchor.constraint(equalTo: english.bottomAnchor, constant: 30),
            button.leftAnchor.constraint(equalTo: english.leftAnchor),
            button.rightAnchor.constraint(equalTo: english.rightAnchor),
        ])
    }
    
    
    @objc func addCard() {
        print("creating a new card")
///add action
        
//        var ref: DatabaseReference!
//        ref = Database.database().reference()
        
        let object: [String: Any] = [
            "portuguese" : portuguese.text as Any,
            "english" : english.text as Any
        ]
        portuguese.text = ""
        english.text = ""
        
        database.child("new-card_ \(Int.random(in: 0..<100))").setValue(object)
    }
    
}
