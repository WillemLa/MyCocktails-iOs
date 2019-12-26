//
//  shoppingItemTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class ShoppingItemTableViewCell: UITableViewCell {

    @IBOutlet weak var ShoppingItemDate: UILabel!
    @IBOutlet weak var ShoppingItemName: UILabel!

    func update(shoppingItem: ShoppingItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy, HH:mm")

        ShoppingItemName.text = shoppingItem.title
        ShoppingItemDate.text = dateFormatter.string(from: shoppingItem.timestamp)
    }

}
