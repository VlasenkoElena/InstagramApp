//
//  LoginView.swift
//  InstagramApp
//
//  Created by Helen on 24.06.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.instagram)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack {
                    TextField("Enter your email", text: $loginViewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGFieldModifier())
                    
                    SecureField("Enter password", text: $loginViewModel.password)
                        .modifier(IGFieldModifier())
                }
                
                Button {
                    print("Print password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task {
                       try await loginViewModel.signIn()
                    }
                } label: {
                    Text("Log in")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 44)
                        .cornerRadius(10)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Continue with facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
