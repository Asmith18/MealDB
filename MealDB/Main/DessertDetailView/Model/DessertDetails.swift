//
//  RecipeDetails.swift
//  MealDB
//
//  Created by Adam Smith on 5/25/23.
//

import Foundation

struct Dessert: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case recipe = "meals"
    }
    let recipe: [RecipeDetails]
}

struct RecipeDetails: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case recipeId = "idMeal"
        case recipeName = "strMeal"
        case recipeInstructions = "strInstructions"
        case recpieImage = "strMealThumb"
        case ingredients
    }
    let recipeId: String?
    let recipeName: String?
    let recipeInstructions: String?
    let recpieImage: String?
    let ingredients: [Ingredient]
}

struct Ingredient: Decodable {
    let name: String
    let mesurement: String
}

// Mark: Decoder
extension RecipeDetails {
    init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.recipeId = try? container?.decode(String.self, forKey: .recipeId)
        self.recipeName = try? container?.decode(String.self, forKey: .recipeName)
        self.recipeInstructions = try? container?.decode(String.self, forKey: .recipeInstructions)
        self.recpieImage = try? container?.decode(String.self, forKey: .recpieImage)
        
        let ingredientNamesContainer = try? decoder.container(keyedBy: IngredientCodingKeys.self)
        let measurementsContainer = try? decoder.container(keyedBy: MeasurementsCodingKeys.self)

        let ingredients: [Ingredient] = IngredientCodingKeys.allCases.enumerated().compactMap {
            guard let name = try? ingredientNamesContainer?.decode(String.self, forKey: $0.element),
                  let measurement = try? measurementsContainer?.decode(String.self, forKey: MeasurementsCodingKeys.allCases[$0.offset]),
                  !name.isEmpty,
                  !measurement.isEmpty
            else { return nil }
            
            return Ingredient(name: name, mesurement: measurement)
        }
        self.ingredients = ingredients
    }
    
    private enum IngredientCodingKeys: String, CodingKey, CaseIterable {
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        case strIngredient16
        case strIngredient17
        case strIngredient18
        case strIngredient19
        case strIngredient20
    }
    
    private enum MeasurementsCodingKeys: String, CodingKey, CaseIterable {
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
        case strMeasure16
        case strMeasure17
        case strMeasure18
        case strMeasure19
        case strMeasure20
    }
}
