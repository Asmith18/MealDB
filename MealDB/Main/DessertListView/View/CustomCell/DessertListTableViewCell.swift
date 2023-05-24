//
//  DessertListTableViewCell.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import UIKit

class DessertListTableViewCell: UITableViewCell {

    @IBOutlet weak var dessertNameLabel: UILabel!
    @IBOutlet weak var dessertImageView: ImageViewService!
    
    func updateViews(recipe: Recipe) {
        dessertNameLabel.text = recipe.name
        fetchImage(recipe: recipe)
    }
    
    func fetchImage(recipe: Recipe) {
        guard let image = recipe.imageView,
              let url = URL(string: image) else {
            return
        }
        dessertImageView.fetchImage(using: url)
    }
}
