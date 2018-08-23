//
//  Book+Encodable.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation

extension Book: Encodable {
    
    enum CodingKeys: CodingKey {
        case bookTitle
        case bookImage
        case bookAuthor
        case bookReview
        case bookID
        case haveRead
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(bookTitle, forKey: CodingKeys.bookTitle)
        try container.encode(bookImage, forKey: CodingKeys.bookImage)
        try container.encode(bookAuthor, forKey: CodingKeys.bookAuthor)
        try container.encode(bookReview, forKey: CodingKeys.bookReview)
        try container.encode(bookID, forKey: CodingKeys.bookID)
        try container.encode(haveRead, forKey: CodingKeys.haveRead)
    }
}
