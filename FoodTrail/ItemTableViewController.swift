//
//  ItemTableViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 12/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    var itemNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
    
    var itemImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var itemLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var itemTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var itemIsVisited = [Bool](repeating: false, count: 21)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.itemNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = itemNames[indexPath.row]
        cell.locationLabel.text = itemLocations[indexPath.row]
        cell.typeLabel.text = itemTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: itemImages[indexPath.row])
        
        cell.favorIconImageView.isHidden = !itemIsVisited[indexPath.row]
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        
//        cell.accessoryType = itemIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        if itemIsVisited[indexPath.row] == false {
        
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            self.itemIsVisited[indexPath.row] = true
            cell.favorIconImageView.isHidden = false
        })
        optionMenu.addAction(isVisitedAction)
        
        } else {
        
        let isVisitedAction = UIAlertAction(title: "I've not been here", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .none
            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
            self.itemIsVisited[indexPath.row] = false
            cell.favorIconImageView.isHidden = true
        })
        optionMenu.addAction(isVisitedAction)
            
        }
        
        let addToListAction = UIAlertAction(title: "Add to Foodlist", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
        })
        optionMenu.addAction(addToListAction)
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert);alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);optionMenu.addAction(cancelAction)
        
        // Display the menu
        self.present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
    
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let shareAction =  UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share")
        { action, index in
            let shareMenu = UIAlertController(title: nil, message: "Share using", preferredStyle: .actionSheet)
            let twitterAction = UIAlertAction(title: "Twitter", style: UIAlertActionStyle.default, handler: nil)
            let facebookAction = UIAlertAction(title: "Facebook", style: UIAlertActionStyle.default, handler: nil)
            let emailAction = UIAlertAction(title: "Email", style: UIAlertActionStyle.default,handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(facebookAction)
            shareMenu.addAction(emailAction)
            shareMenu.addAction(cancelAction)
            
            self.present(shareMenu, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete")
        { action, index in
            // Delete the row from the data source
            self.itemNames.remove(at: indexPath.row)
            self.itemLocations.remove(at: indexPath.row)
            self.itemTypes.remove(at: indexPath.row)
            self.itemIsVisited.remove(at: indexPath.row)
            self.itemImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor(red: 255.0/255.0, green: 166.0/255.0, blue:
            51.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 51.0/255.0, green: 51.0/255.0, blue:
            51.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.itemNames.remove(at: indexPath.row)
            self.itemLocations.remove(at: indexPath.row)
            self.itemTypes.remove(at: indexPath.row)
            self.itemIsVisited.remove(at: indexPath.row)
            self.itemImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//        let backItem = UIBarButtonItem()
//        backItem.title = "Back"
//        navigationItem.backBarButtonItem = backItem
    
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "showItemDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let destinationController = segue.destination as!
//                DetailViewController
//                destinationController.itemImage = self.itemImages[indexPath.row]
//            } }
//    }

}
