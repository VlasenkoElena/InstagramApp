//
//  CurrentUserProfileView.swift
//  InstagramApp
//
//  Created by Helen on 26.06.2024.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
               ProfileHeaderView(user: user)
                
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signout()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
