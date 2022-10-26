//
//  MainView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("ShoppingList", systemImage: "list.dash")
                }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

