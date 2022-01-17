//
//  RepositoryResponse.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import Foundation

struct RepositoryResponse: Codable {
    let items: [ItemsDetail]
}

struct ItemsDetail: Codable{
    let name: String?
    let description: String?
    let forks: Int
    let stars: Int
    let owner: OwnerDetail
}

struct OwnerDetail: Codable{
    let authorLogin: String?
    let avatarUrl: String?
}

extension OwnerDetail {
    enum CodingKeys: String, CodingKey {
        case authorLogin = "login"
        case avatarUrl = "avatar_url"
    }
}

extension ItemsDetail {
    enum CodingKeys: String, CodingKey {
        case stars = "stargazers_count"
        case name
        case description
        case forks
        case owner
    }
}





/*extension RepositoryResponse {
    enum CodingKeys: String, CodingKey {
        case authorLogin = "login"
    }
}*/


