//
//  DetailViewController.swift
//  FoodTrail
//
//  Created by Peh Yuhan on 14/6/17.
//  Copyright © 2017 Peh Yuhan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var itemImageView:UIImageView!
    var itemImage:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.itemImageView.image = UIImage(named: itemImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
