//
//  IGFealdModifier.swift
//  InstagramApp
//
//  Created by Helen on 25.06.2024.
//

import SwiftUI

struct IGFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
