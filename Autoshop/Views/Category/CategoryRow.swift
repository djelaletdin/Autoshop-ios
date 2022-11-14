//
//  ItemRow.swift
//  DineApp
//
//  Created by Didar Jelaletdinov on 2022/09/16.
//

import SwiftUI

struct CategoryRow: View {

    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    let item: ProductCategoryData
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.yellow)
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text(item.name)
                .font(.headline)
            Spacer()
            Text("200g")
                .font(.subheadline)
        }
        .addShadow()
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(item: ProductCategoryData(id: 1, name: "asdasd", image: "asdasd", amount: 12))
    }
}
