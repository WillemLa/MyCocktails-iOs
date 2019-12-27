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
}

 
