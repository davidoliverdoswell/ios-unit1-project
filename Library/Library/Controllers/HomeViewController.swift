//
//  HomeViewController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/23/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

let appColor = UIColor(red: 25/255, green: 142/255, blue: 255/255, alpha: 1)

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    let libraryLabel: UILabel = {
        let label = UILabel()
        label.text = Strings().libraryText
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let librarySubLabel: UILabel = {
        let label = UILabel()
        label.text = Strings().librarySubText
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings().loginButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(logintapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func logintapped(sender: UIButton) {
        
        // MARK: - Authenticate New User
        
        let viewController = UIViewController()
        
        GoogleBooksAuthorizationClient.shared.authorizeIfNeeded(presenter: viewController) { (error) in
            if let error = error {
                NSLog("Error authenticating: \(error)")
            } else {
//                let layout = UICollectionViewFlowLayout()
//                layout.scrollDirection = .horizontal
                
//                let bookCollectionViewController = BookCollectionViewController(collectionViewLayout: layout)
                
                let bookDetailViewController = BookDetailViewController()
                self.navigationController?.pushViewController(bookDetailViewController, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        setUpViews()
    }
    
    func setUpViews() {
        
        view.backgroundColor = appColor
        
        view.addSubview(libraryLabel)
        view.addSubview(librarySubLabel)
        view.addSubview(loginButton)
        
        libraryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        libraryLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        libraryLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        libraryLabel.heightAnchor.constraint(equalToConstant: 51).isActive = true

        librarySubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        librarySubLabel.centerYAnchor.constraint(equalTo: libraryLabel.bottomAnchor, constant: 30).isActive = true
        librarySubLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        librarySubLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: librarySubLabel.bottomAnchor, constant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }

}
