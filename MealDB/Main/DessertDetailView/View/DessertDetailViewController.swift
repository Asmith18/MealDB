//
//  RecipeDetailsViewController.swift
//  MealDB
//
//  Created by Adam Smith on 5/25/23.
//

import UIKit

class DessertDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var dessertImageView: ImageViewService!
    @IBOutlet weak var dessertIngredientsTableView: UITableView!
    @IBOutlet weak var dessertInstructions: UITextView!
    @IBOutlet weak var dessertNameLabel: UILabel!
    
    var viewModel: DessertDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        dessertIngredientsTableView.dataSource = self
        dessertIngredientsTableView.delegate = self
        viewModel.fetchDessertDetails { [weak self] recipeDetails, imageURL in
            DispatchQueue.main.async {
                self?.dessertInstructions.text = recipeDetails.recipeInstructions
                self?.dessertNameLabel.text = recipeDetails.recipeName
                if let url = imageURL {
                    self?.dessertImageView.fetchImage(using: url)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipeDetails?.ingredients.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dessertIngredientsTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        guard let ingredient = viewModel.recipeDetails?.ingredients[indexPath.row] else { return UITableViewCell()}
        var config = cell.defaultContentConfiguration()
        config.text = ingredient.name
        config.secondaryText = ingredient.mesurement
        cell.contentConfiguration = config
        
        return cell
    }
}

extension DessertDetailViewController: DessertDetailsViewModelDelegate {
    func dessertDetailHasData() {
        DispatchQueue.main.async {
            self.dessertIngredientsTableView.reloadData()
        }
    }
}
