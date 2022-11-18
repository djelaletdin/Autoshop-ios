//
//  HomeViewModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/05.
//

import Foundation
import Alamofire

class HomeViewModel: ObservableObject {
    
    @Published var homeData: [HomeModel] = []
    @Published var isSearching = true
    @Published var showingFavs = false
    @Published var savedItems: Set<Int> = []
    
    @MainActor
    func initFetchData()  {
        fetchData()
    }
    
    private func fetchData() {
        
        let request = AF.request("http://autoshop.test/api/index")
        print("sup")
        request.responseDecodable(of: [HomeModel].self) { (response) in
            guard let data = response.value else { return }
            DispatchQueue.main.async {
                self.homeData = data
                self.isSearching = false
                print(data)
            }
        }
    }
    
    // MARK:
//    var filteredItems: [HomeDatum]  {
//        if showingFavs {
//            return homeData.filter { savedItems.contains($0) }
//        }
//        return homeData
//    }
    
    private var db = Database()
    
    
    func contains(_ item: HomeDatum) -> Bool {
            savedItems.contains(item.id)
        }
    
    // Toggle saved items
    func toggleFav(item: HomeDatum) {
        print("i am in")
        print(item)
        if contains(item) {
            savedItems.remove(item.id)
        } else {
            savedItems.insert(item.id)
        }
        db.save(items: savedItems)
    }
}
