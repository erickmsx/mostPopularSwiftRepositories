//
//  RepositoryTableViewCell.swift
//  githubAPI
//
//  Created by Erick Martins on 06/01/22.
//

import UIKit
import Kingfisher

struct RepositoryCellDTO {
    let name: String
    let description: String
    let authorLogin: String
    let forks: String
    let stars: String
    let avatarUrl: String
}

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func fill(dto: RepositoryCellDTO) {
        nameLabel.text = dto.name
        descriptionLabel.text = dto.description
        loginLabel.text = dto.authorLogin
        forksLabel.text = dto.forks
        starsLabel.text = dto.stars
        
        let url = URL(string: dto.avatarUrl)
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true
        avatarImageView.kf.setImage(with: url)
    }
}
