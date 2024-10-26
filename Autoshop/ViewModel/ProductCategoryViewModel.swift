//
//  ProductCategoryViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import Foundation

class ProductCategoryViewModel: ObservableObject {
    
    @Published var categories: [ProductCategoryData] = []
    @Published var isSearching = true

    @MainActor
    func initFetchData() async {
        isSearching = true
        categories = await fetchData()
        print("searching is false now")
        isSearching = false
    }
    
    private func fetchData() async -> [ProductCategoryData] {
        
        guard let url = URL(string: "http://autoshop.realapps.xyz/api/categories") else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode([ProductCategoryData].self, from: data)
            return result
        }
        catch {
            print("error in network")
            return []
        }
        
    }
}
