//
//  PostModel.swift
//  TestSlideOut
//
//  Created by Kevin Taing on 10/14/15.
//  Copyright © 2015 Turner. All rights reserved.
//

var postMgr = PostModel()


import UIKit


class PostModel: NSObject {
    
    var posts: [Post] = []
    
    struct Post{
        var title: String
        var department: String
        var payRate: Double
        var description: String
        var isTutor: Bool
        var posterName: String
        var user: PFUser
        
    }
    
    
    func addPost(title: String, department: String, payRate: Double, description: String, isTutor: Bool, posterName: String, user: PFUser) {
        
        print("ADD POST")
        
        // Ensures that the new post is not a duplicate.
        let newPost = Post(title: title, department: department, payRate: payRate, description: description, isTutor: isTutor, posterName: posterName, user: user)
        for post in posts {
            
            if newPost.title == post.title
                && newPost.department == post.department
                && newPost.payRate == post.payRate
                && newPost.description == post.description
                && newPost.isTutor == post.isTutor
                && newPost.posterName == post.posterName
                && newPost.user == post.user {
                
                return
                
            }
            
        }
            
        self.posts.append(newPost)
        
    }
    
    
    
    func addPostToServer(title: String, department: String, payRate: Double, description: String, isTutor: Bool, posterName: String, user: PFUser) {
        
        addPost(title, department: department, payRate: payRate, description: description, isTutor: isTutor, posterName: posterName, user: user)
        
        var post = PFObject(className:"Post")
        post["title"] = title
        post["department"] = department
        post["payRate"] = payRate
        post["description"] = description
        post["isTutor"] = isTutor
        post["postName"] = posterName
        post["user"] = user
        post.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
            if (success) {
                print("post saved to parse.")
            } else {
                // There was a problem, check error.description
                print("error posting to parse.")
            }
        }
    }
    
    func getPost() {
        let postQuery = PFQuery(className:"Post")
        //postQuery.whereKey("isTutor", equalTo: true)
        
        postQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
    
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) posts.")
                // Do something with the found objects
                if let objects = objects as [PFObject]? {
                    for object in objects {

                        self.addPost(object.objectForKey("title") as! String, department: object.objectForKey("department") as! String, payRate: object.objectForKey("payRate") as! Double, description: object.objectForKey("description") as! String, isTutor: object.objectForKey("isTutor") as! Bool, posterName: object.objectForKey("posterName") as! String, user: object.objectForKey("user") as! PFUser)
                    

                        print("Update table")
                        NSNotificationCenter.defaultCenter().postNotificationName("loadPostItems", object: nil)

                    
                    }
                    //calls loadData in HomeViewController
                    NSNotificationCenter.defaultCenter().postNotificationName("loadPostItems", object: nil)

                }
            }
            else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }
}
