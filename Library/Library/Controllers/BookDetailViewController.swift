//
//  BookDetailViewController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit
import SafariServices

private let shareString = "https://www.google.com/search?tbm=bks&q=well+designed+Jon+kolko&spell=1&sa=X&ved=0ahUKEwij-53LgITdAhVDM30KHb5MA0EQBQglKAA&biw=1440&bih=766&dpr=1"
private let exploreString = "https://books.google.com/books?id=F71-BAAAQBAJ&printsec=frontcover&dq=well+designed+Jon+kolko&hl=en&sa=X&ved=0ahUKEwjy4s7MgITdAhUiHzQIHZJBCdwQ6AEIJzAA#v=onepage&q=well%20designed%20Jon%20kolko&f=false"

class BookDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    let bookImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "welldesigned")
        image.layer.borderWidth = 0.5
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let bookReview: UITextView = {
        let textView = UITextView()
        textView.text = Strings().bookReviewText
        textView.textColor = .white
        textView.backgroundColor = appColor
        textView.textAlignment = .center
        textView.font = UIFont.italicSystemFont(ofSize: 16)
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let exploreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings().exploreButtonTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(exploreTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareBookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings().shareButtonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(shareBookButtonTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func exploreTapped(sender: UIButton) {
        if let url = URL(string: exploreString) {
            let configuration = SFSafariViewController.Configuration()
            configuration.barCollapsingEnabled = false
            
            let safariViewController = SFSafariViewController(url: url, configuration: configuration)
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = appColor
            present(safariViewController, animated: true)
        }
    }
    
    // MARK: - Share Book on Social Media or iMessage
    
    @objc func shareBookButtonTapped(sender: UIButton) {
        let vc = UIActivityViewController(activityItems: [bookImage.image!, shareString], applicationActivities: [])
        present(vc, animated: true)
    }
    
    
    // MARK: - Dismiss safari view
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        setUpViews()
    }
    
    // MARK: - Constraints
    
    func setUpViews() {
        
        view.backgroundColor = appColor
        
        view.addSubview(bookImage)
        view.addSubview(bookReview)
        view.addSubview(exploreButton)
        view.addSubview(shareBookButton)
        
        // image
        
        bookImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        bookImage.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bookImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        // review
        
        bookReview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookReview.topAnchor.constraint(equalTo: bookImage.bottomAnchor, constant: 30).isActive = true
        bookReview.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bookReview.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // explore
        
        exploreButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        exploreButton.topAnchor.constraint(equalTo: bookReview.bottomAnchor, constant: 50).isActive = true
        exploreButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        exploreButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // share
        
        shareBookButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 220).isActive = true
        shareBookButton.topAnchor.constraint(equalTo: bookReview.bottomAnchor, constant: 50).isActive = true
        shareBookButton.widthAnchor.constraint(equalToConstant: 125).isActive = true
        shareBookButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
