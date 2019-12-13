//
//  ViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 02/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
    let repository = Repository.sharedInstance()
    let cocktailController = CocktailController.sharedInstance()

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var SearchBtn: UIButton!
    @IBOutlet weak var CocktailCollectionView: UICollectionView!
    @IBOutlet weak var SearchBar: UITextField!
    
    
    // MARK: - Collection view data source

    var categories: [Category] = Array<Category>()
    
    func getCocktails(key: String, value: String, extraUrl: String, destination: CocktailTableViewController, getName: Bool){
        cocktailController.fetchCocktails(queryZoekTerm: [key:value], extraUrl: extraUrl){ (fetchedItems) in
            if let fetchedItems = fetchedItems {
                DispatchQueue.main.async {
                    destination.cocktails = fetchedItems + self.getCocktailsFromDb(keyword: value, getName: getName)
                    destination.tableView.reloadData()
                }
            }
            else{
                destination.cocktails = self.getCocktailsFromDb(keyword: value, getName: getName)
                destination.tableView.reloadData()
            }
        }
    }
    
    func getCocktailsFromDb(keyword: String, getName: Bool) -> Array<Cocktail>{
        if getName {
            return repository.getCocktailsByName(name: keyword)
        }
        else{
            return repository.getCocktailsByCategory(category: keyword)
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
            else{
                    self.offlineAlert()
                
            }
        }
    }
    
    // MARK: - CollectionView

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CocktailTableViewController{
            if(sender is UICollectionViewCell){
                let indexPath = self.categoryCollectionView.indexPath(for: sender as! UICollectionViewCell)
                getCocktails(key: "c", value: self.categories[indexPath!.item].name , extraUrl: "filter.php", destination: destination, getName: true)
            }
            else{
                getCocktails(key: "s", value: SearchBar.text ?? "", extraUrl: "search.php", destination: destination, getName: true)
            }
        }
    }
        

    
    // MARK: - Offline

    func offlineAlert(){
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Watch out!", message: "No internet connection found. The app will only use local data.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "I understand", style: .default, handler: nil))
                        self.present(alert, animated: true)
        }
    }
}










