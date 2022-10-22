//
//  Service.swift
//  Setirler
//
//  Created by Didar Jelaletdinov on 01.04.2021.
//

import UIKit

class Service {
    
    static let shared = Service()
    
    
    func fetchProductCategories(completion: @escaping ([ProductCategoryData]?, Error?) -> ()) {
        let urlString = "http://autoshop.test/api/index"
        print(urlString)
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchCategoryData(id: Int, completion: @escaping (CategoryData?, Error?) -> ()) {
        let urlString = "http://autoshop.test/api/category/\(id)"

        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    
    
    // declare my generic json function here
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()) {
        print("i am in")
        guard let url = URL(string: urlString) else { print("invalid url"); return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("errorr")
                completion(nil, err)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                // success
                print("success")
                completion(objects, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
    
}
