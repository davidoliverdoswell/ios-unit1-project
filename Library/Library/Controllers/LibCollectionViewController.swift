//
//  LibCollectionViewController.swift
//  Library
//
//  Created by David Oliver Doswell on 8/21/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

private let reuseIdentifier = "reuseIdentifier"

class LibCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let volumeController = VolumeController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell classes
        
        self.collectionView!.register(LibCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Housework
        
        self.collectionView!.allowsMultipleSelection = true
        self.collectionView!.alwaysBounceVertical = true
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.backgroundColor = .white
        
        // Title
        
        self.title = Strings().navigationTitle
    }


    // MARK: - DataSources
    
    override func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        
        return true
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 16
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LibCollectionViewCell
        
//        let volume = volumeController.volumes[indexPath.row]
//        cell.volume = volume

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // show image
    }
    

    // MARK: - Delegates and Cell Space and Sizes
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: 300, height: 400)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            
            return 30.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: 10, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: 0, height: 30)
    }

}
