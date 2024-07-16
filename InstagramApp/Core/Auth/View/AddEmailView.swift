//
//  AddEmailView.swift
//  InstagramApp
//
//  Created by Helen on 25.06.2024.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You`ll use this email to sign to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(IGFieldModifier())
            
            NavigationLink {
                CreateUserNameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 44)
                    .cornerRadius(10)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            .padding(.top)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    AddEmailView()
}
