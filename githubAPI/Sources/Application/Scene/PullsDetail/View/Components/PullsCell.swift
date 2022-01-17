//
//  PullsCell.swift
//  githubAPI
//
//  Created by Erick Martins on 14/01/22.
//

import UIKit

struct PullsCellDTO {
    let body: String
    let title: String
    let createdAt: String
    let avatarUrl: String
}

class PullsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    func fill(dto: PullsCellDTO) {
        titleLabel.text = dto.title
        createdAtLabel.text = dto.createdAt
        bodyLabel.text = dto.body
        
        let url = URL(string: dto.avatarUrl)
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true
        avatarImageView.kf.setImage(with: url)
    }
}

