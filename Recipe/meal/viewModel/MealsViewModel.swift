//
//  MealsViewModel.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import Foundation

final class MealsViewModel: ObservableObject {
    
    @Published var meals = [Meal]()
    @Published var isProgress = false
    @Published var details = [Detail]()
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiManager: RequestManagerProtocol
    
    init(apiManager: RequestManagerProtocol = RequestManager()) {
        self.apiManager = apiManager
    }
    
    @MainActor
    func fetchMeals(category: Category = .Dessert) async {
        isProgress = true
        defer { isProgress = false }
        do {
            let request = MealRequest.getMealsByCategory(category: category.rawValue)
            let data: Response = try await apiManager.perform(request)
            meals = data.meals
            print("Fetched!")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @MainActor
    func fetchMealDetail(mealId: String) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let request = MealRequest.getMealById(mealId: mealId)
            let data: DetailResponse = try await apiManager.perform(request)
            details = data.details
            print("Fetched details!")
        } catch let error {
            print(error)
            errorMessage = error.localizedDescription
        }
    }
    
    
}
