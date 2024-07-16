//
//  UserStatViewView.swift
//  InstagramApp
//
//  Created by Helen on 20.06.2024.
//

import SwiftUI

struct UserStatViewView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(title)
                .font(.footnote)
        }
        .frame(width: 78)
    }
}

#Preview {
    UserStatViewView(value: 0, title: "Posts")
}
