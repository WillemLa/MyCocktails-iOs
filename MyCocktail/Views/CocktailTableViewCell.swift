//
//  CocktailTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 04/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {

    func update(with cocktail: Cocktail) {
        self.textLabel?.text = cocktail.name
    }

}
