//
//  Foodlist.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 26/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit
class Foodlist {
    var title: String
    var location: String
    var image: UIImage
    var section: String
    var isFollowing: Bool
    
    init(title: String, location: String, image: UIImage, section: String, isFollowing: Bool) {
        self.title = title
        self.location = location
        self.image = image
        self.section = section
        self.isFollowing = isFollowing
    }
    
    convenience init(copies foodlist:Foodlist) {
        self.init(title: foodlist.title, location: foodlist.title, image: foodlist.image, section: foodlist.section, isFollowing: foodlist.isFollowing)
    }
}
