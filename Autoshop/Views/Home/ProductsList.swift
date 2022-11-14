//
//  ProductsList.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/05.
//

import SwiftUI

struct ProductsList: View {
    
    var item: HomeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.categoryName)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ForEach(item.data) { product in
                ListCard(name: product.name ?? "")
            }
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList(item: HomeModel(categoryName: "Out of stock products", data: []))
    }
}

struct ListCard: View {
    
    var name: String = "Recipe Name"
    var note: String = "lorem ipsum"
    var time: Int = 0
    
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.yellow)
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text(name)
                .font(.headline)
            Spacer()
            Text(note)
                .font(.subheadline)
        }
        .addShadow()
    }
}
