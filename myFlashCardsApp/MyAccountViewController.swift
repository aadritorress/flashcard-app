//
//  MyAccountViewController.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/21/21.
//

import UIKit
import FirebaseAuth


class MyAccountViewController: UIViewController {
    

    var userLabel: UILabel = {
        var label = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 100))
        label.text = "User:"
        label.textColor = UIColor.white
        return label
    }()
    
    var user = Auth.auth().currentUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Account"
//        print(email)
        view.backgroundColor = .brown
        view.addSubview(userLabel)
        userLabel.text = user?.email
    }
}
