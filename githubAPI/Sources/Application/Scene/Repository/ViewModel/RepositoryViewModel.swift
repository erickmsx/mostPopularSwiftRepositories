//
//  RepositoryViewModel.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import Foundation

protocol RepositoryViewModelDelegate: AnyObject {
    
    func didLoad()
    func sendRepository(_ repository: String, name: String)
}

class RepositoryViewModel {
    var repositories: [ItemsDetail] = []
    private var repositoryResponse: RepositoryResponse?
    private weak var delegate: RepositoryViewModelDelegate?
    
    var repository: RepositoryResponse {
        
        return repositoryResponse ?? RepositoryResponse(items: [])
    }
    
    init(delegate: RepositoryViewModelDelegate) {
        self.delegate = delegate
    }
    
    func loadRepository() {
        
        APIService().fetchRepository() { [weak self] result in
            guard let self = self else { return }
            
            self.repositoryResponse = result
            self.delegate?.didLoad()
        }
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        return repositoryResponse?.items.count ?? 0
    }
    
    func dtoForRows(index: Int) -> RepositoryCellDTO {
        
        guard let dto = repositoryResponse?.items[index] else{
            
            return RepositoryCellDTO(name: "", description: "", authorLogin: "", forks: "", stars: "", avatarUrl: "")
        }
        
        return RepositoryCellDTO(name: dto.name ?? "", description: dto.description ?? "", authorLogin: dto.owner.authorLogin ?? "", forks: "\(String(describing: dto.forks))", stars: "\(String(describing: dto.stars))", avatarUrl: dto.owner.avatarUrl ?? "")
    }
    
    func selectedRepository(index: Int) {
        if let repository = repositoryResponse?.items[index]{
            delegate?.sendRepository(repository.owner.authorLogin ?? "", name: repository.name ?? "")
        }
    }
}


