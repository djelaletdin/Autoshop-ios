//
//  CartItem.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/12.
//

import Foundation


struct CartItem {
    var id: Int
    var amount: Int
    var dictionaryRepresentation : [String:Int] { return ["id":id, "amount":amount] }


    static var cartItems: [CartItem] = []
    static var addedItems: [Int] = []
    
    static func addItem(item: CartItem) {
        CartItem.cartItems.append(item)
    }
    
    static func addItemId(id: Int){
        CartItem.addedItems.append(id)
    }
    

}
