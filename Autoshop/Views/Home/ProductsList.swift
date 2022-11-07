//
//  ProductsList.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/05.
//

import SwiftUI

struct ProductsList: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Out of stock products")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.leading)
            
            ForEach(0..<10) { _ in
                ListCard()
            }
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList()
    }
}

struct ListCard: View {
    var body: some View {
        HStack {
            Image("")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .background(Color.yellow)
                .cornerRadius(9)
                .padding(.vertical, 8)
            Text("asdasdsd")
                .font(.headline)
            Spacer()
            Text("200g")
                .font(.subheadline)
        }
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity)
        .background(Color.green)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        
    }
}
