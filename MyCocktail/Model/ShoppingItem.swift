//
//  File.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

struct ShoppingItem: Codable {
    let title: String
    let timestamp: Date

    init(title: String) {
        self.title = title
        self.timestamp = Date()
    }
}
