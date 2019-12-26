//
//  CocktailFormatter.swift
//  MyCocktail
//
//  Created by Willem Lapage on 11/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

extension Cocktail {

    func getFormattedRecipe() -> String {
        var ingredientsString  = ""
        let ingredients = [measure1, ingredient1, measure2, ingredient2, measure3, ingredient3, measure4, ingredient4, measure5, ingredient5, measure6, ingredient6, measure7, ingredient7, measure8, ingredient8, measure9, ingredient9, measure10, ingredient10, measure11, ingredient11, measure12, ingredient12, measure13, ingredient13, measure14, ingredient14, measure15, ingredient15]

               for x in 0...ingredients.capacity-1 {
                   if ingredients[x] != nil && !ingredients[x]!.isEmpty {
                       if x % 2 != 0 {
                           if ingredients[x-1] == nil {
                               ingredientsString += "- "
                           }
                           ingredientsString += ingredients[x]! + "\n"
                       } else {
                           ingredientsString += "- " + ingredients[x]! + " "
                       }
                   }
               }
        return ingredientsString
        }
}
