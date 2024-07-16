//
//  Post.swift
//  InstagramApp
//
//  Created by Helen on 26.06.2024.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUUID: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(id: UUID().uuidString, ownerUUID: UUID().uuidString, caption: "Simbiot", likes: 20, imageUrl: "venom1", timestamp: Timestamp(), user: User.MOCK_USERS[0]),
        
        .init(id: UUID().uuidString, ownerUUID: UUID().uuidString, caption: "King of Asgard", likes: 100, imageUrl: "loki2", timestamp: Timestamp(), user: User.MOCK_USERS[1]),
        
        .init(id: UUID().uuidString, ownerUUID: UUID().uuidString, caption: "HYDRA forever", likes: 30, imageUrl: "redSkull1", timestamp: Timestamp(), user: User.MOCK_USERS[2]),
        
        .init(id: UUID().uuidString, ownerUUID: UUID().uuidString, caption: "everyone deserves a second chance", likes: 250, imageUrl: "spiderMan1", timestamp: Timestamp(), user: User.MOCK_USERS[3]),
        
        .init(id: UUID().uuidString, ownerUUID: UUID().uuidString, caption: "Simbiot", likes: 250, imageUrl: "venom2", timestamp: Timestamp(), user: User.MOCK_USERS[0])
    ]
}
