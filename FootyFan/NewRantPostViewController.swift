//
//  MyClubResultsViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class NewRantPostViewController: UIViewController {

    @IBOutlet weak var tf_rent_title: CustomPlaceholderField!
    @IBOutlet weak var tf_rent_tag: CustomPlaceholderField!
    @IBOutlet weak var txtView_RantContent: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tf_rent_title.addPlaceholder(image: "comment", placeholder: "Rant Title")
        
        
        tf_rent_tag.addPlaceholder(image: "tag", placeholder: "Tags")
        tf_rent_tag.addDropDown()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backButtonClicked(button: UIButton) {
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func postButtonClicked(button: UIButton) {
                
    }

}
