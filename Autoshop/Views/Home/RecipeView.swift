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
                    NavigationLink(destination: Text(recipe.fullName ?? "")) {
                        RecipeCardView(name: recipe.fullName ?? "", note: recipe.note ?? "Note" , time: recipe.cookingTime ?? 0)
                            .padding(8)
                    }
                          
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
            Image("image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 210, height: 150)
                .background(Color.yellow)
                .cornerRadius(9)
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .frame(alignment: .leading)
            Text("\(Image(systemName: "clock")) \(time) minutes")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 220, height: 220)
        .padding(10)
        .background(Color.white)
        .cornerRadius(9)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)

  
//        ZStack {
//            Image("image")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 250)
//            Color("salmon")
//                .frame(width: 250)
//            Image("image")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .mask(
//                    LinearGradient(gradient: Gradient(stops: [
//                        .init(color: Color.white, location: 0),
//                        .init(color: Color.white, location: 0.1),
//                        .init(color: Color.white.opacity(0), location: 1)
//                    ]), startPoint: .top, endPoint: .bottom)
//                )
//                .frame(width: 250)
//
//            VStack(spacing: 10) {
//                Spacer()
//                Text(name)
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                Text("\(Image(systemName: "clock")) \(time) minutes")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//            }
//            .frame(maxWidth: 250, maxHeight: .infinity)
//            .padding(.vertical, 10)
//
//        }.cornerRadius(20)
        
    }
}
