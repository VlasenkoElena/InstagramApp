//
//  LoginViewModel.swift
//  InstagramApp
//
//  Created by Helen on 01.07.2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var password = ""
    @Published var email = ""
    
    func signIn() async throws {
       try await AuthService.shared.login(withEmail: email, password: password)
    }
}
