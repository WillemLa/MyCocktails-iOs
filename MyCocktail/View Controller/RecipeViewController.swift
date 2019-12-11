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
    
    @IBOutlet weak var Titel: UILabel!
    
    @IBOutlet weak var Instructions: UITextView!
    @IBOutlet weak var Ingredients: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Titel.text = cocktail?.name
        Instructions.text = cocktail?.instructions
        Ingredients.text = cocktail.getFormattedRecipe()
        Ingredients.frame.size.height = Ingredients.contentSize.height
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
