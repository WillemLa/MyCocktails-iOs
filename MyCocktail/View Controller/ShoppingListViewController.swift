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
    var shoppingItems = [ShoppingItem]()

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var shopItemNameTextField: UITextField!
    @IBOutlet weak var shoppingItemsTableView: UITableView!

    @IBAction func addShoppingItem(_ sender: Any) {
        guard checkInput() else {
            return
        }
        addShoppingItemToTable()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemsTableView.delegate = self
        shoppingItemsTableView.dataSource = self
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
    
    func addShoppingItemToTable() {
        shoppingItems.append(ShoppingItem(title: shopItemNameTextField.text ?? ""))
        saveShoppingItems(shoppingItemArray: shoppingItems)
        shoppingItemsTableView.reloadData()
    }

    // MARK: - Validation

    func checkInput() -> Bool {
        if shopItemNameTextField.text!.isEmpty {
            DispatchQueue.main.async {
                  let alert = UIAlertController(title: "Error!", message: "Please fill the required field", preferredStyle: .alert)
                  alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                  self.present(alert, animated: true)
            }
                  return false
          } else {
              return true
          }
      }

    // MARK: - Repository Calls

    func loadShoppingItems() {
        shoppingItems = repository.loadShoppingItemsFromFile()
    }

    func saveShoppingItems(shoppingItemArray: [ShoppingItem]) {
        repository.saveShoppingitemToFile(shoppingItems: shoppingItemArray)
    }

}
