//
//  DessertListModel.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import Foundation

struct DessertMeals: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case recipes = "meals"
    }
    
    let recipes: [Recipe]
}

struct Recipe: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id   = "idMeal"
    }
    
    let name: String
    let id  : String
}
