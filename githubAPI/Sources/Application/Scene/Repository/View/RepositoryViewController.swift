//
//  RepositoryViewController.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import UIKit

class RepositoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var viewModel: RepositoryViewModel = RepositoryViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        viewModel.loadRepository()
        tableView.isHidden = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RepositoryCell.self)
        setupNavBar()
        
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 600;
    }
}

private extension RepositoryViewController {
    
    func setupNavBar() {
        navigationItem.title = "Repositórios"
    }
    
    func cell(_ tableView: UITableView, indexPath: IndexPath, repositoryDTO: RepositoryCellDTO) -> UITableViewCell {
        
        let cell = tableView.dequeCell(RepositoryCell.self, indexPath)
        cell.fill(dto: repositoryDTO)
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension RepositoryViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        cell(tableView, indexPath: indexPath, repositoryDTO: viewModel.dtoForRows(index: indexPath.row))
    }
}

extension RepositoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedRepository(index: indexPath.row)
    }
}

extension RepositoryViewController: RepositoryViewModelDelegate {
    
    func didLoad() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func sendRepository(_ repository: String, name: String) {
        
        let repositoryDetailViewController = PullsViewController()
        repositoryDetailViewController.setup(repository, name)
        navigationController?.pushViewController(repositoryDetailViewController, animated: true)
    }
}
