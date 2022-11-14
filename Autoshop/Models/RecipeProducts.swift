//
//  RecipeProducts.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/14.
//

import Foundation

// MARK: - WelcomeElement
struct RecipeProduct: Identifiable, Codable  {
    let id, recipeID, productID, amount: Int
    let name: String
    let isAdded: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case recipeID = "recipe_id"
        case productID = "product_id"
        case amount, name
        case isAdded = "is_added"
    }
}
