//
//  BookDetailViewController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let bookImage: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.cornerRadius = 10
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bookReview: UITextView = {
        let textView = UITextView()
        textView.textAlignment = .justified
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 10
        textView.isEditable = false
        textView.isSelectable = true
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareBookTapped(sender:)))

    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setUpViews()
    }
    
    // MARK: - Share Book on Social Media or iMessage
    
    @objc func shareBookTapped(sender: UIButton) {
        let vc = UIActivityViewController(activityItems: [bookImage.image!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

    
    // MARK: - Constraints
    
    func setUpViews() {
        
        view.addSubview(bookImage)
        view.addSubview(bookReview)
        
        bookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        bookImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 200).isActive = true
        bookImage.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 200).isActive = true
        
        bookReview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookReview.centerYAnchor.constraintEqualToSystemSpacingBelow(bookImage.bottomAnchor, multiplier: 30).isActive = true
        bookReview.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bookReview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
    }

    
    
    
    
    
    
    
}
