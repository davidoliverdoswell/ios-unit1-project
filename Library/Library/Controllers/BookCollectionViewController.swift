//
//  BookCollectionViewController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "reuseIdentifier"

class BookCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    
    let bookController = BookController()
    
    var userIsSearching = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        
        self.collectionView!.register(BookCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Housework
        
        self.collectionView!.allowsMultipleSelection = true
        self.collectionView!.alwaysBounceHorizontal = true
        self.collectionView!.showsHorizontalScrollIndicator = false
        self.collectionView!.backgroundColor = .white
        
        // Title
        
        self.title = Strings().navigationTitle
        
        // Search Bar
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 64, width: Int(UIScreen.main.bounds.width), height: 50))
        searchBar.tintColor = .black
        searchBar.placeholder = Strings().searchBarPlaceholder
        searchBar.autocorrectionType = .default
        view.addSubview(searchBar)
        
        // Call Dismiss Keyboard
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Dismiss Keyboard
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Fetch Results Controller
    
    lazy var fetchedResultsController: NSFetchedResultsController<Book> = {
        
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        fetchRequest.sortDescriptors =
            [NSSortDescriptor(key: "bookTitle", ascending: false),
             NSSortDescriptor(key: "bookAuthor", ascending: false)]
        
        let moc = CoreDataStack.shared.mainContext
        
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: "bookTitle", cacheName: nil)
        
        frc.delegate = self
        try! frc.performFetch()
        return frc
    }()
    
    // MARK: - Fetch Controller Insertion and Deletion
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        switch type {
        case .insert:
            collectionView?.insertSections(IndexSet(integer: sectionIndex))
        case .delete:
            collectionView?.deleteSections(IndexSet(integer: sectionIndex))
        default:
            break
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            collectionView?.insertItems(at: [newIndexPath])
        case .delete:
            guard let indexPath = indexPath else { return }
            collectionView?.deleteItems(at: [indexPath])
        case .update:
            guard let indexPath = indexPath else { return }
            collectionView?.reloadItems(at: [indexPath])
        case .move:
            guard let oldIndexPath = indexPath,
                let newIndexPath = newIndexPath else { return }
            
            collectionView?.deleteItems(at: [oldIndexPath])
            collectionView?.insertItems(at: [newIndexPath])
        }
    }
    
    // MARK: - DataSources
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 7
        
        //        return fetchedResultsController.fetchedObjects?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BookCell
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        // Get selected item at index path
        let bookDetailVC = BookDetailViewController()
        
        self.navigationController?.pushViewController(bookDetailVC, animated: true)
    }
    
    
    // MARK: - Collection View Delegates, Cell Space and Sizes
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 30.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 20, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: 0, height: 50)
    }
}
