//
//  ProductRow.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/10/26.
//

import SwiftUI

struct ProductRow: View {
    
    let item: ProductModel
    
    var body: some View {
        
        let color: Color = {
            if item.amount > 5 {
                return .green
            } else if item.amount > 0 && item.amount < 5{
                return .yellow
            } else {
                return .red
            }
        }()
        
        HStack {
            
            Image(item.image ?? "")
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("\(item.amount) left")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(color)
                    .foregroundColor(.white)
            }
        }
        
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(item: ProductModel(id: 1, categoryID: 1, name: "Ullakan alma", image: "", barcode: "123asd123", amount: 12, isAdded: false))
    }
}
