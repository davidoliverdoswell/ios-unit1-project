//
//  LibCollectionViewCell.swift
//  Library
//
//  Created by David Oliver Doswell on 8/21/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class LibCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    let bookTitle: UILabel = {
        let title = UILabel()
        title.text = "Title Label" // TODO
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let authorName: UILabel = {
        let name = UILabel()
        name.text = "Author name" // TODO
        name.textAlignment = .left
        name.font = UIFont.systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let reviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Strings().reviewButtonTitle, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Subview Constraints
    
    func setUpViews() {
        addSubview(bookTitle)
        addSubview(authorName)
        addSubview(reviewButton)
        
        bookTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        bookTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bookTitle.widthAnchor.constraint(equalToConstant: 200).isActive = true
        bookTitle.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        authorName.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 10).isActive = true
        authorName.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        authorName.widthAnchor.constraint(equalToConstant: 200).isActive = true
        authorName.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        reviewButton.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        reviewButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 8).isActive = true
        reviewButton.widthAnchor.constraint(equalToConstant: 75).isActive = true
        reviewButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
}
