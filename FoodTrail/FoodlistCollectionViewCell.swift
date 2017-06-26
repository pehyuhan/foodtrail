//
//  FoodlistCollectionViewCell.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 26/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class FoodlistCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodlistImageView: UIImageView!
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var foodlistTitleLabel: UILabel!
    
    var foodlist: Foodlist? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI()
    {
        foodlistImageView.image = foodlist?.image
        foodlistTitleLabel.text = foodlist?.title
    }
}
