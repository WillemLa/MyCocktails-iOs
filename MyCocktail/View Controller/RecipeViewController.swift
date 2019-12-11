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
        Ingredients.text = formatIngredients()
        Ingredients.frame.size.height = Ingredients.contentSize.height
    }
    
    func formatIngredients() -> String{
        var ingredientsString  = ""
        let ingredients = [cocktail?.measure1, cocktail?.ingredient1, cocktail?.measure2, cocktail?.ingredient2, cocktail?.measure3, cocktail?.ingredient3, cocktail?.measure4, cocktail?.ingredient4, cocktail?.measure5, cocktail?.ingredient5, cocktail?.measure6, cocktail?.ingredient6, cocktail?.measure7, cocktail?.ingredient7, cocktail?.measure8, cocktail?.ingredient8, cocktail?.measure9, cocktail?.ingredient9, cocktail?.measure10, cocktail?.ingredient10, cocktail?.measure11, cocktail?.ingredient11, cocktail?.measure12, cocktail?.ingredient12, cocktail?.measure13, cocktail?.ingredient13, cocktail?.measure14, cocktail?.ingredient14, cocktail?.measure15, cocktail?.ingredient15]
        
        for x in 0...ingredients.capacity-1 {
            if ingredients[x] != nil && !ingredients[x]!.isEmpty {
                if x % 2 != 0 {
                    if ingredients[x-1] == nil {
                        ingredientsString += "- "
                    }
                    ingredientsString += ingredients[x]! + "\n"
                }
                else{
                    ingredientsString += "- " + ingredients[x]! + " "
                }
            }
        }
        return ingredientsString
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
