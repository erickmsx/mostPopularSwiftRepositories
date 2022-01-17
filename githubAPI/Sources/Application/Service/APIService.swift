//
//  APIService.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import Foundation

class APIService {
    
    private let basePath = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&page=1"
    
    private let pullsPath = "https://api.github.com/repos/"
    
    private let urlComplete = "pulls"
    
    func fetchRepository(completion: @escaping (RepositoryResponse) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: basePath)!) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            do {
                let repository = try JSONDecoder().decode(RepositoryResponse.self, from: data)
                completion(repository)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func fetchPulls(user: String, repository: String, completion: @escaping ([PullsResponse]) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: "\(pullsPath)\(user)/\(repository)/\(urlComplete)")!) { data, response, error in

            guard let data = data else {
                return
            }

            do {
                let repositoryDetail = try JSONDecoder().decode([PullsResponse].self, from: data)
                completion(repositoryDetail)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

