//
//  DessertDetailsViewModel.swift
//  MealDB
//
//  Created by Adam Smith on 5/30/23.
//

import Foundation

protocol DessertDetailsViewModelDelegate: AnyObject {
    func dessertDetailHasData()
}

class DessertDetailsViewModel {
    
    var recipe: Recipe?
    var recipeDetails: RecipeDetails?
    weak var delegate: DessertDetailsViewModelDelegate?
    private let service = DessertDetailService()
    
    init(recipe: Recipe?, delegate: DessertDetailsViewModelDelegate) {
        self.recipe = recipe
        self.delegate = delegate
    }
    
    func fetchdessertDetails() {
        guard let id = recipe?.id else { return }
        service.fetchDessertDetails(from: .dessertById(id)) { [weak self] result in
            switch result {
            case .success(let dessert):
                self?.recipeDetails = dessert.recipe[0]
                self?.delegate?.dessertDetailHasData()
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
}
