//
//  RecipeViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/14.
//

import Foundation
import Alamofire

class RecipeViewModel: ObservableObject {
    
    @Published var productsData: [RecipeProduct] = []
    @Published var isSearching = true
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []

    var id: Int? {
        didSet {
            self.savedItems = db.load()
            if let newId = id {
                fetchData(id: newId)
            }
            
        }
    }
    
    @MainActor
    func initFetchData(id: Int)  {
        self.savedItems = db.load()
        fetchData(id: id)
    }
    
    private func fetchData(id: Int) {
        
        let request = AF.request("http://autoshop.test/api/recipe/\(id)")
        print("sup")
        request.responseDecodable(of: [RecipeProduct].self) { (response) in
            guard let data = response.value else { return }
            DispatchQueue.main.async {
                self.productsData = data
                self.isSearching = false
                print(data)
            }
        }
    }
    
    // MARK:
    var filteredItems: [RecipeProduct]  {
        if showingFavs {
            return productsData.filter { savedItems.contains($0.productID) }
        }
        return productsData
    }
    
    private var db = Database()
    
    
    func contains(_ item: RecipeProduct) -> Bool {
            savedItems.contains(item.productID)
        }
    
    // Toggle saved items
    func toggleFav(item: RecipeProduct) {
        print("i am in")
        print(item)
        if contains(item) {
            savedItems.remove(item.productID)
        } else {
            savedItems.insert(item.productID)
        }
        db.save(items: savedItems)
    }
}
