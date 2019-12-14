//
//  SingleIngredientTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 08/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class SingleIngredientTableViewCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var ingredientAmount: UITextField!
    @IBOutlet weak var ingredientName: UITextField!
    
    func update(withRowOfIndexPath row: Int){
        ingredientLabel.text = "Ingredient: \(row + 1)"
        self.tag = row+1
    }
    
    func getIngredient() -> String{
        guard !(ingredientName.text?.isEmpty ?? false) else {
            return ""
        }
        return ingredientName.text!
    }
    
    func getAmount() -> String{
        guard !(ingredientAmount.text?.isEmpty ?? false) else {
            return ""
        }
        return ingredientAmount.text!
    }
    
    func resetCell(){
        ingredientName.text = ""
        ingredientAmount.text = ""
    }
}
