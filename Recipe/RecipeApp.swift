//
//  RecipeApp.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/29/24.
//

import SwiftUI

@main
struct RecipeApp: App {
    
    @StateObject private var mealsVM = MealsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(mealsVM)
        }
    }
}
