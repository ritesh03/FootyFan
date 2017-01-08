//
//  DashboardViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func btn1Clicked(_ sender: Any) {
    }
    
    
    @IBAction func btn2Clicked(_ sender: Any) {
    }
    
    
    @IBAction func btn3Clicked(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Rant", bundle: Bundle.main)
        let VC = storyboard.instantiateViewController(withIdentifier: "discussionView") as! DiscussionViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func btn4Clicked(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "resultsView") as! ResultsViewController
        self.navigationController?.pushViewController(VC, animated: true)
        
    }

    @IBAction func btn5Clicked(_ sender: Any) {
    }

    
//end
}
