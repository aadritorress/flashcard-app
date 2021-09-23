//
//  CardCell.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/23/21.
//

import UIKit

class CardCell: UICollectionViewCell {
    
    static let identifier = String(describing: CardCell.self)
    
    @IBOutlet weak var word: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        word.text = "some word"
    }

}
