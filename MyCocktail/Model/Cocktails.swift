//
//  Cocktails.swift
//  MyCocktail
//
//  Created by Willem Lapage on 15/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

struct Cocktails: Codable {
    var drinks: [[String: String]]

    enum CodingKeys: String, CodingKey {
        case drinks = "drinks"
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.drinks = try valueContainer.decode([[String: String]].self, forKey: CodingKeys.drinks)
    }

}
