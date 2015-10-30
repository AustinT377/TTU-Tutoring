//
//  HomeViewController.swift
//  TestSlideOut
//
//  Created by Austin Turner on 10/7/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    let cellTableIdentifier = "CellTableIdentifier"
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    // Temporary info.
    let titles = ["Help plzzz", "I can tutor in Bio.", "Need iOS programming help!"]
    let subjects = ["POLISCI", " BIOLOGY ", " COMPSCI "]
    let names = ["Barack Obama", "Pope Francis", "Vladimir Putin"]
    let dates = ["Jan 20, 2008", "September 30, 2015", "September 29, 2015"]
    
    func loadData(notification: NSNotification) {
        //load data here
        print("LOAD DATA")
        //self.tableView.reloadData()
        self.homeTableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData:",name:"loadPostItems", object: nil)

        super.viewDidLoad()
        postMgr.getPost()
    
        // Do any additional setup after loading the view, typically from a nib.
        homeTableView.registerNib(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellTableIdentifier)
    
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(postMgr.posts)
        return postMgr.posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellTableIdentifier, forIndexPath: indexPath) as! HomePageTableCell
    
        cell.postTitle.text = postMgr.posts[indexPath.row].title
        cell.subject.text = postMgr.posts[indexPath.row].department
        cell.name.text = postMgr.posts[indexPath.row].posterName
        //cell.date.text = postMgr.posts[indexPath.row].title
            
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toPostPage1", sender: nil)
        homeTableView.deselectRowAtIndexPath(indexPath, animated: true)

    }
}


















