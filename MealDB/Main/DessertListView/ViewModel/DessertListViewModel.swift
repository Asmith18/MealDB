//
//  DessertListViewModel.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import Foundation

protocol DessertListViewModelDelegate: DessertListTableViewController {
    func dessertListHasData()
}

class DessertListViewModel {
    
    var recipeList: [Recipe] = []
    weak var delegate: DessertListViewModelDelegate?
    private let service = DessertListService()
    
    init(delegate: DessertListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchDessertList() {
        service.fetchDessertList(from: .filterDessert) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let desserts):
                self?.recipeList = desserts.recipeList
                self?.delegate?.dessertListHasData()
            }
        }
    }
}
