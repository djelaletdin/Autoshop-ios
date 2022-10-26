//
//  ProductModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/18.
//

import Foundation

struct ProductModel: Codable, Identifiable {
    
    let id, categoryID: Int
    let name: String
    let image: String?
    let barcode: String
    let amount: Int

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "category_id"
        case name, image, barcode, amount
    }
}
