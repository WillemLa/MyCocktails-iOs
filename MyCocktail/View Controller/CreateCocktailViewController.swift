//
//  CreateCocktailViewController.swift
//  MyCocktail
//
//  Created by Willem Lapage on 09/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class CreateCocktailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {

    let repository = Repository.sharedInstance()
    let cocktailController = CocktailController.sharedInstance()
    var categories = [String]()

    @IBOutlet weak var ingredientsTableView: UITableView!

    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var cocktailCategory: UIPickerView!
    @IBOutlet weak var cocktailName: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepperValueChanged(_ sender: Any) {
            ingredientsTableView.reloadData()
    }

    @IBAction func saveCocktail(_ sender: Any) {
    guard checkInput() else {
        return
    }
    repository.saveToFile(cocktail: Cocktail(name: cocktailName.text,
                            instructions: instructions.text,
                            ing1: fetchIngredientName(forRow: 1),
                            ing2: fetchIngredientName(forRow: 2),
                            ing3: fetchIngredientName(forRow: 3),
                            ing4: fetchIngredientName(forRow: 4),
                            ing5: fetchIngredientName(forRow: 5),
                            ing6: fetchIngredientName(forRow: 6),
                            ing7: fetchIngredientName(forRow: 7),
                            ing8: fetchIngredientName(forRow: 8),
                            ing9: fetchIngredientName(forRow: 9),
                            ing10: fetchIngredientName(forRow: 10),
                            ing11: fetchIngredientName(forRow: 11),
                            ing12: fetchIngredientName(forRow: 12),
                            ing13: fetchIngredientName(forRow: 13),
                            ing14: fetchIngredientName(forRow: 14),
                            ing15: fetchIngredientName(forRow: 15),
                            ingAmount1: fetchIngredientAmount(forRow: 1),
                            ingAmount2: fetchIngredientAmount(forRow: 2),
                            ingAmount3: fetchIngredientAmount(forRow: 3),
                            ingAmount4: fetchIngredientAmount(forRow: 4),
                            ingAmount5: fetchIngredientAmount(forRow: 5),
                            ingAmount6: fetchIngredientAmount(forRow: 6),
                            ingAmount7: fetchIngredientAmount(forRow: 7),
                            ingAmount8: fetchIngredientAmount(forRow: 8),
                            ingAmount9: fetchIngredientAmount(forRow: 9),
                            ingAmount10: fetchIngredientAmount(forRow: 10),
                            ingAmount11: fetchIngredientAmount(forRow: 11),
                            ingAmount12: fetchIngredientAmount(forRow: 12),
                            ingAmount13: fetchIngredientAmount(forRow: 13),
                            ingAmount14: fetchIngredientAmount(forRow: 14),
                            ingAmount15: fetchIngredientAmount(forRow: 15),
                            category: categories[cocktailCategory.selectedRow(inComponent: 0)]
        ))
        resetUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 1
        getCategories()
        ingredientsTableView.delegate = self
        ingredientsTableView.dataSource = self
        cocktailCategory.dataSource = self
        cocktailCategory.delegate = self
    }

    func getCategories() {
        cocktailController.fetchCategories { (fetchedItems) in
            if let fetchedItems = fetchedItems {
                DispatchQueue.main.async {
                    self.categories = fetchedItems.map { $0.name }
                    self.cocktailCategory.reloadAllComponents()
                }
            }
        }
    }

    // MARK: - Spinner

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }

     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         categories.count
     }

     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         categories[row]
     }

    // MARK: - TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Int(stepper!.value)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateIngredientCell", for: indexPath) as! SingleIngredientTableViewCell
            cell.update(withRowOfIndexPath: indexPath.row)
            return cell
    }

    func fetchIngredientName(forRow row: Int) -> String {
        let cell = ingredientsTableView.viewWithTag(row)
        guard cell != nil else {
            return ""
        }
        return (cell as! SingleIngredientTableViewCell).getIngredient()
    }

    func fetchIngredientAmount(forRow row: Int) -> String {
        let cell = ingredientsTableView.viewWithTag(row)
        guard cell != nil else {
            return ""
        }
        return (cell as! SingleIngredientTableViewCell).getAmount()
    }

    // MARK: - Validation

    func checkInput() -> Bool {
        if cocktailName.text.isEmpty || instructions.text.isEmpty || fetchIngredientName(forRow: 1).isEmpty || fetchIngredientAmount(forRow: 1).isEmpty {
                DispatchQueue.main.async {

                let alert = UIAlertController(title: "Error!", message: "Please fill all required fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            return false
        } else {
            return true
        }
    }

    func resetUI() {
        instructions.text = ""
        cocktailName.text = ""
        for row in 1...Int(stepper!.value) {
            let cell = ingredientsTableView.viewWithTag(row)
            (cell as! SingleIngredientTableViewCell).resetCell()
        }
        stepper.value = 1
        ingredientsTableView.reloadData()

    }

}
