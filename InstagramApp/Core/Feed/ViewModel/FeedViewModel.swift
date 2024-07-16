//
//  FeedViewModel.swift
//  InstagramApp
//
//  Created by Helen on 04.07.2024.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchAllPosts()
    }
}
