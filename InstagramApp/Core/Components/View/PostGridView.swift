//
//  PostGridView.swift
//  InstagramApp
//
//  Created by Helen on 26.06.2024.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    private let columns: [GridItem] = [
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1),
            .init(.flexible(), spacing: 1)
        ]
    
    var imageDemention: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 2) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDemention, height: imageDemention)
                    .clipped()
                    
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[0])
}
