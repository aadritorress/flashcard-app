//
//  ViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/20/21.
//

import UIKit
import FirebaseAuth
import Firebase

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.textColor = .brown
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    
    private let emailField: UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email"
        emailField.layer.borderWidth = 1
        emailField.backgroundColor = .white
        emailField.layer.borderColor = UIColor.brown.cgColor
        return emailField
    }()
    
    
    private let passwordField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "Password"
        passField.layer.borderWidth = 1
        passField.layer.borderColor = UIColor.brown.cgColor
        passField.isSecureTextEntry = true
        passField.backgroundColor = .white
        return passField
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.backgroundColor = .systemYellow
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//        cards()
    }
//    
//    private let database = Database.database().reference()
//    
//    func cards() {
//        database.observe(.value) { snapshot in
////            print(snapshot.value)
//            if let dict = snapshot.value as? [String: Any] {
//                for (key, value) in dict {
//                    let card = CardModel(dict: value as! [String : Any])
//                    print(card)
//                    card?.english
//                    card?.portuguese
//                }
//            }
//            print("fetching")
//        }
//    }
//    
    
    override func viewDidLayoutSubviews() {
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 80)
        emailField.frame = CGRect(x: 20, y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width - 40, height: 50)
        passwordField.frame = CGRect(x: 20, y: emailField.frame.origin.y+emailField.frame.size.height+10, width: view.frame.size.width-40, height: 50)
        button.frame = CGRect(x: 20, y: passwordField.frame.origin.y+passwordField.frame.size.height+30, width: view.frame.size.width-40, height: 52)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }

    @objc private func didTapButton() {
        print("continue...")
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        
        //attempt to sign in
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                //show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            print ("you have signed in")
            self?.loggedIN()
        })
    }
    
    func showCreateAccount(email: String, password: String) {
        let alert = UIAlertController(title: "Create Account", message: "Would you like to create an account?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                
                guard self != nil else {
                    return
                }
                
                guard error == nil else {
                    print("failed")
                    return
                }
                print ("signed in")
                //update with controllers from flashcards
                self?.loggedIN()
            })
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {_ in
            print("canceled")
        }))
        
        present(alert, animated: true)
    }
    
    
    
    
    ///CONTROLLERS
    func loggedIN() {
        print("testing")
        //create action
        let tabBarViewController = UITabBarController()
        
        let vc1 = UINavigationController(rootViewController: AllCardsViewController())
        let vc2 = UINavigationController(rootViewController: MyAccountViewController())
        let vc3 = UINavigationController(rootViewController: CreateCardsViewController())
        
        vc1.title = "Cards"
        vc2.title = "Account"
        vc3.title = "Create"
        
        tabBarViewController.setViewControllers([vc1, vc2, vc3], animated: false)
    
        guard let items = tabBarViewController.tabBar.items else {
            return
        }
        
        let images = ["square.grid.2x2", "person", "pencil.circle"]
        
        for icon in 0..<items.count {
            items[icon].image = UIImage(systemName: images[icon])
        }
        
        
        tabBarViewController.modalPresentationStyle  = .fullScreen
    present(tabBarViewController, animated: true)
    }
}


/// Model file
//struct CardModel: Decodable {
//    let english: String
//    let portuguese: String
//    
//    var dict: [String: Any] {
//        return [
//            "english": english,
//            "portuguese": portuguese
//        ]
//    }
//}
//
//extension CardModel {
//    init?(dict: [String: Any]) {
//        guard let eng = dict["english"] as? String,
//              let por = dict["portuguese"] as? String
//        else { return nil }
//        self.init(english: eng, portuguese: por)
//    }
//}
    




