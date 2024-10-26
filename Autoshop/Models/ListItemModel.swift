//
//  ListItemModel.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import Foundation

struct Item: Identifiable, Codable {
    var id: Int
    var title: String
    var description: String
    var isFaved: Bool
    
    static var sampleItems: [Item] {
        var temptList = [Item]()
        
        for i in 1...20 {
            let id = i
            let title = "Title: \(i)"
            let description = "This is a sample description."
            
            temptList.append(Item(id: id, title: title, description: description, isFaved: false))
            
        }
        return temptList
    }
}
