//
//  ProductRow.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import SwiftUI

struct ProductRow: View {
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: ProductModel
    
    var body: some View {
        HStack {
            
            Image(item.image ?? "")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
            }
            
            Spacer()
            
            Text("\(item.amount) out of stock")
        }
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(item: ProductModel(id: 1, categoryID: 1, name: "Ullakan alma", image: "", barcode: "123asd123", amount: 12, isAdded: false))
    }
}
