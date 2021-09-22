//
//  CardModel.swift
//  myFlashCardsApp
//
//  Created by Adri Torres on 9/22/21.
//

import Foundation


struct CardModel: Decodable {
    let english: String
    let portuguese: String
    
    var dict: [String: Any] {
        return [
            "english": english,
            "portuguese": portuguese
        ]
    }
}

extension CardModel {
    init?(dict: [String: Any]) {
        guard let eng = dict["english"] as? String,
              let por = dict["portuguese"] as? String
        else { return nil }
        self.init(english: eng, portuguese: por)
    }
}
