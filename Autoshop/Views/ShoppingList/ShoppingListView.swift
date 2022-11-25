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
        
        let withIndex = viewModel.products.enumerated().map({ $0 })
        
        NavigationView {
            ZStack (alignment: .bottom) {
                ScrollView {
                    ForEach(withIndex, id: \.element.name) { index, product in
                        ShoppingListRowView(item: product, index: index)
                    }
                }
                Button {
                    viewModel.storeData()
                } label: {
                    Text("Submit").frame(maxWidth: .infinity)
                        .padding(10)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .background(Color.actionBlue)
                .cornerRadius(14)
                .padding(10)
                
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
