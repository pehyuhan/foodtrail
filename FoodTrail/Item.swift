//
//  Item.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 14/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import Foundation

class Item {
    var name:String = ""
    var type:String = ""
    var location:String = ""
    var image:String = ""
    var isVisited:Bool = false
    init(name:String, type:String, location:String, image:String, isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}

