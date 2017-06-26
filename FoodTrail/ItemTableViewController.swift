//
//  ItemTableViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 12/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class ItemTableViewController: UITableViewController {
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {
    }
    
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var authorLabel: UILabel!
    
    var foodListTitle = "Sembawang Spring Estate"
    
    var items:[Item] = [
        Item(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", image: "cafedeadend.jpg", isVisited: false),
        Item(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image: "homei.jpg", isVisited: false),
        Item(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "teakha.jpg", isVisited: false),
        Item(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image: "cafeloisl.jpg", isVisited: false),
        Item(name: "Petite Oyster", type: "French", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", image: "petiteoyster.jpg", isVisited: false),
        Item(name: "For Kee Item", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
        Item(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
        Item(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image: "bourkestreetbakery.jpg", isVisited: false),
        Item(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image: "haighschocolate.jpg", isVisited: false),
        Item(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", image: "palominoespresso.jpg", isVisited: false),
        Item(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", isVisited: false),
        Item(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", isVisited: false),
        Item(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", image: "grahamavenuemeats.jpg", isVisited: false),
        Item(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg", isVisited: false),
        Item(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg", isVisited: false),
        Item(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image: "cafelore.jpg", isVisited: false),
        Item(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", image: "confessional.jpg", isVisited: false),
        Item(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg", isVisited: false),
        Item(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", image: "donostia.jpg", isVisited: false),
        Item(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg", isVisited: false),
        Item(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image: "thaicafe.jpg", isVisited: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        headerImage.image = UIImage(named: "cafedeadend.jpg")
        headerImage.layer.cornerRadius = headerImage.frame.size.width / 2
        headerImage.clipsToBounds = true
        
        titleLabel.text = foodListTitle
        
        self.automaticallyAdjustsScrollViewInsets = true
        self.extendedLayoutIncludesOpaqueBars = true
        self.tabBarController?.tabBar.isHidden = true
        
        tableView.estimatedSectionHeaderHeight = 44.0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .white
        let randomPickButton = UIButton(frame: CGRect(x: 0, y: 0, width: 375, height: 44))
        randomPickButton.backgroundColor = UIColor(red: 210.0/255.0, green: 87.0/255.0, blue: 87.0/255.0, alpha: 1.0)
        randomPickButton.setTitle("RANDOM PICK", for: .normal)
        randomPickButton.setTitleColor(.white, for: .normal)
        randomPickButton.addTarget(self, action: #selector(randomPickButtonTapped), for: .touchUpInside)
        
        randomPickButton.contentHorizontalAlignment = .center
        
        v.addSubview(randomPickButton)
        return v
    }
    
    func randomPickButtonTapped() {
        print("Button pressed")
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
        
        // Configure the cell...
        let item = items[indexPath.row]
        cell.nameLabel.text = item.name
        cell.locationLabel.text = item.location
        cell.typeLabel.text = item.type
        cell.thumbnailImageView.image = UIImage(named: item.image)
        
        cell.favorIconImageView.isHidden = !item.isVisited
        
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width / 2
        cell.thumbnailImageView.clipsToBounds = true
        
        
//        cell.accessoryType = itemIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        
//        if itemIsVisited[indexPath.row] == false {
//        
//        let isVisitedAction = UIAlertAction(title: "I've been here", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
////            let cell = tableView.cellForRow(at: indexPath)
////            cell?.accessoryType = .checkmark
//            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
//            self.itemIsVisited[indexPath.row] = true
//            cell.favorIconImageView.isHidden = false
//        })
//        optionMenu.addAction(isVisitedAction)
//        
//        } else {
//        
//        let isVisitedAction = UIAlertAction(title: "I've not been here", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
////            let cell = tableView.cellForRow(at: indexPath)
////            cell?.accessoryType = .none
//            let cell = tableView.cellForRow(at: indexPath) as! CustomTableViewCell
//            self.itemIsVisited[indexPath.row] = false
//            cell.favorIconImageView.isHidden = true
//        })
//        optionMenu.addAction(isVisitedAction)
//            
//        }
//        
//        let addToListAction = UIAlertAction(title: "Add to Foodlist", style: .default, handler: {
//            (action:UIAlertAction!) -> Void in
////            let cell = tableView.cellForRow(at: indexPath)
////            cell?.accessoryType = .checkmark
//        })
//        optionMenu.addAction(addToListAction)
//        
//        let callActionHandler = { (action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert);alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                self.present(alertMessage, animated: true, completion: nil)
//        }
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertActionStyle.default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);optionMenu.addAction(cancelAction)
//        
//        // Display the menu
//        self.present(optionMenu, animated: true, completion: nil)
//        
//        tableView.deselectRow(at: indexPath, animated: false)
//    
//    }

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
            self.items.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        shareAction.backgroundColor = UIColor(red: 138.0/255.0, green: 199.0/255.0, blue:
            91.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 193.0/225.0, green: 21.0/255.0, blue:
            21.0/255.0, alpha: 1.0)
        
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        let backItem = UIBarButtonItem()
        backItem.title = " "
        navigationItem.backBarButtonItem = backItem
    
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showItemDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.item = items[indexPath.row]
            } }
    }

}
