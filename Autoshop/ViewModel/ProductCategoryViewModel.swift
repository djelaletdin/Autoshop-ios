//
//  ProductCategoryViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import Foundation

class ProductCategoryViewModel: ObservableObject {
    
    @Published var categories: [ProductCategoryData] = []
    @Published var isSearching = false

    @MainActor
    func initFetchData() async {
        isSearching = true
        categories = await fetchData()
        isSearching = false
    }
    
    private func fetchData() async -> [ProductCategoryData] {
        print("anything")
        guard let url = URL(string: "http://autoshop.test/api/index") else { return [] }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode([ProductCategoryData].self, from: data)
            return result
        }
        catch {
            return []
        }
        
    }
}