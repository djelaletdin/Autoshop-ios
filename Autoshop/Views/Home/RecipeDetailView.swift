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
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Image("image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                RecipeText()
                ForEach(viewModel.productsData) { product in
                    HStack {
                        Image("image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .background(Color.yellow)
                            .cornerRadius(9)
                            .padding(.vertical, 8)
                        Text(product.name)
                            .font(.headline)
                        Spacer()
                        Button(viewModel.contains(product) ? "Added" : "Add") {
                            viewModel.toggleFav(item: product)
                        }
                        
                        
                        
                    }
                    .addShadow()
                }
            }
        }
        .padding(.top, 1)
        .onAppear {
            viewModel.id = self.recipeId
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}

struct RecipeText: View{
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("Recipe Name")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Lorem asdasdlajksfasljf sfdasdhljfalfaslhfsdljfbsdfsaflkjdflsakjdfhlaksdhjf asjdhfsljhdfsljkdfh")
        }
        .foregroundColor(.black)
        .padding(.horizontal)
    }
}

