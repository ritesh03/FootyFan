//
//  ForgotPasswordViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 04/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backBtnAction(_ sender: Any) {
   _ = self.navigationController?.popViewController(animated: true)
        
    }

    @IBAction func resetBtnAction(_ sender: Any) {
    
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
