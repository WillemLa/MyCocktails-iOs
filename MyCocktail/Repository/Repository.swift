//
//  Repository.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

struct Repository {

    private static let shared = Repository()

    static func sharedInstance() -> Repository {
        return shared
    }

    let cocktailArchiveUrl =
        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first!.appendingPathComponent("cocktails").appendingPathExtension("plist")

    let shoppingItemArchiveUrl =
        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first!.appendingPathComponent("shoppingItem").appendingPathExtension("plist")

    let categoryArchiveUrl =
        FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first!.appendingPathComponent("categories").appendingPathExtension("plist")

    func loadShoppingItemsFromFile() -> [ShoppingItem] {
             let propertyListDecoder = PropertyListDecoder()
                    if let retrievedShoppingItems = try? Data(contentsOf: shoppingItemArchiveUrl),
                        let decodedShoppingItems = try? propertyListDecoder.decode(Array<ShoppingItem>.self, from: retrievedShoppingItems) {
                     return decodedShoppingItems
             }
             return [ShoppingItem]()
       }

    func saveShoppingitemToFile(shoppingItems: [ShoppingItem]) {
        let properyListEncoder = PropertyListEncoder()
                       let encodedShoppingItems = try? properyListEncoder.encode(shoppingItems)
                              try? encodedShoppingItems?.write(to: shoppingItemArchiveUrl, options: .noFileProtection)
    }

    func loadFromFile() -> [Cocktail] {
          let propertyListDecoder = PropertyListDecoder()
                 if let retrievedCocktail = try? Data(contentsOf: cocktailArchiveUrl),
                    let decodedCocktails = try? propertyListDecoder.decode(Array<Cocktail>.self, from: retrievedCocktail) {
                  return decodedCocktails
          }
          return [Cocktail]()
    }

    func saveToFile(cocktails: [Cocktail]) {
        let properyListEncoder = PropertyListEncoder()
                       let encodedCocktail = try? properyListEncoder.encode(cocktails)
                              try? encodedCocktail?.write(to: cocktailArchiveUrl, options: .noFileProtection)
    }

    func getCocktailsByName(name: String) -> [Cocktail] {
        var cocktailArray = [Cocktail]()
        loadFromFile().forEach {cocktail in
            if cocktail.name?.lowercased() == name.lowercased() {
                cocktailArray.append(cocktail)
            }
        }
        return cocktailArray
    }

    func getCocktailsByCategory(category: String) -> [Cocktail] {
         var cocktailArray = [Cocktail]()
         loadFromFile().forEach {cocktail in
            if cocktail.category?.lowercased() == category.lowercased() {
                 cocktailArray.append(cocktail)
             }
         }
         return cocktailArray
     }
}
