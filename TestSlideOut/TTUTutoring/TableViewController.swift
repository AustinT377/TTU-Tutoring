//
//  TableViewController.swift
//  TestSlideOut
//
//  Created by Austin Turner on 9/21/14.
//  Copyright (c) 2014 Turner. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //number of cells to be created
        return 8
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("profileCell") as UITableViewCell!
            
            cell.textLabel!.text = "Profile"
            return cell
        }
        else if indexPath.row == 1 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("homeCell") as UITableViewCell!
            
            cell.textLabel!.text = "Home"
            return cell
        }
        else if indexPath.row == 2 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myPostsCell") as UITableViewCell!
            
            cell.textLabel!.text = "My Post"
            return cell
        }
        else if indexPath.row == 3 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("inboxCell") as UITableViewCell!
            
            cell.textLabel!.text = "Inbox"
            return cell
        }
        else if indexPath.row == 4 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("browseCell") as UITableViewCell!
            
            cell.textLabel!.text = "Browse"
            return cell
        }
        else if indexPath.row == 5 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("favoritesCell") as UITableViewCell!
            
            cell.textLabel!.text = "Favorites"
            return cell
        }
        else if indexPath.row == 6 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("settingsCell") as UITableViewCell!
            
            cell.textLabel!.text = "Settings"
            return cell
        }
        else if indexPath.row == 7 {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("signOutCell") as UITableViewCell!
            
            cell.textLabel!.text = "Sign Out"
            return cell
        }
        else {
            let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
            cell.textLabel!.text = "Default Page"
            return cell
        }
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //sign user out
        if indexPath.row == 7 {
            PFUser.logOut()
            self.performSegueWithIdentifier("logoutSegue", sender: nil)
        }
        
        //turn off click animation
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
    }

}































