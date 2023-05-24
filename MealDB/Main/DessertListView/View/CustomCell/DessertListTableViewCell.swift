//
//  DessertListTableViewCell.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import UIKit

class DessertListTableViewCell: UITableViewCell {

    @IBOutlet weak var dessertNameLabel: UILabel!
    @IBOutlet weak var dessertImageView: UIImageView!
    
    func updateViews(recipe: Recipe) {
        dessertNameLabel.text = recipe.name
    }
}
