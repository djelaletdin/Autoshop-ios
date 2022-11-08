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
                        ProductsList(item: viewModel.homeData[1])
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .onAppear() {
                viewModel.initFetchData()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

