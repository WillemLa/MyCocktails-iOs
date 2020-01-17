//
//  ViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 02/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let repository = Repository.sharedInstance()
    let cocktailController = CocktailController.sharedInstance()

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var cocktailCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UITextField!

    // MARK: - Collection view data source

    var categories: [Category] = [Category]()

    func getCocktails(value: String, destination: CocktailTableViewController, getByName: Bool) {
        cocktailController.fetchCocktails(getByName: getByName, queryZoekTerm: value) { (fetchedItems) in
            if let fetchedItems = fetchedItems {
                DispatchQueue.main.async {
                    destination.cocktails = fetchedItems + self.getCocktailsFromDb(keyword: value, getByName: getByName)
                    destination.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                destination.cocktails = self.getCocktailsFromDb(keyword: value, getByName: getByName)
                destination.tableView.reloadData()
            }
            }
        }
    }

    func getCocktailsFromDb(keyword: String, getByName: Bool) -> [Cocktail] {
        if getByName {
            return repository.getCocktailsByName(name: keyword)
        } else {
            return repository.getCocktailsByCategory(category: keyword)
        }
    }

    func getCategories() {
        cocktailController.fetchCategories { (fetchedItems) in
            if let fetchedItems = fetchedItems {
                DispatchQueue.main.async {
                    self.categories = fetchedItems
                    self.categoryCollectionView.reloadData()
                }
            } else {
                    self.offlineAlert()

            }
        }
    }

    // MARK: - CollectionView

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return categories.count
        } else {
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
        if let destination = segue.destination as? CocktailTableViewController {
            if sender is UICollectionViewCell {
                let indexPath = self.categoryCollectionView.indexPath(for: sender as! UICollectionViewCell)
                getCocktails(value: self.categories[indexPath!.item].name, destination: destination, getByName: false)
            } else {
                getCocktails(value: searchBar.text ?? "", destination: destination, getByName: true)
            }
        }
    }

    // MARK: - Offline

    func offlineAlert() {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Watch out!", message: "No internet connection found. The app will only use local data.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "I understand", style: .default, handler: nil))
                        self.present(alert, animated: true)
        }
    }
}
