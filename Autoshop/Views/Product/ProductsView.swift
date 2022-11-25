//
//  ProductsView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import SwiftUI

struct ProductsView: View {
    
    let category: ProductCategoryData
    @ObservedObject var viewModel = ProductsViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.products) { product in
                ProductRow(viewModel: viewModel, product: product)
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
