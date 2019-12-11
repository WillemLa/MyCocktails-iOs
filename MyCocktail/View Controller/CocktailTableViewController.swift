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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    var cocktails: [Cocktail]?

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //if niet nodig, aangezien we maar 1 section hebben (standaard, optionele functie verwijderd), maar toch houden voor eventuele uitbreidingen!!
        if section == 0 && cocktails != nil{
            return cocktails!.count
        }
        else{
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as! CocktailTableViewCell
        let cocktail = cocktails![indexPath.row]
        cell.update(with: cocktail)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecipeViewController{
            let indexPath = cocktailTableView.indexPathForSelectedRow!
            let selected = cocktails![indexPath.row]
            destination.cocktail = selected
        }
    }
    
    

    
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

