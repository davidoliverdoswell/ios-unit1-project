//
//  Book+Convenience.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation
import CoreData

extension Book {
    
    // MARK: - Initialize Data Model Values
    
    convenience init(bookTitle: String, bookImage: Data, bookAuthor: String, bookReview: String, bookID: String, haveRead: Bool = false, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.bookTitle = bookTitle
        self.bookImage = bookImage
        self.bookAuthor = bookAuthor
        self.bookReview = bookReview
        self.bookID = bookID
        self.haveRead = haveRead
    }
    
    // MARK: - Create Data Model Representation
    
    convenience init?(bookRepresentation: BookRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(bookRepresentation: bookRepresentation)
        self.bookTitle = bookRepresentation.bookTitle
        self.bookImage = bookRepresentation.bookImage
        self.bookAuthor = bookRepresentation.bookAuthor
        self.bookReview = bookRepresentation.bookReview
        self.bookID = bookRepresentation.bookID
        self.haveRead = bookRepresentation.haveRead
    }
    
    var bookRepresentation: BookRepresentation? {
        guard let title = bookTitle,
            let image = bookImage,
            let author = bookAuthor,
            let review = bookReview,
            let id = bookID else { return nil }
        
        return BookRepresentation(bookTitle: title, bookAuthor: author, bookImage: image, bookReview: review, bookID: id)
        
    }
    
    
    
    
    
    
}
