//
//  CategoryCollectionViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 03/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    func update(with categorie: Category) {
        restorationIdentifier = categorie.name

        textLabel.text = categorie.name
        imageView.image = UIImage(named: categorie.name.getImageNameFormatted()) ?? UIImage(named: "Extra")!
    }
}
