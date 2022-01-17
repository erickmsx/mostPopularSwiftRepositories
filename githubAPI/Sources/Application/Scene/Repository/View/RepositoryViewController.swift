//
//  RepositoryViewController.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import UIKit
//import Kingfisher

class RepositoryViewController: UIViewController {
    
    @IBOutlet weak var totalCountLabel: UILabel!
    
    private lazy var viewModel: RepositoryViewModel = RepositoryViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setup()
    }
    
    //send to the viewModel the selected category from the list
    func setup() {
        viewModel.setup()
    }
}

private extension RepositoryViewController {
    
    func setupView() {
        hideComponents()
    }
    
    //fill the label and the imageView
    func fill() {
        
        totalCountLabel.text = viewModel.repository.items.description
    }
    
    func hideComponents() {
        totalCountLabel.isHidden = true
    }
    
    func showComponents() {
        totalCountLabel.isHidden = false
    }
    
    func setupNavBar() {
        navigationItem.title = "title"
    }
}

extension RepositoryViewController: RepositoryViewModelDelegate {
    
    func didSearch() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            
            self.fill()
            self.setupNavBar()
            self.showComponents()
        }
    }
}
