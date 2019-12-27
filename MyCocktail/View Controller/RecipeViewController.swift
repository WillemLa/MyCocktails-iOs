//
//  RecipeViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 05/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    var cocktail: Cocktail?

    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var ingredients: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }

    func updateUi() {
        titel.text = cocktail?.name
        instructions.text = cocktail?.instructions
        ingredients.text = cocktail?.getFormattedRecipe()
        ingredients.frame.size.height = ingredients.contentSize.height
    }

}
