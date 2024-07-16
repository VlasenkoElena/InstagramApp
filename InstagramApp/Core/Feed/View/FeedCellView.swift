//
//  FeedCellView.swift
//  InstagramApp
//
//  Created by Helen on 20.06.2024.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    let post: Post
    
    var body: some View {
        VStack {
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.userName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading)
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            HStack(spacing: 16) {
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Text("\(post.user?.userName ?? "") ").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .padding(.top, 1)
            
            Text("\(post.timestamp.dateValue())")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCellView(post: Post.MOCK_POSTS[0])
}
