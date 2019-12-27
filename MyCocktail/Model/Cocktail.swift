//
//  Cocktail.swift
//  MyCocktail
//
//  Created by Willem Lapage on 02/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation
//Codable: encode, decodabe, serilialize
struct Cocktail: Codable {

    let cocktailId: String
    let name: String?

    let measure1: String?
    let measure2: String?
    let measure3: String?
    let measure4: String?
    let measure5: String?
    let measure6: String?
    let measure7: String?
    let measure8: String?
    let measure9: String?
    let measure10: String?
    let measure11: String?
    let measure12: String?
    let measure13: String?
    let measure14: String?
    let measure15: String?

    let ingredient1: String?
    let ingredient2: String?
    let ingredient3: String?
    let ingredient4: String?
    let ingredient5: String?
    let ingredient6: String?
    let ingredient7: String?
    let ingredient8: String?
    let ingredient9: String?
    let ingredient10: String?
    let ingredient11: String?
    let ingredient12: String?
    let ingredient13: String?
    let ingredient14: String?
    let ingredient15: String?

    let  instructions: String?
    let category: String?

    enum CodingKeys: String, CodingKey {

        case cocktailId = "idDrink"

        case name = "strDrink"
        case category = "strCategory"

        case measure1 = "strMeasure1"
        case measure2 = "strMeasure2"
        case measure3 = "strMeasure3"
        case measure4 = "strMeasure4"
        case measure5 = "strMeasure5"
        case measure6 = "strMeasure6"
        case measure7 = "strMeasure7"
        case measure8 = "strMeasure8"
        case measure9 = "strMeasure9"
        case measure10 = "strMeasure10"
        case measure11 = "strMeasure11"
        case measure12 = "strMeasure12"
        case measure13 = "strMeasure13"
        case measure14 = "strMeasure14"
        case measure15 = "strMeasure15"

        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case instructions = "strInstructions"

    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        self.cocktailId = try values.decode(String.self, forKey: CodingKeys.cocktailId)
        self.name = try values.decode(String.self, forKey: CodingKeys.name)

        self.ingredient1 = try values.decode(String?.self, forKey: CodingKeys.ingredient1)
        self.ingredient2 = try values.decode(String?.self, forKey: CodingKeys.ingredient2)
        self.ingredient3 = try values.decode(String?.self, forKey: CodingKeys.ingredient3)
        self.ingredient4 = try values.decode(String?.self, forKey: CodingKeys.ingredient4)
        self.ingredient5 = try values.decode(String?.self, forKey: CodingKeys.ingredient5)
        self.ingredient6 = try values.decode(String?.self, forKey: CodingKeys.ingredient6)
        self.ingredient7 = try values.decode(String?.self, forKey: CodingKeys.ingredient7)
        self.ingredient8 = try values.decode(String?.self, forKey: CodingKeys.ingredient8)
        self.ingredient9 = try values.decode(String?.self, forKey: CodingKeys.ingredient9)
        self.ingredient10 = try values.decode(String?.self, forKey: CodingKeys.ingredient10)
        self.ingredient11 = try values.decode(String?.self, forKey: CodingKeys.ingredient11)
        self.ingredient12 = try values.decode(String?.self, forKey: CodingKeys.ingredient12)
        self.ingredient13 = try values.decode(String?.self, forKey: CodingKeys.ingredient13)
        self.ingredient14 = try values.decode(String?.self, forKey: CodingKeys.ingredient14)
        self.ingredient15 = try values.decode(String?.self, forKey: CodingKeys.ingredient15)

        self.measure1 = try values.decode(String?.self, forKey: CodingKeys.measure1)
        self.measure2 = try values.decode(String?.self, forKey: CodingKeys.measure2)
        self.measure3 = try values.decode(String?.self, forKey: CodingKeys.measure3)
        self.measure4 = try values.decode(String?.self, forKey: CodingKeys.measure4)
        self.measure5 = try values.decode(String?.self, forKey: CodingKeys.measure5)
        self.measure6 = try values.decode(String?.self, forKey: CodingKeys.measure6)
        self.measure7 = try values.decode(String?.self, forKey: CodingKeys.measure7)
        self.measure8 = try values.decode(String?.self, forKey: CodingKeys.measure8)
        self.measure9 = try values.decode(String?.self, forKey: CodingKeys.measure9)
        self.measure10 = try values.decode(String?.self, forKey: CodingKeys.measure10)
        self.measure11 = try values.decode(String?.self, forKey: CodingKeys.measure11)
        self.measure12 = try values.decode(String?.self, forKey: CodingKeys.measure12)
        self.measure13 = try values.decode(String?.self, forKey: CodingKeys.measure13)
        self.measure14 = try values.decode(String?.self, forKey: CodingKeys.measure14)
        self.measure15 = try values.decode(String?.self, forKey: CodingKeys.measure15)

        self.instructions = try values.decode(String?.self, forKey: CodingKeys.instructions)
        self.category = try values.decode(String?.self, forKey: CodingKeys.category)

    }

    init( name: String?, instructions: String?, ing1: String?,
          ing2: String?, ing3: String?, ing4: String?, ing5: String?,
          ing6: String?, ing7: String?, ing8: String?, ing9: String?,
          ing10: String?, ing11: String?, ing12: String?, ing13: String?,
          ing14: String?, ing15: String?,
          ingAmount1: String?, ingAmount2: String?, ingAmount3: String?,
          ingAmount4: String?, ingAmount5: String?, ingAmount6: String?,
          ingAmount7: String?, ingAmount8: String?, ingAmount9: String?,
          ingAmount10: String?, ingAmount11: String?, ingAmount12: String?,
          ingAmount13: String?, ingAmount14: String?, ingAmount15: String?,
          category: String?) {

        self.name = name
        self.instructions = instructions
        self.category = category

        self.ingredient1 = ing1
        self.ingredient2 = ing2
        self.ingredient3 = ing3
        self.ingredient4 = ing4
        self.ingredient5 = ing5
        self.ingredient6 = ing6
        self.ingredient7 = ing7
        self.ingredient8 = ing8
        self.ingredient9 = ing9
        self.ingredient10 = ing10
        self.ingredient11 = ing11
        self.ingredient12 = ing12
        self.ingredient13 = ing13
        self.ingredient14 = ing14
        self.ingredient15  = ing15

        self.measure1 = ingAmount1
        self.measure2 = ingAmount2
        self.measure3 = ingAmount3
        self.measure4 = ingAmount4
        self.measure5 = ingAmount5
        self.measure6 = ingAmount6
        self.measure7 = ingAmount7
        self.measure8 = ingAmount8
        self.measure9 = ingAmount9
        self.measure10 = ingAmount10
        self.measure11 = ingAmount11
        self.measure12 = ingAmount12
        self.measure13 = ingAmount13
        self.measure14 = ingAmount14
        self.measure15 = ingAmount15

        self.cocktailId = "PersonalCocktail"
    }

}

struct Cocktails: Codable {
    let drinks: [Cocktail]
}

struct CocktailsByCat: Codable {
    let drinks: [CocktailByCat]
}

struct CocktailByCat: Codable {
        var cocktailId: String

        enum CodingKeys: String, CodingKey {
            case cocktailId = "idDrink"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.cocktailId = try values.decode(String.self, forKey: CodingKeys.cocktailId)
        }
}
