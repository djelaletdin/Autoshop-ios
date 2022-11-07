//
//  RecipeView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/04.
//

import SwiftUI

struct RecipeView: View {
    
    var item: HomeModel
    
    var body: some View {
        Text("Recipes")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.leading)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(item.data) { recipe in
                    RecipeCardView(name: recipe.fullName ?? "", note: recipe.note ?? "Note" , time: recipe.cookingTime ?? 0)
                        .padding(8)      
                }
            }
        }
            
    }
}

struct RecipeCardView: View {
    
    var name: String = "Recipe Name"
    var note: String = "lorem ipsum"
    var time: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210, height: 150)
                .background(Color.yellow)
                .cornerRadius(9)
            Text(name)
                .font(.headline)
            Text(note)
                .font(.subheadline)
            Text("\(Image(systemName: "clock")) \(time) minutes")
        }
        .frame(width: 220, height: 250)
        .padding(10)
        .background(Color.white)
        .cornerRadius(9)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 0)

        
        
    }
}
