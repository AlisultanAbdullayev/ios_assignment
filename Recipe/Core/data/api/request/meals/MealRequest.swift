//
//  MealRequest.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

enum MealRequest: RequestProtocol {
    
    case getMealsByCategory(category: String)
    case getMealById(mealId: String)
    
    var path: String {
        switch self {
        case .getMealsByCategory(_):
            return "/api/json/v1/1/filter.php"
        case .getMealById(_):
            return "/api/json/v1/1/lookup.php"
        }
    }
    
    var urlParams: [String : String?]? {
        switch self {
        case let .getMealsByCategory(category):
            let params = ["c" : category]
            return params
        case let .getMealById(mealId):
            let params = ["i" : mealId]
            return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}
    
