//
//  MealsListRowView.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/30/24.
//

import SwiftUI

struct MealsListRowView: View {
    
    let meal: Meal
    
    var body: some View {
        HStack {
            CustomAsyncImageView(width: 75,
                                 height: 75, urlString: meal.strMealThumb)
            HStack {
                Text(meal.strMeal)
                    .font(.headline)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        
    }
}

#Preview {
    MealsListRowView(meal: Meal(strMeal: Meal.previewMeal.strMeal,
                                strMealThumb: Meal.previewMeal.strMealThumb,
                                idMeal: Meal.previewMeal.idMeal))
}
