//
//  CocktailTableViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 02/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CocktailTableViewController: UITableViewController {

    @IBOutlet var cocktailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    var cocktails: [Cocktail]?

    // MARK: - TableView

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 && cocktails != nil {
            return cocktails!.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as! CocktailTableViewCell
        let cocktail = cocktails![indexPath.row]
        cell.update(with: cocktail)
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecipeViewController {
            let indexPath = cocktailTableView.indexPathForSelectedRow!
            let selected = cocktails![indexPath.row]
            destination.cocktail = selected
        }
    }
}
