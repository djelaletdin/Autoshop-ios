//
//  HomeModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/04.
//

import Foundation

// MARK: - WelcomeElement
struct HomeModel: Codable {
    let categoryName: String
    let data: [HomeDatum]

    enum CodingKeys: String, CodingKey {
        case categoryName = "category_name"
        case data
    }
}

// MARK: - Datum
struct HomeDatum: Codable, Identifiable {
    let id: Int
    let fullName, note: String?
    let cookingTime, categoryID: Int?
    let name: String?
    let image: String?
    let amount: Int?
    let isAdded: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case fullName = "full_name"
        case note
        case cookingTime = "cooking_time"
        case categoryID = "category_id"
        case name, image, amount
        case isAdded = "is_added"
    }
}
