//
//  SwiftUIView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/10.
//

import SwiftUI

struct ShoppingListRowView: View {
    
    @State var item: ProductModel
    var index: Int
    
    var body: some View {
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
            CustomStepper(item: $item, index: index)
        }
        .addShadow()
    }
}

struct ShoppingListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListRowView(item: ProductModel(id: 1, categoryID: 1, name: "Ullakan alma", image: "", barcode: "123asd123", amount: 12, isAdded: false), index: 1)
    }
}

struct CustomStepper : View {
    
    @Binding var item: ProductModel
    @State var isChangeStarted = false
    var index: Int

    var body: some View {
            HStack {
            
                Button(action: {
                    self.item.amount -= 1
                    CartItem.cartItems[index] = CartItem(id: item.id, amount: self.item.amount)
                    print(CartItem.cartItems)
                    self.feedback()
                }, label: {
                    Image(systemName: "minus.square")
                        .foregroundColor(Color.gray)
                })
                
                Text("\(item.amount)")

                Button(action: {
                    self.item.amount += 1
                    CartItem.cartItems[index] = CartItem(id: item.id, amount: self.item.amount)
                    self.feedback()
                }, label: {
                    Image(systemName: "plus.square")
                        .foregroundColor(Color.gray)
                })
        }
    }

    func feedback() {
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.impactOccurred()
    }
}
