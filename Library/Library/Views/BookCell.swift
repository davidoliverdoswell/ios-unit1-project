//
//  BookCell.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class BookCell: UICollectionViewCell {
    
    var book: Book? {
        didSet {
            setUpViews()
        }
    }
    
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
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 17)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let bookAuthor: UILabel = {
        let name = UILabel()
        name.textAlignment = .left
        name.lineBreakMode = .byWordWrapping
        name.numberOfLines = 0
        name.font = UIFont.systemFont(ofSize: 15)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let bookReview: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Subview Constraints
    
    func setUpViews() {
        
        addSubview(bookTitle)
        addSubview(bookAuthor)
        addSubview(bookReview)
        
        // Cell
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 20
        self.isUserInteractionEnabled = true
        
        
        // iOS 9 (and above) Constraints
        
        bookTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        bookTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bookTitle.widthAnchor.constraint(equalToConstant: 144).isActive = true
        bookTitle.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        bookAuthor.topAnchor.constraint(equalTo: bookTitle.bottomAnchor, constant: 10).isActive = true
        bookAuthor.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        bookAuthor.widthAnchor.constraint(equalToConstant: 145).isActive = true
        bookAuthor.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        bookReview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        bookReview.rightAnchor.constraint(equalTo: rightAnchor, constant: 2).isActive = true
        bookReview.widthAnchor.constraint(equalToConstant: 75).isActive = true
        bookReview.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
}
