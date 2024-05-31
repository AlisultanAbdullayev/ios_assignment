//
//  MealDetailsView.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/30/24.
//

import SwiftUI

struct MealDetailsView: View {
    
    @EnvironmentObject private var mealsVM: MealsViewModel
    let mealId: String
    
    var body: some View {
        ScrollView {
            if let details = mealsVM.details.first {
                VStack(alignment: .leading, spacing: 20.0) {
                    Text(details.strInstructions ?? "N/A")
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.secondary)
                    ingredientsSection(details: details)
                }
                .font(.headline)
                .navigationTitle(details.strMeal ?? "Details")
            } else {
                Text(mealsVM.errorMessage ?? "Loading...")
            }
        }
        .padding(.horizontal)
        .ignoresSafeArea(edges: .bottom)
        .task {
            await mealsVM.fetchMealDetail(mealId: mealId)
        }
    }
    
    @ViewBuilder
    private func ingredientsSection(details: Detail) -> some View {
        GroupBox("Ingredients".uppercased()) {
            ForEach(details.ingredientsAndMeasurements, id: \.0) { index, ingredient, measurement in
                Divider()
                HStack {
                    Text(ingredient)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(measurement)
                }
            }
            .padding(.top, 2)
        }
    }

}

#Preview {
    MealDetailsView(mealId: "53049")
        .environmentObject(MealsViewModel())
}
