//
//  shoppingItemTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class ShoppingItemTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingItemDate: UILabel!
    @IBOutlet weak var shoppingItemName: UILabel!

    func update(shoppingItem: ShoppingItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy, HH:mm")

        shoppingItemName.text = shoppingItem.title
        shoppingItemDate.text = dateFormatter.string(from: shoppingItem.timestamp)
    }

}
