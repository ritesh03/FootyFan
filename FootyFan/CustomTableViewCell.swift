//
//  CustomTableViewCell.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
   
    @IBOutlet weak var headerView: UIImageView!
    
    
    @IBOutlet weak var subLabel: UILabel!
    
    
    @IBOutlet weak var backBtn: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var ssss: UILabel!
}
