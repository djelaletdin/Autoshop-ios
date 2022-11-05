//
//  ProductsList.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/05.
//

import SwiftUI

struct ProductsList: View {
    var body: some View {
        VStack {
            ForEach(0..<5) { _ in
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
            Text("asdasdsd")
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.green)
        .padding()
    }
}
