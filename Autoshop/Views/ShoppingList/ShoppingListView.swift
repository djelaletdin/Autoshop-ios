//
//  ShoppingListView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/27.
//

import SwiftUI

struct ShoppingListView: View {
    
    @StateObject var viewModel = ShoppingViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.products) { product in
                    ShoppingListRowView(item: product)
                }
            }
            .navigationTitle("Shopping List")
            .onAppear {
                viewModel.initFetchData()
            }
        }
        
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
