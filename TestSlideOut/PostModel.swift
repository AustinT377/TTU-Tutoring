//
//  PostModel.swift
//  TestSlideOut
//
//  Created by Kevin Taing on 10/14/15.
//  Copyright © 2015 Turner. All rights reserved.
//

import UIKit


class PostModel: NSObject {
    
    func getPost() {
        var postQuery = PFQuery(className:"Post")
        postQuery.whereKey("isTutor", equalTo: true)
        postQuery.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
    
        if error == nil {
            // The find succeeded.
            print("Successfully retrieved \(objects!.count) scores.")
            // Do something with the found objects
            if let objects = objects as [PFObject]? {
                for object in objects {
                    print(object.objectId)
                }
            }
        }
        else {
            // Log details of the failure
            print("Error: \(error!) \(error!.userInfo)")
        }
    
        }
    
    }
}
