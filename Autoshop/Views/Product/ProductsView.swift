//
//  ProductsView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import SwiftUI

struct ProductsView: View {
    
    let category: ProductCategoryData
    @StateObject var viewModel = ProductsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.products) { product in
                HStack{
                    Text(product.name)
                    Spacer()
                    Image(systemName: viewModel.contains(product) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .onTapGesture {
                            viewModel.toggleFav(item: product)
                        }
                }
                
            }
        }
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.initFetchData(category.id)
        }.refreshable {
            await viewModel.initFetchData(category.id)
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
