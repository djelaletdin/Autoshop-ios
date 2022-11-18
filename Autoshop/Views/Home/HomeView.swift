//
//  HomeView.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Autoshop")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding()
                        
                    if !viewModel.isSearching {
                        RecipeView(item: viewModel.homeData[0])
                        Text(viewModel.homeData[1].categoryName)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        ForEach(viewModel.homeData[1].data) { product in
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
                }
            }
            .frame(maxHeight: .infinity)
            .onAppear() {
                if viewModel.homeData.isEmpty {
                    viewModel.initFetchData()
                }
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

