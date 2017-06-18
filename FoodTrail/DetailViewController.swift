//
//  DetailViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 14/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var itemImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    
    var item:Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.itemImageView.image = UIImage(named: item.image)
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        title = self.item.name
        
        self.tableView.backgroundColor = UIColor(red: 255.0/255.0, green: 243.0/255.0, blue: 243.0/255.0, alpha: 0.2)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.8)
        
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.hidesBarsOnSwipe = false
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! DetailTableViewCell
            
            cell.backgroundColor = UIColor.clear
            
            // Configure the cell...
            cell.mapButton.isHidden = true
            
            switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = item.name
            case 1:
                cell.fieldLabel.text = "Type"
                cell.valueLabel.text = item.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = item.location
                cell.mapButton.isHidden = false
            case 3:
                cell.fieldLabel.text = "Been here"
                cell.valueLabel.text = (item.isVisited) ? "Yes, I’ve been here before" : "No"
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
            }
            return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.item = item
        }
    }

}
