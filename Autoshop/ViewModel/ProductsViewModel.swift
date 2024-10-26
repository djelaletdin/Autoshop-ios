//
//  ProductsViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import Foundation


class ProductsViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    @Published var isSearching = true
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []

    @MainActor
    func initFetchData(_ id: Int) async {
        self.savedItems = db.load()
        isSearching = true
        products = await fetchData(id)
        isSearching = false
    }
    
    private func fetchData(_ id: Int) async -> [ProductModel] {
        
        guard let url = URL(string: "http://autoshop.realapps.xyz/api/category/\(id)") else { return [] }
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
    
    var filteredItems: [ProductModel]  {
        if showingFavs {
            return products.filter { savedItems.contains($0.id) }
        }
        return products
    }
    
    private var db = Database()
    

    
    func contains(_ item: ProductModel) -> Bool {
            savedItems.contains(item.id)
        }
    
    // Toggle saved items
    func toggleFav(item: ProductModel) {
        if contains(item) {
            savedItems.remove(item.id)
        } else {
            savedItems.insert(item.id)
        }
        db.save(items: savedItems)
    }
    
}
