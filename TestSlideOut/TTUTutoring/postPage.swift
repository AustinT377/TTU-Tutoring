//
//  PostPage.swift
//  TTU Tutor PostPage
//
//  Created by Kevin Taing on 9/30/15.
//  Copyright © 2015 Kevin Taing. All rights reserved.
//

import UIKit

class PostPage: UIViewController, UITextViewDelegate {
    
    //These are test strings used for the labels
    let myName = "Kevin Taing"
    let myTitle = "Helping Calculus"
    let mySubject = "Math"
    let myDate = "10/7/15"
    let myRating = "A+"
    let myDesc = "I am currently in Cal III looking for anyone who needs help with Cal I. My hours are pretty flexible so I can work with many schedules. I prefered if you touched bases with me a day before the session, but I am willing to help on the spot depending the time. I charge $25 a session and $35 on-the-spot sessions. If the session exceeds 5 hours, I will double the price. I only failed Cal I twice, so I'm pretty qualified."
    
    
    //variables to hold user/post data
    var userNameData = " "
    var userTitleData = " "
    var userSubjectData = " "
    var userDateData = " "
    var userDescriptionData = " "
    var userRatingData = " "
    
    //these are the default labels & buttons
    @IBOutlet weak var defaultName: UILabel!
    @IBOutlet weak var defaultTitle: UILabel!
    @IBOutlet weak var defaultSubject: UILabel!
    @IBOutlet weak var defaultDate: UILabel!
    @IBOutlet weak var defaultDescription: UILabel!
    @IBAction func messageButton(sender: AnyObject) {
    }
    
    
    //these labels will grab from backend
    @IBOutlet weak var theirName: UILabel!
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var userSubject: UILabel!
    @IBOutlet weak var userDate: UILabel!
    @IBOutlet weak var descriptionBox: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //giveing the default labels, a text
        defaultName.text = "Name: "
        defaultDate.text = "Date: "
        defaultDescription.text = "Description: "
        defaultSubject.text = "Subject: "
        defaultTitle.text = "Title: "
        
        //this is just linking my template data to the variables
        userNameData = myName
        userTitleData = myTitle
        userSubjectData = mySubject
        userDateData = myDate
        userRatingData = myRating
        userDescriptionData = myDesc
        
        //tableView code
        descriptionBox.text = userDescriptionData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}