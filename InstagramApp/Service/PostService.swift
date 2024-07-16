//
//  PostService.swift
//  InstagramApp
//
//  Created by Helen on 04.07.2024.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postCollection = Firestore.firestore().collection("posts")
    
    static func fetchUserPost(withUid uid: String) async throws -> [Post] {
        let snapshot = try await postCollection.whereField("ownerUUID", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
    
    static func fetchAllPosts() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUUID
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
}
