//
//  ProductCategoryData.swift
//  Smart Shoplist
//
//  Created by Didar Jelaletdinov on 2022/09/15.
//

import Foundation

// MARK: - Datum
struct ProductCategoryData: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String?
    let amount: Int
}
