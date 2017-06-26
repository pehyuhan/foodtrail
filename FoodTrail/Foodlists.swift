//
//  Foodlists.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 26/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class Foodlists
{
    private var foodlists = [Foodlist]()
    private var immutableFoodlists = [Foodlist]()
    private var sections = [String]()
    
    // MARK: - Public
    
    var numberOfFoodlists: Int {
        return foodlists.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init()
    {
        foodlists = createFoodlists()
        immutableFoodlists = foodlists
        sections = ["My Favorites", "Politics", "Travel", "Technology"]
    }
    
    func deleteItemsAtIndexPaths(indexPaths: [NSIndexPath])
    {
        var indexes = [Int]()
        for indexPath in indexPaths {
            indexes.append(absoluteIndexForIndexPath(indexPath: indexPath))
        }
        var newFoodlists = [Foodlist]()
        for (index, foodlist) in foodlists.enumerated() {
            if !indexes.contains(index) {
                newFoodlists.append(foodlist)
            }
        }
        foodlists = newFoodlists
    }
    
    func moveFoodlistFromIndexPath(indexPath: NSIndexPath, toIndexPath newIndexPath: NSIndexPath) {
        if indexPath != newIndexPath {
            let index = absoluteIndexForIndexPath(indexPath: indexPath)
            let foodlist = foodlists[index]
            foodlist.section = sections[newIndexPath.section]
            let newIndex = absoluteIndexForIndexPath(indexPath: newIndexPath)
            foodlists.remove(at: index)
            foodlists.insert(foodlist, at: newIndex)
        }
    }
    
    func indexPathForNewRandomFoodlist() -> NSIndexPath
    {
        let index = Int(arc4random_uniform(UInt32(immutableFoodlists.count)))
        let foodlistToCopy = immutableFoodlists[index]
        let newFoodlist = Foodlist(copies: foodlistToCopy)
        foodlists.append(newFoodlist)
        foodlists.sort { $0.section < $1.section }
        return indexPathForFoodlist(foodlist: newFoodlist)
    }
    
    func indexPathForFoodlist(foodlist: Foodlist) -> NSIndexPath
    {
        let section = sections.index(of: foodlist.section)
        var item = 0
        for (index, currentFoodlist) in foodlistsForSection(index: section!).enumerated() {
            if currentFoodlist === foodlist {
                item = index
                break
            }
        }
        return NSIndexPath(item: item, section: section!)
    }
    
    func numberOfFoodlistsInSection(index: Int) -> Int {
        let foodlists = foodlistsForSection(index: index)
        return foodlists.count
    }
    
    func foodlistForItemAtIndexPath(indexPath: NSIndexPath) -> Foodlist? {
        if indexPath.section > 0 {
            let foodlists = foodlistsForSection(index: indexPath.section)
            return foodlists[indexPath.item]
        } else {
            return foodlists[indexPath.item]
        }
    }
    
    func titleForSectionAtIndexPath(indexPath: NSIndexPath) -> String?
    {
        if indexPath.section < sections.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    // MARK: - Private
    
    private func createFoodlists() -> [Foodlist]
    {
        var newFoodlists = [Foodlist]()
        newFoodlists += MyFavorites.foodlists()
        newFoodlists += Politics.foodlists()
        newFoodlists += Travel.foodlists()
        newFoodlists += Technology.foodlists()
        return newFoodlists
    }
    
    private func absoluteIndexForIndexPath(indexPath: NSIndexPath) -> Int
    {
        var index = 0
        for i in 0..<indexPath.section {
            index += numberOfFoodlistsInSection(index: i)
        }
        index += indexPath.item
        return index
    }
    
    private func foodlistsForSection(index: Int) -> [Foodlist] {
        let section = sections[index]
        let foodlistsInSection = foodlists.filter {
            (foodlist: Foodlist) -> Bool in return foodlist.section == section
        }
        return foodlistsInSection
    }
}

class MyFavorites
{
    class func foodlists() -> [Foodlist]
    {
        var foodlists = [Foodlist]()
        foodlists.append(Foodlist(title: "TIME", location: "Hong Kong, Hong Kong Island", image: UIImage(named: "TIME")!, section: "My Favorites", isFollowing: false))
        foodlists.append(Foodlist(title: "The New York Times", location: "Singapore, Sembawang", image: UIImage(named: "The New York Times")!, section: "My Favorites", isFollowing: false))
        foodlists.append(Foodlist(title: "TED", location: "Malaysia, Johor Bahru", image: UIImage(named: "TED")!, section: "My Favorites", isFollowing: false))
        foodlists.append(Foodlist(title: "Re/code", location: "Thailand, Bangkok", image: UIImage(named: "Recode")!, section: "My Favorites", isFollowing: false))
        foodlists.append(Foodlist(title: "WIRED", location: "Vietnam, Hanoi", image: UIImage(named: "WIRED")!, section: "My Favorites", isFollowing: false))
        return foodlists
    }
}

class Politics
{
    class func foodlists() -> [Foodlist]
    {
        var foodlists = [Foodlist]()
        foodlists.append(Foodlist(title: "The Atlantic", location: "Philippines, Barocay", image: UIImage(named: "The Atlantic")!, section: "Politics", isFollowing: false))
        foodlists.append(Foodlist(title: "The Hill", location: "Malaysia, KL", image: UIImage(named: "The Hill")!, section: "Politics", isFollowing: false))
        foodlists.append(Foodlist(title: "Daily Intelligencer", location: "Taiwan, Taipei", image: UIImage(named: "Daily Intelligencer")!, section: "Politics", isFollowing: false))
        foodlists.append(Foodlist(title: "Vanity Fair", location: "Korea, Seoul", image: UIImage(named: "Vanity Fair")!, section: "Politics", isFollowing: false))
        foodlists.append(Foodlist(title: "TIME", location: "Japan, Tokyo", image: UIImage(named: "TIME")!, section: "Politics", isFollowing: false))
        foodlists.append(Foodlist(title: "The Huffington Post", location: "Indonesia, Jakarta", image: UIImage(named: "The Huffington Post")!, section: "Politics", isFollowing: false))
        return foodlists
    }
}

class Travel
{
    class func foodlists() -> [Foodlist]
    {
        var foodlists = [Foodlist]()
        foodlists.append(Foodlist(title: "AFAR", location: "Russia, Moscow", image: UIImage(named: "AFAR")!, section: "Travel", isFollowing: false))
        foodlists.append(Foodlist(title: "The New York Times", location: "USA, Washington", image: UIImage(named: "The New York Times")!, section: "Travel", isFollowing: false))
        foodlists.append(Foodlist(title: "Men’s Journal", location: "China,  Shanghai", image: UIImage(named: "Men’s Journal")!, section: "Travel", isFollowing: false))
        foodlists.append(Foodlist(title: "Smithsonian", location: "Great Britian, London", image: UIImage(named: "Men’s Journal")!, section: "Travel", isFollowing: false))
        foodlists.append(Foodlist(title: "Wallpaper", location: "Italy, Rome", image: UIImage(named: "Smithsonian")!, section: "Travel", isFollowing: false))
        foodlists.append(Foodlist(title: "Sunset", location: "Africa, Kenya", image: UIImage(named: "Wallpaper")!, section: "Travel", isFollowing: false))
        return foodlists
    }
}

class Technology
{
    class func foodlists() -> [Foodlist]
    {
        var foodlists = [Foodlist]()
        foodlists.append(Foodlist(title: "WIRED", location: "Germany, Munich", image: UIImage(named: "WIRED")!, section: "Technology", isFollowing: false))
        foodlists.append(Foodlist(title: "Re/code", location: "Australia, Canberra", image: UIImage(named: "Recode")!, section: "Technology", isFollowing: false))
        foodlists.append(Foodlist(title: "Quartz", location: "Canada, Vancouver", image: UIImage(named: "Quartz")!, section: "Technology", isFollowing: false))
        foodlists.append(Foodlist(title: "Daring Fireball", location: "South Africa, Cape Town", image: UIImage(named: "Daring Fireball")!, section: "Technology", isFollowing: false))
        foodlists.append(Foodlist(title: "MIT Technology Review", location: "Philippines, Manila", image: UIImage(named: "MIT Technology Review")!, section: "Technology", isFollowing: false))
        return foodlists
    }
}

