//
//  ProfileViewController.swift
//  TestSlideOut
//
//  Created by Austin Turner on 10/7/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    //these are the name and rating strings
    //let firstName = "Kevin"
    //let lastName = "Taing"
    //let rating = "A+"
    
    //these are my arrays to store values for the profile
    let infoArray = ["Email: Kevin.taing@ttu.edu", "Phone: 432-349-8373", "Major: Computer Science", "Classification: Sophemore"]
    let postArray = ["Helping in Calculus I", "At the library for tutoring in math", "Tutoring physics today", "Need help in programming class", "Starting a group study"]
    let subjectArray = ["Computer Science", "Python Programming", "C++ Programming", "Calculus"]
    var myTableData = [String]()
    
    //labels
    
    
    //this is the image obj
    ////////@IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var statusImage: UILabel!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    //this is the table view obj
    @IBOutlet weak var myTableView: UITableView!
    
    //segmented control obj
    @IBOutlet weak var Controller: UISegmentedControl!
    
    //this will change status
    @IBAction func switchFunc(sender: AnyObject) {
        if statusSwitch.on {
            statusImage.backgroundColor = UIColor.greenColor()
        }
            
        else{
            statusImage.backgroundColor = UIColor.redColor()
            
        }
    }
    
    
    //function that makes button do stuff
    @IBAction func ProfileButtons(sender: UISegmentedControl) {
        
        if Controller.selectedSegmentIndex == 0{
            myTableData = infoArray
            myTableView.separatorStyle = UITableViewCellSeparatorStyle.None
            myTableView.reloadData()
        }
        
        if Controller.selectedSegmentIndex == 1{
            myTableData = postArray
            myTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            myTableView.reloadData()
            
            
        }
        
        if Controller.selectedSegmentIndex == 2{
            myTableData = subjectArray
            myTableView.separatorStyle = UITableViewCellSeparatorStyle.None
            myTableView.reloadData()
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableData = infoArray
        myTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        profileImage.layer.cornerRadius = profileImage.frame.size.width/5
        profileImage.clipsToBounds = true
        statusImage.layer.cornerRadius = profileImage.frame.size.width/5
        statusImage.clipsToBounds = true
        statusImage.backgroundColor = UIColor.redColor()
        
        
        
        if self.revealViewController() != nil {
            barButton.target = self.revealViewController()
            barButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            // Uncomment to change the width of menu
            //self.revealViewController().rearViewRevealWidth = 62
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    //UITableView functions
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel?.text = myTableData[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTableData.count
    }

}
