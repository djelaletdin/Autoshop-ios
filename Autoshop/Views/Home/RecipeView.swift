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
                        .padding()      
                }
            }
        }.background(Color.blue)
            
    }
}

struct RecipeCardView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210, height: 150)
                .background(Color.yellow)
                .cornerRadius(9)
            Text("Recipe Name")
                .padding(0.5)
                .font(.headline)
            Text("Notes about the recipe")
                .padding(0.5)
            Text("\(Image(systemName: "clock")) 20 minutes")
        }
        .padding(10)
        .frame(width: 230, height: 250)
        .background(Color.gray)
        .cornerRadius(9)

        
        
    }
}
