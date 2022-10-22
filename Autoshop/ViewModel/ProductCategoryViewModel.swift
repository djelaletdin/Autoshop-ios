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
    
    enum AlbumsFetcherError: Error {
         case invalidURL
         case missingData
     }
    
//    func fetchData(){
//        Service.shared.fetchProductCategories { (rawData, error) in
//
//            print("data is being fetched")
//
//            if let error = error{
//                // TODO: - Show error to the user
//                print("error while fetching app groups", error)
//                return
//
//            }
//            if let data = rawData{
//                print("sup")
//                DispatchQueue.main.async {
//                    self.categories = data
//                    print(self.categories)
//                }
//            }
//        }
//    }
    
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
            print(result)
            return result
        }
        catch {
            return []
        }
        
    }
}
