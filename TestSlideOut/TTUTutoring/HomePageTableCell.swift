//
//  HomePageTableCell.swift
//  TutorApp
//
//  Created by Adam Nettel on 9/30/15.
//  Copyright © 2015 Adam Nettel. All rights reserved.
//

import Foundation
import UIKit

class HomePageTableCell: UITableViewCell {
    
    
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}