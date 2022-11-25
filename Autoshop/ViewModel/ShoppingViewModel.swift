//
//  ShoppingViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/28.
//

import Foundation
import Alamofire

class ShoppingViewModel: ObservableObject {
    
    @Published var products: [ProductModel] = []
    @Published var isSearching = false
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []

    @MainActor
    func initFetchData() {
        self.savedItems = db.load()
        isSearching = true
        fetchData(db.get())
        isSearching = false
    }
    
    func storeData(){
        let items: [[String: Int]] = CartItem.cartItems.map{$0.dictionaryRepresentation}
        let parameters: [String: Any] = ["products": items]
        
        
        AF.request("https://autoshop.realapps.xyz/api/order", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: SuccesModel.self) { [weak self] response in
                    
            if let _ = response.data {
                self?.savedItems = []
                self?.products = []
                self?.db.resetDefaults()
            }
        }
        
        
        
    }
    
    private func fetchData(_ ids: [Int])  {
        let parameters: [String: [Int]] = ["products": ids]
        
        AF.request("https://autoshop.realapps.xyz/api/shopping_list", method: .post, parameters: parameters, encoding: URLEncoding.httpBody).responseDecodable(of: [ProductModel].self) { response in
            DispatchQueue.main.async {
                self.products = response.value ?? []
                if CartItem.cartItems.isEmpty {
                    for product in self.products {
                        CartItem.addItem(item: CartItem(id: product.id, amount: product.amount))
                    }
                }
            }
            
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

struct SuccesModel: Codable {
    let status: Int
    let message: String
}
