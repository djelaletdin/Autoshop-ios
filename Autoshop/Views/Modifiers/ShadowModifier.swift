//
//  ShadowModifier.swift
//  Autoshop
//
//  Created by Didar Jelaletdinov on 2022/11/13.
//

import SwiftUI

struct Shadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(9)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .shadow(color: Color.gray.opacity(0.2), radius: 4, x: 0, y: 0)
    }
}

extension View {
    func addShadow() -> some View {
        modifier(Shadow())
    }
}
