//
//  SwiftUIView.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/10.
//

import SwiftUI

struct ShoppingListRowView: View {
    
    @State var item: ProductModel
    
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
            CustomStepper(amount: $item.amount)
            
        }
        .foregroundColor(.black)
        .padding(.horizontal, 15)
        .background(Color.white)
        .cornerRadius(9)
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)
    }
}

struct ShoppingListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListRowView(item: ProductModel(id: 1, categoryID: 1, name: "Ullakan alma", image: "", barcode: "123asd123", amount: 12, isAdded: false))
    }
}

struct CustomStepper : View {
    
    @Binding var amount: Int
        
//    init(withAmount: Binding<Int>) {
//        self._amount = withAmount
//    }

    var body: some View {
            HStack {
            
                Button(action: {
                    self.amount -= 1
                    self.feedback()
                }, label: {
                    Image(systemName: "minus.square")
                        .foregroundColor(Color.gray)
                })
                
                Text("\(amount)")

                Button(action: {
                    self.amount += 1
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
