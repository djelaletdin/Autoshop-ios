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
            if item.amount > 3 {
                return .green
            } else if item.amount > 0 && item.amount < 3{
                return .gray.opacity(50)
            } else {
                return .red
            }
        }()
        
        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.gray.opacity(50))
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text(item.name)
                .font(.headline)
            Spacer()
            Text("Added")
                .font(.caption)
                .fontWeight(.black)
                .padding(5)
                .background(color)
                .foregroundColor(.white)
        }
        .addShadow()
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(item: ProductModel(id: 1, categoryID: 1, name: "Ullakan alma", image: "", barcode: "123asd123", amount: 12, isAdded: false))
    }
}
