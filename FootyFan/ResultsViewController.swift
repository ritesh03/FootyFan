//
//  ResultsViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 06/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var firstView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews()
    {
        
        firstView.roundedTopCorners()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn1Action(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "myClubResultsView") as! MyClubResultsViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }

    @IBAction func btn2Action(_ sender: Any) {
    }
    @IBAction func bacnBtnAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}
