//
//  Repository.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

struct Repository{
    
    private static let shared = Repository()
    
    static func sharedInstance() -> Repository{
        return shared
    }
        
    static let cocktailArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("cocktails").appendingPathExtension("plist")
    
    static let shoppingItemArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("shoppingItem").appendingPathExtension("plist")
    
    static let categoryArchiveUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("categories").appendingPathExtension("plist")
    
    static func loadCategoriesFromFile() -> Array<Category>{
             let propertyListDecoder = PropertyListDecoder()
                    if let retrievedCategories = try? Data(contentsOf: categoryArchiveUrl),
                        var decodedCategories = try? propertyListDecoder.decode(Array<Category>.self, from: retrievedCategories){
                     return decodedCategories
             }
             return Array<Category>()
       }
    
    static func saveCategoryToFile(categories: Array<Category>){
        let properyListEncoder = PropertyListEncoder()
                       let encodedCategories = try? properyListEncoder.encode(categories)
                              try? encodedCategories?.write(to: categoryArchiveUrl, options: .noFileProtection)
    }
    
    static func loadShoppingItemsFromFile() -> Array<ShoppingItem>{
             let propertyListDecoder = PropertyListDecoder()
                    if let retrievedShoppingItems = try? Data(contentsOf: shoppingItemArchiveUrl),
                        var decodedShoppingItems = try? propertyListDecoder.decode(Array<ShoppingItem>.self, from: retrievedShoppingItems){
                     return decodedShoppingItems
             }
             return Array<ShoppingItem>()
       }
    
    static func saveShoppingitemToFile(shoppingItems: Array<ShoppingItem>){
        let properyListEncoder = PropertyListEncoder()
                       let encodedShoppingItems = try? properyListEncoder.encode(shoppingItems)
                              try? encodedShoppingItems?.write(to: shoppingItemArchiveUrl, options: .noFileProtection)
    }
    
    static func loadFromFile() -> Array<Cocktail>{
          let propertyListDecoder = PropertyListDecoder()
                 if let retrievedCocktail = try? Data(contentsOf: cocktailArchiveUrl),
                     var decodedCocktails = try? propertyListDecoder.decode(Array<Cocktail>.self, from: retrievedCocktail){
                  return decodedCocktails
          }
          return Array<Cocktail>()
    }
    
    static func saveToFile(cocktails: Array<Cocktail>){
        let properyListEncoder = PropertyListEncoder()
                       let encodedCocktail = try? properyListEncoder.encode(cocktails)
                              try? encodedCocktail?.write(to: cocktailArchiveUrl, options: .noFileProtection)
    }
    
    static func getCocktailsByName(name: String) -> Array<Cocktail>{
        var cocktailArray = Array<Cocktail>()
        loadFromFile().forEach{cocktail in
            if cocktail.name?.lowercased() == name.lowercased() {
                cocktailArray.append(cocktail)
            }
        }
        return cocktailArray
    }
    
    static func getCocktailsByCategory(category: String) -> Array<Cocktail>{
         var cocktailArray = Array<Cocktail>()
         loadFromFile().forEach{cocktail in
            if cocktail.category?.lowercased() == category.lowercased() {
                 cocktailArray.append(cocktail)
             }
         }
         return cocktailArray
     }
    
}
