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
}

/*extension RepositoryResponse {
    enum CodingKeys: String, CodingKey {
        case value = "value"
 }
}*/


