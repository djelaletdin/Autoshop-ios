//
//  ProductsViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import Foundation

class ProductsViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    @Published var isSearching = false

    @MainActor
    func initFetchData(_ id: Int) async {
        isSearching = true
        products = await fetchData(id)
        isSearching = false
    }
    
    private func fetchData(_ id: Int) async -> [ProductModel] {
        
        guard let url = URL(string: "http://autoshop.test/api/category/\(id)") else { return [] }
        print(url)
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let result = try JSONDecoder().decode([ProductModel].self, from: data)
            return result
        }
        catch {
            print("network error")
            return []
        }
        
    }
}
