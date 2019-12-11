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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(shoppingItem: ShoppingItem){
        let dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("dd-MM-yyyy, HH:mm")
        
        ShoppingItemName.text = shoppingItem.title
        ShoppingItemDate.text = dateFormatter.string(from: shoppingItem.timestamp)
    }

}
