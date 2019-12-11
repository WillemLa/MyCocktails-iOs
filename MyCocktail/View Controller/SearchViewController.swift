//
//  ViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 02/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let cocktailController = CocktailController()
    var cocktails = Array<Cocktail>()
    
    var categories: [Category] = Array<Category>()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categories.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorieCell", for: indexPath) as! CategoryCollectionViewCell
        let categorie = categories[indexPath.row]
        cell.update(with: categorie)
        return cell
    }
    
    override func viewDidLoad() {
        getCategories()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var CocktailCollectionView: UICollectionView!
    @IBOutlet weak var SearchBar: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //herhalen
        let queryKey: String
        let queryValue: String
        let extraUrl: String
        var cocktailsFromDb = Array<Cocktail>()
        
        if let destination = segue.destination as? CocktailTableViewController{
            if(sender is UICollectionViewCell){
                let indexPath = self.categoryCollectionView.indexPath(for: sender as! UICollectionViewCell)
                queryValue = self.categories[indexPath!.item].name
                extraUrl = "filter.php"
                queryKey = "c"
                cocktailsFromDb = Repository().getCocktailsByCategory(category: queryValue)
            }
            else{
                extraUrl = "search.php"
                queryKey = "s"
                queryValue = SearchBar.text ?? ""
                cocktailsFromDb = Repository().getCocktailsByName(name: queryValue)
            }
            
            let query = [queryKey : queryValue]
            
            cocktailController.fetchCocktails(queryZoekTerm: query, extraUrl: extraUrl){ (fetchedItems) in
                if let fetchedItems = fetchedItems {
                    DispatchQueue.main.async {
                        self.cocktails = fetchedItems + cocktailsFromDb
                        destination.cocktails = self.cocktails
                        destination.tableView.reloadData()
                    }
                }
                else{
                    self.cocktails = cocktailsFromDb
                    destination.cocktails = self.cocktails
                    destination.tableView.reloadData()
                }
            }
        }
    }
    
    func getCategories(){
        cocktailController.fetchCategories(){
            (fetchedItems) in
            if let fetchedItems = fetchedItems{
                DispatchQueue.main.async {
                    self.categories = fetchedItems
                    self.categoryCollectionView.reloadData()
                }
            }
        }
    }
}










