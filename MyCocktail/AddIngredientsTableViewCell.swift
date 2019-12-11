//
//  AddIngredientsTableViewCell.swift
//  MyCocktail
//
//  Created by Willem Lapage on 09/12/2019.
//  Copyright © 2019 Willem Lapage. All rights reserved.
//

import UIKit

class AddIngredientsTableViewCell: UITableViewCell, UITableViewDelegate, UITableViewDataSource {
    
    private var value: Int = 1
    
    func update(with stepperValue: Int){
        value = stepperValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if section == 0 {
                return value
            }
            else{
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                 let cell = tableView.dequeueReusableCell(withIdentifier: "SingleIgredientCell", for: indexPath) as! SingleIngredientTableViewCell
        cell.update(with: 1)
        return cell
    }

}
