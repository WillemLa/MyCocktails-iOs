//
//  MyCocktailTests.swift
//  MyCocktailTests
//
//  Created by Willem Lapage on 09/01/2020.
//  Copyright © 2020 Willem Lapage. All rights reserved.
//

import XCTest
@testable import MyCocktail

class MyCocktailTests: XCTestCase {
    let cocktail1: Cocktail = Cocktail(name: "testCocktail1", instructions: "testInstruction", ing1: "testIngredient1", ing2: "testIngredient2", ing3: "testIngredient3", ing4: "testIngredient4", ing5: "testIngredient5", ing6: "testIngredient6", ing7: "testIngredient7", ing8: "testIngredient8", ing9: "testIngredient9", ing10: "testIngredient10", ing11: "testIngredient11", ing12: "testIngredient12", ing13: "testIngredient13", ing14: "testIngredient14", ing15: "testIngredient15", ingAmount1: "testAmount1", ingAmount2: "testAmount2", ingAmount3: "testAmount3", ingAmount4: "testAmount4", ingAmount5: "testAmount5", ingAmount6: "testAmount6", ingAmount7: "testAmount7", ingAmount8: "testAmount8", ingAmount9: "testAmount9", ingAmount10: "testAmount10", ingAmount11: "testAmount11", ingAmount12: "testAmount12", ingAmount13: "testAmount13", ingAmount14: "testAmount14", ingAmount15: "testAmount15", category: "Cocktail")
    let shoppingItem1: ShoppingItem = ShoppingItem(title: "si1")
    let shoppingItem2: ShoppingItem = ShoppingItem(title: "si2")

    var searchViewController: SearchViewController = SearchViewController()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        Repository.sharedInstance().saveToFile(cocktails: [cocktail1])
        Repository.sharedInstance().saveShoppingitemToFile(shoppingItems: [shoppingItem1, shoppingItem2])
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func repository_saveOrLoadShoppingItem_returnsTestShoppingItem() {
        let shoppingItemFromRepository = Repository.sharedInstance().loadShoppingItemsFromFile()
        XCTAssertTrue(shoppingItemFromRepository.count == 2)
        XCTAssertTrue(shoppingItemFromRepository[0].title == "si1")
        XCTAssertTrue(shoppingItemFromRepository[1].title == "si2")
    }
    func repository_saveOrLoadCocktails_returnsTestCocktail() {
        let cocktailsFromRepository = Repository.sharedInstance().loadFromFile()
        XCTAssertTrue(cocktailsFromRepository.count == 1)
        XCTAssertTrue(cocktailsFromRepository[0].name == "testCocktail1")
    }
    func searchViewController_getCocktailsFromDbByName_returnsTestCocktail() {
         Repository.sharedInstance().saveToFile(cocktails: [cocktail1])
         let cocktails = searchViewController.getCocktailsFromDb(keyword: "testCocktail1", getName: true)
         XCTAssertTrue(cocktails.count == 1)
         XCTAssertTrue(cocktails[0].name == "testCocktail1")
     }
    func searchViewController_getCocktailsFromDbByCategory_returnsTestCocktail() {
         Repository.sharedInstance().saveToFile(cocktails: [cocktail1])
         let cocktails = searchViewController.getCocktailsFromDb(keyword: "Cocktail", getName: false)
         XCTAssertTrue(cocktails.count == 1)
         XCTAssertTrue(cocktails[0].name == "testCocktail1")
     }
}
