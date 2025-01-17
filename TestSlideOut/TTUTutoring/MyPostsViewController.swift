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
    
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var myPostTableView: UITableView!
    
    var viewPostPage: ViewPostPageViewController?
    
    func loadData(notification: NSNotification) {
        //load data here
        print("LOAD DATA FOR MYPOST PAGE")
        //self.tableView.reloadData()
        self.myPostTableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData:",name:"loadPostItems", object: nil)
        
        super.viewDidLoad()
        postMgr.getPost()
        
        // Do any additional setup after loading the view, typically from a nib.
        myPostTableView.registerNib(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: cellTableIdentifier)
        
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
        viewPostPage = self.storyboard?.instantiateViewControllerWithIdentifier("ViewPostPageViewController") as? ViewPostPageViewController
        viewPostPage?.passIndexPath(indexPath.row)
        //performSegueWithIdentifier("toPostPage1", sender: nil)
        myPostTableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.navigationController?.pushViewController(viewPostPage!, animated: true)
    }
}


protocol myPostsDelegate {
    func passIndexPath(theIndexPath: Int)
}










