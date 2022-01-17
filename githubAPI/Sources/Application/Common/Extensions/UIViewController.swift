//
//  UIViewController.swift
//  githubAPI
//
//  Created by Erick Martins on 16/01/22.
//

import UIKit

extension UIViewController {
    
    func present(message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: "gitHub API", message: message, preferredStyle: .alert)
        alert.view.tintColor = .black
        let action = UIAlertAction(title: "OK", style: .default, handler: handler)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
