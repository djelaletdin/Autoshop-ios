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
            
            if viewModel.savedItems.count == 0{
                Text(viewModel.message)
                    .font(.headline)
                    .fontWeight(.bold)
                    .onAppear {
                        viewModel.initFetchData()
                    }
            } else {
                ZStack (alignment: .bottom) {
                    ScrollView {
                        ForEach(withIndex, id: \.element.name) { index, product in
                            ShoppingListRowView(item: product, index: index)
                        }
                    }
                    Button {
                        viewModel.storeData()
                    } label: {
                        if viewModel.isSubmitting{
                            ProgressView()
                                  .frame(maxWidth: .infinity)
                                  .padding(12)
                                  .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                        } else {
                            Text("Submit")
                                .frame(maxWidth: .infinity)
                                .padding(10)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
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
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
