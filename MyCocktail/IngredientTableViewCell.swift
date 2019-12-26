//
//  IngredientTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 05/11/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Int(Stepper.value)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleIngredientCell", for: indexPath) as! SingleIngredientTableViewCell
        cell.update(with: Int(Stepper.value))
        return cell
    }

/*
    
        @IBAction func OnStepperAction(_ sender: UIStepper) {
            
            
            let oldValue = Int(AmountOfIngredients.text!)!

            //ok value?
            var stepperValue = 1
            if Stepper.value >= 1 , Stepper.value <= 15 {
                stepperValue = Int(Stepper.value)
                AmountOfIngredients.text! = String(stepperValue)
            }
            else {
                stepperValue = oldValue
                Stepper.value = Double(oldValue)
            }
            
            */

            /*
            
            //alles hidden en height verminderen * oude value
            for x in 0...oldValue-1 {
    //            Cells[x].isHidden = true
                IngredientenTableView.contentSize.height -= 100
            }
            
            //isHidden false tot value
            for x in 0...stepperValue-1 {
               // if Cells[x].isHidden {
            //        Cells[x].isHidden = false
                    IngredientenTableView.contentSize.height += 100
                }
            }
             */
        }

    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0//categorieën.count
        }
        else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "CreateIngredientCell", for: indexPath) as! IngredientTableViewCell //TODO
            cell.update()
            return cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func update(){
    }
    
}
 */
