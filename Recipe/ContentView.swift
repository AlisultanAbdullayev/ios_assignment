//
//  ContentView.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var mealsVM: MealsViewModel
    
    var body: some View {
        NavigationStack {
           content
            .task {
                await mealsVM.fetchMeals()
//                await mealsVM.fetchMealDetail(mealId: "53049")
            }
            .navigationTitle("Dessert")
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if mealsVM.isProgress {
            ProgressView()
        } else {
            List(mealsVM.meals, id: \.idMeal) { meal in
                NavigationLink {
                    MealDetailsView(mealId: meal.idMeal)
                } label: {
                    MealsListRowView(meal: meal)
                }
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}
