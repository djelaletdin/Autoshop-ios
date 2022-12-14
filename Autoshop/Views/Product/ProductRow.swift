//
//  ProductRow.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import SwiftUI

struct ProductRow: View {
    
    @ObservedObject var viewModel: ProductsViewModel
    let product: ProductModel
    
    var body: some View {

        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(50))
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text("\(product.name) (\(product.amount))")
                .foregroundColor(product.amount == 0 ? Color.red : Color.black)
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
