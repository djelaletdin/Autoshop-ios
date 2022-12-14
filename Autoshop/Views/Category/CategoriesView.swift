//
//  ProductsView.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var viewModel = ProductCategoryViewModel()
    
    var body: some View {
        NavigationStack {
            
            if viewModel.isSearching {
                ProgressView()
                    .task {
                        await viewModel.initFetchData()
                    }
            } else {
                ScrollView {
                    ForEach(viewModel.categories) { category in
                        NavigationLink(destination: ProductsView(category: category)) {
                            CategoryRow(item: category)
                        }.listRowSeparator(.hidden)
                    }
                }
                .navigationTitle("Categories")
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
