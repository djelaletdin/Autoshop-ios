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
        
        VStack(alignment: .leading) {
            RecipeView()
            
        }.task {
            viewModel.initFetchData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

