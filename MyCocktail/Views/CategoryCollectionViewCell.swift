//
//  CategoryCollectionViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 03/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    func update(with categorie: Category){
        restorationIdentifier = categorie.name
   
        TextLabel.text = categorie.name
        ImageView.image = UIImage(named: categorie.name.getImageNameFormatted()) ?? UIImage(named: "Extra")!
    }
}
