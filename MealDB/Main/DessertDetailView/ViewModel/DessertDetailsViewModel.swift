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
    
    func fetchDessertDetails(completion: @escaping (RecipeDetails, URL?) -> Void) {
        guard let id = recipe?.id else { return }
        
        service.fetchDessertDetails(from: .dessertById(id)) { [weak self] result in
            switch result {
            case .success(let dessert):
                self?.recipeDetails = dessert.recipe[0]
                self?.updateViews(completion: completion)
                self?.delegate?.dessertDetailHasData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateViews(completion: @escaping (RecipeDetails, URL?) -> Void) {
        guard let recipeDetails = recipeDetails else { return }
        
        guard let image = recipeDetails.recpieImage, let url = URL(string: image) else {
            completion(recipeDetails, nil)
            return
        }
        
        completion(recipeDetails, url)
    }
}
