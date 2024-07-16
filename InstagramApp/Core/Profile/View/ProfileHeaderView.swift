//
//  ProfileHeaderView.swift
//  InstagramApp
//
//  Created by Helen on 26.06.2024.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack {
                    UserStatViewView(value: 3, title: "Posts")
                    
                    UserStatViewView(value: 2, title: "Followers")
                    
                    UserStatViewView(value: 2, title: "Following")
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 4) {
                if let fullName = user.fullName {
                    Text(fullName)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button(user.isCurrentUser ? "Edit profile" : "Follow") {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                }
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(user.isCurrentUser ? .black : .white)
            .frame(width: 360, height: 32)
            .background(user.isCurrentUser ? .white : Color(.systemBlue))
            .cornerRadius(6)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile, content: {
            EditProfileView(user: user)
        })
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[0])
}
