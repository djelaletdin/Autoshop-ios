//
//  RecipeDetailView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/14.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @StateObject var viewModel = RecipeViewModel()
    var recipeId: Int?
    var recipeName: String = "Name"
    var note: String = "Note"
    
    var body: some View {
        
        if viewModel.isSearching {
            ProgressView()
                .onAppear {
                    viewModel.id = self.recipeId
                }
        } else {
            ScrollView {
                VStack (alignment: .leading) {
                    Image("burger")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    RecipeText(name: recipeName, note: note)
                    ForEach(viewModel.productsData) { product in
                        HStack {
                            Image("")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                                .background(Color.gray.opacity(50))
                                .cornerRadius(9)
                                .padding(.vertical, 8)
                            Text("\(product.name) (\(product.amount)/\(product.stock))")
                                .foregroundColor(product.amount>product.stock ? Color.red : Color.black)
                                .font(.headline)
                            Spacer()
                            Button {
                                viewModel.toggleFav(item: product)
                            } label: {
                                Text(viewModel.contains(product) ? "Added" : "Add")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .foregroundColor(viewModel.contains(product) ? Color.actionBlue : Color.white)
                                    .padding(10)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 9)
                                            .stroke(viewModel.contains(product) ? Color.actionBlue : Color.white, lineWidth: 3)
                                    )
                            }
                            .background(viewModel.contains(product) ? Color.white : Color.actionBlue)
                            .cornerRadius(9)
                            
                            
                            
                        }
                        .addShadow()
                    }
                }
            }
            .padding(.top, 1)
        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}

struct RecipeText: View{
    
    var name: String = "Recipe name"
    var note: String = "asds"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
            
            Text(note)
        }
        .foregroundColor(.black)
        .padding(.horizontal)
    }
}

