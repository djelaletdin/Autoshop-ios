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
        List {
            ForEach(viewModel.products) { product in
                Text(product.name)
            }
        }
            .onAppear {
                viewModel.initFetchData()
                print("sup")
            }
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
