//
//  PullsViewController.swift
//  githubAPI
//
//  Created by Erick Martins on 12/01/22.
//

import UIKit

class PullsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var userLogin: String = ""
    var repositoryName: String = ""
    
    private lazy var viewModel: PullsViewModel = PullsViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        view.lock()
    }
    
    func setup(_ user: String, _ repository: String){
        receiveRepository(user, repository)
    }
    
    func setupView() {
        
        viewModel.loadRepository(userLogin, repositoryName)
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PullsCell.self)
        setupNavBar()
        
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 600;
    }
}

private extension PullsViewController {
    
    func setupNavBar() {
        navigationItem.title = "Pull Requests"
    }
    
    func cell(_ tableView: UITableView, indexPath: IndexPath, repositoryDetailDTO: PullsCellDTO) -> UITableViewCell {
        
        let cell = tableView.dequeCell(PullsCell.self, indexPath)
        cell.fill(dto: repositoryDetailDTO)
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension PullsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        cell(tableView, indexPath: indexPath, repositoryDetailDTO: viewModel.dtoForRows(index: indexPath.row))
    }
}

extension PullsViewController: UITableViewDelegate {
    
}

extension PullsViewController: PullsViewModelDelegate {
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
    
            self.tableView.reloadData()
            self.tableView.isHidden = false
            self.view.unlock()
        }
    }
    
    func receiveRepository(_ repository: String,_ name: String){
        
        self.userLogin = repository
        self.repositoryName = name
    }
}
