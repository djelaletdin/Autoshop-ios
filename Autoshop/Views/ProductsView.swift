//
//  ProductsView.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import SwiftUI

struct ProductsView: View {
    
    @StateObject var viewModel = ProductCategoryViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.categories) { category in
                    NavigationLink(destination: Text(category.name)) {
                        ItemRow(item: category)
                    }
                }
            }
            .navigationTitle("Categories")
            .task {
                await viewModel.initFetchData()
            }.refreshable {
                await viewModel.initFetchData()
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
