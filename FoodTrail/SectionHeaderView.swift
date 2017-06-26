//
//  SectionHeaderView.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 27/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class SectionHeaderView : UICollectionReusableView {
    @IBOutlet weak var sectionLabel: UILabel!
    
    var foodlist: Foodlist? {
        didSet {
            sectionLabel.text = foodlist?.section.uppercased()
        }
    }

}
