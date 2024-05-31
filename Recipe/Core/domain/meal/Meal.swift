//
//  Meal.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

// MARK: - Data
struct Response: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
    
    static let previewMeal = Meal(strMeal: "Meal",
                              strMealThumb: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg",
                              idMeal: "1")
}



