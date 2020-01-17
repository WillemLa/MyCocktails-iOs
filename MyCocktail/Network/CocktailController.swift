//
//  CocktailController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 15/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import Foundation

class CocktailController {

    private static let shared = CocktailController()

    static func sharedInstance() -> CocktailController {
        return shared
    }

    let baseUrl = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/")!

    func fetchCocktails(getByName: Bool, queryZoekTerm: String, completion: @escaping ([Cocktail]?) -> Void) {

        let jsonDecoder = JSONDecoder()
        if  getByName {
            let url = baseUrl.appendingPathComponent("search.php")
            let urlWithQuery = url.withQueries(["s":queryZoekTerm])!
            let task = URLSession.shared.dataTask(with: urlWithQuery) { (data, _, _) in
                if let data = data, let cocktails = try? jsonDecoder.decode(Cocktails.self, from: data) {
                    completion(cocktails.drinks)
                } else {
                    print("Geen of niet te decoderen data..")
                    completion(nil)
                }
            }
            task.resume()
        } else {
            let url = baseUrl.appendingPathComponent("filter.php")
            let urlWithQuery = url.withQueries(["c":queryZoekTerm])!
            var cocktailResult: [Cocktail] = []
            let task = URLSession.shared.dataTask(with: urlWithQuery) { (data, _, _) in
                if let data = data, let cocktailsIds = try? jsonDecoder.decode(CocktailsByCat.self, from: data) {
                    for cocktail in cocktailsIds.drinks {
                        self.fetchSingleCocktail(cocktailId: cocktail.cocktailId) { (individualcocktail) in
                            if let individualcocktail = individualcocktail {
                                cocktailResult += individualcocktail
                                completion(cocktailResult)
                            }
                        }
                    }
                } else {
                    print("Geen of niet te decoderen data..")
                    completion(nil)
                }
            }
            task.resume()
        }
    }

    func fetchSingleCocktail(cocktailId: String, completion: @escaping ([Cocktail]?) -> Void) {
        let jsonDecoder = JSONDecoder()
        let url = baseUrl.appendingPathComponent("lookup.php/")
        let urlWithQuery = url.withQueries(["i": cocktailId])!
        let task = URLSession.shared.dataTask(with: urlWithQuery) { (data, _, _) in
            if let data = data, let cocktailToAdd = try? jsonDecoder.decode(Cocktails.self, from: data) {
                completion(cocktailToAdd.drinks)
            } else {
                print("Geen of niet te decoderen data..")
                completion(nil)
            }
        }
        task.resume()
    }

    func fetchCategories( completion: @escaping ([Category]?) -> Void) {
        let jsonDecoder = JSONDecoder()
        let url = baseUrl.appendingPathComponent("list.php/")
        let urlWithQuery = url.withQueries(["c": "list"])!
        let task = URLSession.shared.dataTask(with: urlWithQuery) { (data, _, _) in
            if let data = data, let categories = try? jsonDecoder.decode(Categories.self, from: data) {
                completion(categories.drinks)
            } else {
                print("Geen of niet te decoderen data..")
                completion(nil)
            }
        }
        task.resume()
    }

}
