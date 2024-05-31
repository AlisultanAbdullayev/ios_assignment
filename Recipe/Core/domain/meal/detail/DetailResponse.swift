//
//  DetailResponse.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation
import SwiftData

// MARK: - MealDetail
struct DetailResponse: Codable {
    
    let details: [Detail]
    
    enum CodingKeys: String, CodingKey {
        case details = "meals"
    }

}

struct Detail: Codable {
    let idMeal, strMeal, strDrinkAlternate, strCategory: String?
    let strArea, strInstructions, strMealThumb: String?
    let strTags, strYoutube: String?
    let strIngredient1, strIngredient2, strIngredient3, strIngredient4: String?
    let strIngredient5, strIngredient6, strIngredient7, strIngredient8: String?
    let strIngredient9, strIngredient10, strIngredient11, strIngredient12: String?
    let strIngredient13, strIngredient14, strIngredient15, strIngredient16: String?
    let strIngredient17, strIngredient18, strIngredient19, strIngredient20: String?
    let strMeasure1, strMeasure2, strMeasure3, strMeasure4: String?
    let strMeasure5, strMeasure6, strMeasure7, strMeasure8: String?
    let strMeasure9, strMeasure10, strMeasure11, strMeasure12: String?
    let strMeasure13, strMeasure14, strMeasure15, strMeasure16: String?
    let strMeasure17, strMeasure18, strMeasure19, strMeasure20: String?
    let strSource, strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    
    var ingredientsAndMeasurements: [(Int, String, String)] {
         let ingredients = [
             strIngredient1, strIngredient2, strIngredient3, strIngredient4,
             strIngredient5, strIngredient6, strIngredient7, strIngredient8,
             strIngredient9, strIngredient10
         ]
         let measurements = [
             strMeasure1, strMeasure2, strMeasure3, strMeasure4,
             strMeasure5, strMeasure6, strMeasure7, strMeasure8,
             strMeasure9, strMeasure10
         ]
         
         return Array(zip(0..., zip(ingredients, measurements)))
             .compactMap { index, pair in
                 let (ingredient, measurement) = pair
                 if let ingredient = ingredient, !ingredient.isEmpty,
                    let measurement = measurement, !measurement.isEmpty {
                     return (index, ingredient, measurement)
                 }
                 return nil
             }
     }
    
}

