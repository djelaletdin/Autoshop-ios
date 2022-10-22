//
//  ItemRow.swift
//  DineApp
//
//  Created by Didar Jelaletdinov on 2022/09/16.
//

import SwiftUI

struct ItemRow: View {

    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: ProductCategoryData
    
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
            
//            ForEach(item.restrictions, id: \.self) { restriction in
//                Text(restriction)
//                    .font(.caption)
//                    .fontWeight(.black)
//                    .padding(5)
//                    .background(colors[restriction])
//                    .clipShape(Circle())
//                    .foregroundColor(.white)
//            }
        }
        
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: ProductCategoryData(id: 1, name: "asdasd", image: "asdasd", amount: 12))
    }
}
