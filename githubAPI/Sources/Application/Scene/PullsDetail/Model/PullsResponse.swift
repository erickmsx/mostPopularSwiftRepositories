//
//  PullsResponse.swift
//  githubAPI
//
//  Created by Erick Martins on 12/01/22.
//

import Foundation

struct PullsResponse: Codable{
    let body: String
    let title: String
    let createdAt: String
    let user: User
}

struct User: Codable{
    let avatarUrl: String
}

extension PullsResponse {
    enum CodingKeys: String, CodingKey {
        
        case body
        case title
        case createdAt = "created_at"
        case user
    }
}

extension User {
    enum CodingKeys: String, CodingKey {
        
        case avatarUrl = "avatar_url"
        
    }
}





