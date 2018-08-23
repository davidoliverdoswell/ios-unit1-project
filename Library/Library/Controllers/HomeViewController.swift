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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Authenticate New User or Crash
        
        let viewController = UIViewController()
        
        GoogleBooksAuthorizationClient.shared.authorizeIfNeeded(presenter: viewController) { (error) in
            if let error = error {
                NSLog("Error authenticating: \(error)")
                fatalError("ERROR: \(error)")
            }
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            
            let bookCollectionViewController = BookCollectionViewController(collectionViewLayout: layout)
            
            let _ = UINavigationController(rootViewController: bookCollectionViewController)
        }
        
        navigationController?.navigationBar.isHidden = true
        
        setUpViews()
    }
    
    func setUpViews() {
        
        view.backgroundColor = appColor
        
        view.addSubview(libraryLabel)
        view.addSubview(librarySubLabel)
        
        libraryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        libraryLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        libraryLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        libraryLabel.heightAnchor.constraint(equalToConstant: 51).isActive = true

        librarySubLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        librarySubLabel.centerYAnchor.constraint(equalTo: libraryLabel.bottomAnchor, constant: 30).isActive = true
        librarySubLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        librarySubLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
    }

}
