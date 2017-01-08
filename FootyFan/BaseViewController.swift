//
//  BaseViewController.swift
//  SampleApp
//
//  Created by Ritesh Chopra on 02/02/16.
//  Copyright © 2016 Gurdev Singh. All rights reserved.
//

import UIKit

enum enTextFieldType:Int {
    case name
    case email
    case password
    case signUp_Password
    case confirm_Password
}

class BaseViewController: UIViewController {
    var loadingIndicator : UIActivityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func istextfieldEmpty(_ textValue:UITextField,type:enTextFieldType) -> String
    {
        var errorStr = ""
        if textValue.text == "" {
            if  type == enTextFieldType.name {
                
                errorStr = STRINGVALUES.MISSING_NAME
            }
            else if type == enTextFieldType.email {
                
                errorStr = STRINGVALUES.MISSING_EMAIL
            }
            else if type == enTextFieldType.password || type == enTextFieldType.signUp_Password {
                errorStr = STRINGVALUES.MISSING_PASSWORD
            }
            else if type == enTextFieldType.confirm_Password {
                errorStr = STRINGVALUES.PASSWORD_MISMATCH
            }
            return errorStr
            
        }
        else
        {
            if type == enTextFieldType.email
            {
                if !self.isValidEmail(textValue.text!) {
                    //textValue.textColor = UIColor.red
                    let errorStr = STRINGVALUES.INVALID_EMAIL
                    return errorStr
                }
                
            }
            else if type == enTextFieldType.signUp_Password
            {
                var FinalString : NSString = NSString()
                FinalString = textValue.text! as NSString
                if FinalString.length <= 5 {
                    let errorStr = STRINGVALUES.PASSWORD_RULE
                    return errorStr
                }
            }
            
            return errorStr
        }
        
        
    }
    //MARK:- data validation methods
    //Email Validation Method
    func isValidEmail(_ emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let range = emailID.range(of: emailRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    //Password Validation Methods
    func isPwdSuperStrong(_ candidate:String) -> Bool {
        
        let pwdRegEx = "((?=.*\\d)(?=.*[a-z])(?=.*[\\\\@#$%&¥₹£€^<>~*+=?!_|\\-/{}()'•.,:;\"\\[\\]]))"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func isPwdStrongWithNumberAndChar(_ candidate:String) -> Bool {
        let pwdRegEx = "((?=.*\\d)(?=.*[a-z]).{1,50})"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func isPwdStrongWithNumberAndSpecialChar(_ candidate:String) -> Bool {
        let pwdRegEx = "((?=.*\\d)(?=.*[\\\\@#$%&¥₹£€^<>~*+=?!_|\\-/{}()'•.,:;\"\\[\\]]).{1,50})"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func isPwdStrongWithCharAndSpecialChar(_ candidate:String) -> Bool {
        let pwdRegEx = "((?=.*[a-z])(?=.*[\\\\@#$%&¥₹£€^<>~*+=?!_|\\-/{}()'•.,:;\"\\[\\]]).{1,50})"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    
    func isPwdWeekWithNumeral(_ candidate:String) -> Bool {
        let pwdRegEx = "(?=.*\\d)"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func isPwdWeekWithCharacter(_ candidate:String) -> Bool {
        let pwdRegEx = "(?=.*[a-z])"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    func isPwdWeekWithSpecialCharacter(_ candidate:String) -> Bool {
        let pwdRegEx = "(?=.*[\\\\@#$%&¥₹£€^<>~*+=?!_|\\-/{}()'•.,:;\"\\[\\]])"
        let range = candidate.range(of: pwdRegEx, options:.regularExpression)
        let result = range != nil ? true : false
        return result
    }
    
    //MARK: Navigate To Home Screen
    func navigateToDashboardVC() {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "dashboardView") as! DashboardViewController
        self.navigationController?.pushViewController(VC, animated: true)
        
    }

    
}
