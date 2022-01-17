//
//  PullsViewModel.swift
//  githubAPI
//
//  Created by Erick Martins on 12/01/22.
//

import Foundation

protocol PullsViewModelDelegate: AnyObject {
    
    func didLoad()
    func receiveRepository(_ user: String, _ repository: String)
}

class PullsViewModel {
    var pullsList: [PullsResponse] = []
    private var user: String?
    private var repository: String?
    private weak var delegate: PullsViewModelDelegate?
    
    init(delegate: PullsViewModelDelegate) {
        self.delegate = delegate
    }
    
    func receiveRepository(_ user: String, _ repository: String){
        self.user = user
        self.repository = repository
        loadRepository(user, repository)
    }
    
    func loadRepository(_ user: String, _ repository: String) {
        
        APIService().fetchPulls(user: user, repository: repository) { [weak self] result in
            guard let self = self else { return }
            
            self.pullsList = result
            self.delegate?.didLoad()
        }
    }
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows() -> Int {
        return pullsList.count
    }
    
    func dtoForRows(index: Int) -> PullsCellDTO {
        
        let pulls = pullsList[index]
        return PullsCellDTO(body: pulls.body, title: pulls.title, createdAt: pulls.createdAt, avatarUrl: pulls.user.avatarUrl)
    }
}

