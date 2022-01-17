//
//  RepositoryViewModel.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import Foundation

protocol RepositoryViewModelDelegate: AnyObject {
    
    func didSearch()
}

class RepositoryViewModel {
    
    private var repositoryResponse: RepositoryResponse?
    private weak var delegate: RepositoryViewModelDelegate?
    let apiService = APIService()
    
    //map the request into the model
    var repository: RepositoryResponse {
        
        return repositoryResponse ?? RepositoryResponse(items: [])
    }
    
    init(delegate: RepositoryViewModelDelegate) {
        self.delegate = delegate
    }
    
    //receive the selected category from viewController
    func setup() {
        
        loadRepository() //send the selected item to request
    }
    
    //take the selected category from func setup and make the request to the beck-end
    //get the results of beck-end
    func loadRepository() {
        
        apiService.fetchRepository() { [weak self] result in
            guard let self = self else { return }
            
            self.repositoryResponse = result
            self.delegate?.didSearch()
        }
    }
}

