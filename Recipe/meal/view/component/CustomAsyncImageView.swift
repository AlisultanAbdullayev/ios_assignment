//
//  CustomAsyncImageView.swift
//  Recipe
//
//  Created by Alisultan Abdullah on 5/30/24.
//

import SwiftUI

struct CustomAsyncImageView: View {
    
    let width: CGFloat
    let height: CGFloat
    let urlString: String
    
    var body: some View {
        
        
        AsyncImage(url: URL(string: urlString)) { phase in
            if let image = phase.image {
                image
                    .resizable()
            } else if phase.error != nil {
                VStack {
                    Spacer()
                    Image(systemName: "slash.circle")
                          Spacer()
                    Text("No image")
                        .font(.caption2)
                          Spacer()
                }
                    .frame(width: width, height: height)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(lineWidth: 2)
                    )
                    .foregroundStyle(.secondary)
            } else {
                ProgressView()
            }
        }
        .scaledToFit()
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    CustomAsyncImageView(width: 40, height: 40, urlString: Meal.previewMeal.strMealThumb)
        .previewLayout(.sizeThatFits)
}
