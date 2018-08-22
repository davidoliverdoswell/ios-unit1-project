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
    var haveRead: Bool
    var bookID: String
}
