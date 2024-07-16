//
//  User.swift
//  InstagramApp
//
//  Created by Helen on 26.06.2024.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var userName: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false}
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: UUID().uuidString, userName: "Venom", profileImageUrl: "venom", fullName: "Eddie Brock", bio: "Alien Symbiote", email: "venom@email.com"),
        
        .init(id: UUID().uuidString, userName: "Loki", profileImageUrl: "loki", fullName: "Loki Laufeyson", bio: "King of the Frost Giants", email: "loki@email.com"),
        
        .init(id: UUID().uuidString, userName: "Red Skull", profileImageUrl: "redSkull", fullName: "Johann Schmidt", bio: "Former head of HYDRA", email: "redSkull@email.com"),
        
        .init(id: UUID().uuidString, userName: "Spider Man", profileImageUrl: "spiderMan", fullName: "Piter Parker", bio: "Midtown School of Science and Technology student", email: "spiderMan@email.com")
    ]
 }
