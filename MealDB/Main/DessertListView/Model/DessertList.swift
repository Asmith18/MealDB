//
//  DessertListModel.swift
//  MealDB
//
//  Created by Adam Smith on 5/23/23.
//

import Foundation

struct DessertList: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case recipeList = "meals"
    }
    
    let recipeList: [Recipe]
}

struct Recipe: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case name = "strMeal"
        case id = "idMeal"
        case imageView = "strMealThumb"
    }
    
    let name: String?
    let id: String?
    let imageView: String?
}
