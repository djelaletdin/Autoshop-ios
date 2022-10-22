//
//  CategoryModel.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/09/16.
//

import Foundation

// MARK: - Welcome
struct CategoryData: Codable {
    let status: Int
    let data: [ProductDatum]
}

// MARK: - Datum
struct ProductDatum: Codable {
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
