//
//  MyPostsViewController.swift
//  TTUTutoring
//
//  Created by Adam Nettel on 11/4/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit

class MyPostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    @IBOutlet weak var myPostsTableView: UITableView!
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    
    func loadData(notification: NSNotification) {
        //load data here
        print("LOAD DATA")
        //self.tableView.reloadData()
        self.myPostsTableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData:",name:"loadPostItems", object: nil)
        
        super.viewDidLoad()
        postMgr.getPost()
        
        // Do any additional setup after loading the view, typically from a nib.
        myPostsTableView.registerNib(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellTableIdentifier)
        
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
        myPostsTableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}
