//
//  BookRepresentation.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation

struct BookRepresentation: Codable, Equatable {
    
    var bookTitle: String
    var bookAuthor: String
    var bookImage: Data
    var bookReview: String
    var bookID: String
    var haveRead: Bool
    
    init(bookTitle: String, bookAuthor: String, bookImage: Data, bookReview: String, bookID: String, haveRead: Bool = false) {
        
        self.bookTitle = bookTitle
        self.bookImage = bookImage
        self.bookAuthor = bookAuthor
        self.bookReview = bookReview
        self.bookID = bookID
        self.haveRead = haveRead
    }
}
