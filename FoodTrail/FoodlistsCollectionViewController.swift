//
//  FoodlistsCollectionViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 26/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class FoodlistsCollectionViewController: UICollectionViewController {
    
    //datasource
    let foodlists = Foodlists()
    
    private let leftAndRightPaddings: CGFloat = 32.0
    private let numberOfItemsPerRow: CGFloat = 3.0
    private let heightAdjustment: CGFloat = 30.0
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = ((collectionView!.frame.size.width) - leftAndRightPaddings) / numberOfItemsPerRow
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width + heightAdjustment)

    }
    
    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return foodlists.numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodlists.numberOfFoodlistsInSection(index: section)
    }
    
    private struct Storyboard {
        static let CellIdentifier = "FoodlistCell"
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.CellIdentifier, for: indexPath) as! FoodlistCollectionViewCell
        
        cell.foodlist = foodlists.foodlistForItemAtIndexPath(indexPath: indexPath as NSIndexPath)
        
        cell.layer.cornerRadius = 3.0

        return cell
    }
    
    // Section Header View
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeaderView", for: indexPath) as! SectionHeaderView
        
        if let foodlist = foodlists.foodlistForItemAtIndexPath(indexPath: indexPath as NSIndexPath) {
            sectionHeaderView.foodlist = foodlist
        }
        
        return sectionHeaderView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
