//
//  ProductsList.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/05.
//

import SwiftUI

struct ProductsList: View {
    
    @ObservedObject var viewModel: HomeViewModel
    var item: HomeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.categoryName)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ForEach(item.data) { product in
                ListCard(viewModel: viewModel, product: product)
            }
        }
    }
}

struct ListCard: View {
    
    @ObservedObject var viewModel: HomeViewModel
    var product: HomeDatum
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(50))
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text(product.name ?? "")
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
                        RoundedRectangle(cornerRadius: 9).stroke(viewModel.contains(product) ? Color.actionBlue : Color.white, lineWidth: 3)
                    )
            }
            .background(viewModel.contains(product) ? Color.white : Color.actionBlue)
            .cornerRadius(9)
        }
        .addShadow()
    }
}
