//
//  BookController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation
import CoreData

class BookController {

    // MARK: - URL for API
    
    let baseURL = URL(string: "https://library-214016.firebaseio.com/")!

    // MARK: - Singleton
    
    let moc = CoreDataStack.shared.mainContext
    
    // MARK: - Error Handler and Background Initializer
    
    typealias CompletionHandler = (Error?) -> Void
    
    init() {
        let backgroundContext = CoreDataStack.shared.container.newBackgroundContext()
        searchBookshelves(context: backgroundContext)
    }
    
    
    // MARK: - SERVER CRUD
    
    
    func searchBookshelves(completion: @escaping CompletionHandler = {_ in}, context: NSManagedObjectContext) {
        
        let searchURL = URL(string: "https://www.googleapis.com/books/v1/mylibrary/bookshelves")!
        
        let requestURL = searchURL.appendingPathExtension("json")
        
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
            }
            
            guard let data = data else {
                NSLog("No data")
                completion(NSError())
                return
            }
            
            do {
                let bookRepresentations = try JSONDecoder().decode(BookRepresentation.self, from: data)
                
                let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
                
                // Save the context only after the update/creation process is complete
                
                try self.updateBooks(with: [bookRepresentations], context: backgroundMoc)
                
                // Remember that save() itself must be called on the context's private queue using perform() or performAndWait()
                
                try CoreDataStack.shared.save()
                completion(nil)
                
            } catch {
                NSLog("Error fetching books: \(error)")
                completion(error)
                return
            }
        }.resume()
    }
    
    func updateBooks(with representations: [BookRepresentation], context: NSManagedObjectContext) throws {
        
        var error : Error?
        
        context.performAndWait {
            
            for bookRep in representations {
                guard let uuid = UUID(uuidString: bookRep.bookID) else { continue }
                
                let book = self.readBook(with: uuid, context: context)
                
                if let book = book {
                    self.update(book: book, with: bookRep)
                } else {
                    let _ = Book(bookRepresentation: bookRep, context: context)
                }
            }
            
            do {
                try context.save()
            } catch let saveError {
                error = saveError
            }
        }
        if let error = error { throw error }
    }
    
    func put(book: Book, completion: @escaping CompletionHandler = {_ in}) {
        
        let uuid = book.bookID ?? ""
        let requestURL = baseURL.appendingPathComponent(uuid).appendingPathExtension("json")
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = "PUT"
        
        do {
            guard var representation = book.bookRepresentation else {
                completion(NSError())
                return
            }
            representation.bookID = uuid
            book.bookID = uuid
            try CoreDataStack.shared.save()
            request.httpBody = try JSONEncoder().encode(representation)
        } catch {
            NSLog("Error: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    func deleteBookFromBookshelf(book: Book, completion: @escaping CompletionHandler = {_ in}) {
        
        guard let id = book.bookID else { return }
        
        let url = baseURL.appendingPathComponent(id)
            .appendingPathExtension("json")
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                NSLog("Error: \(error)")
                completion(error)
                return
            }
            completion(nil)
        }.resume()
    }
    
    
    // MARK: - LOCAL CRUD
    
    
    private func readBook(with uuid: UUID, context: NSManagedObjectContext) -> Book? {
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "bookID == %@", uuid as NSUUID)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            NSLog("Error: \(error)")
            return nil
        }
    }
    
    func update(book: Book, with representation: BookRepresentation) {
        book.bookTitle = representation.bookTitle
        
        put(book: book)
    }
    
    func delete(book: Book) {
        moc.delete(book)
        deleteBookFromBookshelf(book: book)
    }
    
    
}
