//
//  HomeView.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            
            if viewModel.isSearching {
                ProgressView()
                    .onAppear() {
                        if viewModel.homeData.isEmpty {
                            viewModel.initFetchData()
                        }
                    }
            } else {
                
                ScrollView{
                    VStack(alignment: .leading) {
                        
                        
                        Text("Autoshop")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding()
                        
                        if !viewModel.isSearching {
                            RecipeView(item: viewModel.homeData[0])
                            ProductsList(viewModel: viewModel, item: viewModel.homeData[1])
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

