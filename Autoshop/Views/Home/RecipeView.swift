//
//  RecipeView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/04.
//

import SwiftUI

struct RecipeView: View {
    
    
    
    var body: some View {
        Text("Recipes")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<7) { _ in
                    RecipeCardView()
                        .padding(8)      
                }
            }
        }
            
    }
}

struct RecipeCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210, height: 150)
                .background(Color.yellow)
                .cornerRadius(9)
            Text("Recipe Name")
                .font(.headline)
            Text("Notes about the recipe")
                .font(.subheadline)
            Text("\(Image(systemName: "clock")) 20 minutes")
        }
        .frame(width: 220, height: 250)
        .padding(10)
        .background(Color.white)
        .cornerRadius(9)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 0)

        
        
    }
}
