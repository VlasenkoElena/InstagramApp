//
//  RegistrationViewModel.swift
//  InstagramApp
//
//  Created by Helen on 01.07.2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var userName = ""
    @Published var password = ""
    @Published var email = ""
    
    func createUser() async throws {
       try await AuthService.shared.createUser(email: email, password: password, userName: userName)
        
        userName = ""
        password = ""
        email = ""
    }
}
