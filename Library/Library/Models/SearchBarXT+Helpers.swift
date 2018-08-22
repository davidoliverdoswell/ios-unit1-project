//
//  SearchBarXT+Helpers.swift
//  Library
//
//  Created by David Oliver Doswell on 8/22/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

extension LibCollectionViewController: UISearchBarDelegate {
        
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        // Display possible list of google books
        
        userIsSearching = true
        
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        // Dismiss keyboard
        
        userIsSearching = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        // Find book and display book in index cell
        
        userIsSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        // Call dismiss keyboard
        
        userIsSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
    }
    
}
