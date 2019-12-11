//
//  CocktailTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 04/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    
    func update(with cocktail: Cocktail){
        self.textLabel?.text = cocktail.name
    }

}
