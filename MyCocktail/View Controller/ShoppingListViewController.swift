//
//  ShoppingListViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 10/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let repository = Repository.sharedInstance()
    var shoppingItems = Array<ShoppingItem>()
    
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var ShopItemNameTextField: UITextField!
    @IBOutlet weak var ShoppingItemsTableView: UITableView!
    
    @IBAction func AddShoppingItem(_ sender: Any) {
        guard checkInput() else {
            return
        }
        shoppingItems.append(ShoppingItem(title: ShopItemNameTextField.text ?? ""))
        saveShoppingItems(shoppingItemArray: shoppingItems)
        loadShoppingItems()
        ShoppingItemsTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = self.editButtonItem
        ShoppingItemsTableView.delegate = self
        ShoppingItemsTableView.dataSource = self
        loadShoppingItems()
    }
    
    
    // MARK: - TableView

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
    
    // MARK: - Validation

    func checkInput() -> Bool{
        if ShopItemNameTextField.text!.isEmpty {
            DispatchQueue.main.async {
                  let alert = UIAlertController(title: "Error!", message: "Please fill the required field", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                  self.present(alert, animated: true)
            }
                  return false
          }
          else{
              return true
          }
      }
    
    // MARK: - Repository Calls
    
    func loadShoppingItems(){
        shoppingItems = repository.loadShoppingItemsFromFile()
    }
    
    func saveShoppingItems(shoppingItemArray: Array<ShoppingItem>){
        repository.saveShoppingitemToFile(shoppingItems: shoppingItemArray)
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
