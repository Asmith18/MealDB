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
        fetchImage(recipe: recipe)
        dessertNameLabel.text = recipe.name
        dessertImageView.layer.cornerRadius = dessertImageView.frame.width / 2
        dessertImageView.clipsToBounds = true
    }
    
    func fetchImage(recipe: Recipe) {
        guard let image = recipe.imageView,
              let url = URL(string: image) else {
            return
        }
        DispatchQueue.main.async { self.dessertImageView.fetchImage(using: url) }
    }
}
