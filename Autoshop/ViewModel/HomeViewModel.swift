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
    @Published var isSearching = false

    @MainActor
    func initFetchData()  {
        isSearching = true
        fetchData()
        isSearching = false
    }
    
    private func fetchData() {
        
        let request = AF.request("http://autoshop.test/api/index")
        
        request.responseDecodable(of: [HomeModel].self) { (response) in
            guard let data = response.value else { return }
            DispatchQueue.main.async {
                self.homeData = data
                print(data)
            }
        }
        
        
    }
}
