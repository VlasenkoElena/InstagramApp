//
//  CompleteSignUpView.swift
//  InstagramApp
//
//  Created by Helen on 25.06.2024.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            Text("Welcome to Instagram, \(viewModel.userName)")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Text("Click below to complete registrartion and start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Button {
                Task {
                  try await viewModel.createUser()
                }
            } label: {
                Text("Complete Sign Up")
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
    CompleteSignUpView()
}
