//
//  ForgotPasswordViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 04/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController,UITextFieldDelegate {

    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var tf_email: UITextField!
    
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
        
        errorLabel.text = ""
        let errorStrEmail = super.istextfieldEmpty(tf_email,type: enTextFieldType.email)
      
        if !errorStrEmail.isEmpty {
            errorLabel.text = errorStrEmail
            
        }
        else {
            if Reachability.isConnectedToNetwork() {
                //Show Loader
                
            }
            else  {
                errorLabel.text = STRINGVALUES.CHECK_INTERNET_CONNECTION
                
            }
        }

    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }


}
