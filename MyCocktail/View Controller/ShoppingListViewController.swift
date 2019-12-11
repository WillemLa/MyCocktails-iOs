//
//  ShoppingListViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var shoppingItems = Array<ShoppingItem>()
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var ShopItemNameTextField: UITextField!
    @IBOutlet weak var ShoppingItemsTableView: UITableView!
    
    @IBAction func AddShoppingItem(_ sender: Any) {
        shoppingItems.append(ShoppingItem(title: ShopItemNameTextField.text ?? ""))
        saveShoppingItems(shoppingItemArray: shoppingItems)
        loadShoppingItems()
        ShoppingItemsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingItems.remove(at: indexPath.row)
            saveShoppingItems(shoppingItemArray: shoppingItems)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingItemCell", for: indexPath) as! ShoppingItemTableViewCell
        cell.update(shoppingItem: shoppingItems[indexPath.row])
        cell.showsReorderControl = true
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = self.editButtonItem
        ShoppingItemsTableView.delegate = self
        ShoppingItemsTableView.dataSource = self
        loadShoppingItems()
    }
    
    func loadShoppingItems(){
        shoppingItems = Repository().loadShoppingItemsFromFile()
    }
    
    func saveShoppingItems(shoppingItemArray: Array<ShoppingItem>){
        Repository().saveShoppingitemToFile(shoppingItems: shoppingItemArray)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
