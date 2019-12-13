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
    var categories = Array<String>()
    
    @IBOutlet weak var IngredientsTableView: UITableView!
        
    @IBOutlet weak var Instructions: UITextView!
    @IBOutlet weak var CocktailCategory: UIPickerView!
    @IBOutlet weak var CocktailName: UITextView!
    @IBOutlet weak var Stepper: UIStepper!
    @IBAction func StepperValueChanged(_ sender: Any) {
        if Stepper.value >= 1, Stepper.value <= 15 {
            //IngredientAmountLabel.text! = String(stepperValue)
            IngredientsTableView.reloadData()
        }
        else {
            if Stepper.value > 15{
                Stepper.value = 15
            }
            else {
                resetStepper()
            }
        }
    }
    
    @IBAction func SaveCocktail(_ sender: Any) {
        guard checkInput() else {
            return
        }
        var cocktailArray = repository.loadFromFile()
        let cocktail = Cocktail(name: CocktailName.text,
                                instructions: Instructions.text,
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
                                category: categories[CocktailCategory.selectedRow(inComponent: 0)]
                                )
        
            cocktailArray.append(cocktail)
            repository.saveToFile(cocktails: cocktailArray)
        }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
         1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         categories.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         categories[row]
     }
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard Stepper!.value != 0 else {
            return 1
        }
            return Int(Stepper!.value)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateIngredientCell", for: indexPath) as! SingleIngredientTableViewCell
            cell.update(withRowOfIndexPath: indexPath.row)
            return cell
    }

    func fetchIngredientName(forRow row: Int) -> String{
        let cell = IngredientsTableView.viewWithTag(row)
        guard cell != nil else {
            return ""
        }
        return (cell as! SingleIngredientTableViewCell).getIngredient()
    }
    
    func fetchIngredientAmount(forRow row: Int) -> String{
        let cell = IngredientsTableView.viewWithTag(row)
        guard cell != nil else {
            return ""
        }
        print((cell as! SingleIngredientTableViewCell).getAmount())
        return (cell as! SingleIngredientTableViewCell).getAmount()
    }
    
    func checkInput() -> Bool{
        if CocktailName.text.isEmpty || Instructions.text.isEmpty || fetchIngredientName(forRow: 1).isEmpty || fetchIngredientAmount(forRow: 1).isEmpty {
                DispatchQueue.main.async {

                let alert = UIAlertController(title: "Error!", message: "Please fill all required fields", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
            return false

        }
        else{
            return true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        resetStepper()
        getCategories()
        IngredientsTableView.delegate = self
        IngredientsTableView.dataSource = self
        CocktailCategory.dataSource = self
        CocktailCategory.delegate = self
    }
    
    func getCategories(){
        cocktailController.fetchCategories(){
            (fetchedItems) in
            if let fetchedItems = fetchedItems{
                DispatchQueue.main.async {
                    self.categories = fetchedItems.map{ $0.name }
                    self.CocktailCategory.reloadAllComponents()
                }
            }
        }
    }
    
    func resetStepper(){
        self.Stepper.value = 1
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
