//
//  Category.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

struct Category : Codable {

let name: String

enum CodingKeys: String, CodingKey{
    case name = "strCategory"
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.name = try values.decode(String.self, forKey: CodingKeys.name)
}

}

struct Categories: Codable {
    let drinks: [Category]
}
