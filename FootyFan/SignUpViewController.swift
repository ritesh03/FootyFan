//
//  SignUpViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 04/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class SignUpViewController: BaseViewController {

    @IBOutlet weak var tf_username: CustomPlaceholderField!
    @IBOutlet weak var tf_password: CustomPlaceholderField!
    @IBOutlet weak var tf_confirmPass: CustomPlaceholderField!
    @IBOutlet weak var tf_email: CustomPlaceholderField!
    @IBOutlet weak var tf_yob: CustomPlaceholderField!
    @IBOutlet weak var tf_football: CustomPlaceholderField!
    @IBOutlet weak var tf_pinCode: CustomPlaceholderField!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var termsOfUse: UIButton!
    
    @IBOutlet weak var privacyPolicy: UIButton!
    
    @IBOutlet weak var memberBtn: UIButton!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    var clubs = ["Football Club", "Test Club", "Other Club", "More Clubs"];
    
    var yob = ["1980", "1981", "1982", "1983","1984", "1985", "1986", "1987","1988", "1989", "1990", "1991","1992", "1993", "1994", "1995","1996", "1997", "1998", "1983","1980", "1981", "1982", "1983","1980", "1981", "1982", "1983"];
    
    var isDropDownSel = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        tf_username.addPlaceholder(image: "user", placeholder: "Username*")
        tf_password.addPlaceholder(image: "pass", placeholder: "Password*")
        tf_confirmPass.addPlaceholder(image: "pass", placeholder: "Confirm Password*")
        tf_email.addPlaceholder(image: "email", placeholder: "Email*")
        tf_football.addPlaceholder(image: "ball", placeholder: "Football Club*")
        tf_yob.addPlaceholder(image: "calendar", placeholder: "Year of Birth")
        tf_pinCode.addPlaceholder(image: "location", placeholder: "Postcode")
        
        
        let Attributes : [String: Any] = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 13),
            NSForegroundColorAttributeName : UIColor.white,
            NSUnderlineStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue]
        
        var attributeString = NSMutableAttributedString(string: "Terms of Use",
                                                        attributes: Attributes)
        termsOfUse.setAttributedTitle(attributeString, for: .normal)
       
         attributeString = NSMutableAttributedString(string: "Privacy Policy",
                                                        attributes: Attributes)
        privacyPolicy.setAttributedTitle(attributeString, for: .normal)
    
    }

    override func viewDidLayoutSubviews()
    {
        
       tf_username.roundedTopCorners()
        
        
    }
    
    @IBAction func dropDownClicked(_ sender: UIButton) {
    
        ActionSheetStringPicker.show(withTitle: "Select football club", rows: self.clubs, initialSelection: 0, doneBlock: {
            picker, value, index in
            self.tf_football.text = self.clubs[value]
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
    
    }
    
    @IBAction func yobClicked(_ sender: UIButton) {
        
        let datePicker = ActionSheetDatePicker(title: "Select DOB", datePickerMode: UIDatePickerMode.date, selectedDate: NSDate() as Date!, doneBlock: {
            picker, value, index in
            let date = value as! Date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd MMM yyyy"
            self.tf_yob.text = dateFormatter.string(from: date)
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: sender)
        
        datePicker?.maximumDate = Date()
        datePicker?.show()
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        
        errorLabel.text = ""
        if Reachability.isConnectedToNetwork() {
            if(self.validateData()) {
                let u:User=User()
                u.email = tf_email.text
                u.password = tf_password.text
                u.name = tf_username.text
                let bizObject:BusinessLayer=BusinessLayer()
                AppInstance.applicationInstance.user = u
                //Show Loader
                let appDelegate : AppDelegate = AppDelegate().sharedInstance()
                appDelegate.activateView(self.view, loaderText: "Loading...")
                
                bizObject.signUpNormal({ (success, errorMessage) -> Void in
                    DispatchQueue.main.async(execute: { () -> Void in
                        //Hide Loader
                        appDelegate.inActivateView(self.view)
                        if(success) {
                            
                            self.navigateToDashboardVC()
                        }
                        else {
                            
                            self.errorLabel.text = errorMessage
                        }
                        
                    })
                })
            }
        }
        else {
            errorLabel.text = STRINGVALUES.CHECK_INTERNET_CONNECTION
            
        }
        
        
    }
    
    @IBAction func maleClicked(_ sender: UIButton) {
        sender.isSelected = true
        self.femaleBtn.isSelected = false
    }
    
    @IBAction func femaleClicked(_ sender: UIButton) {
        sender.isSelected = true
        self.maleBtn.isSelected = false
    }
    
    @IBAction func rememberMeClicked(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    //MARK: Validate UITextFields
    func validateData() -> Bool {
        var valid:Bool=false
        let errorStrName = super.istextfieldEmpty(tf_username,type: enTextFieldType.name)
        let errorStrPass = super.istextfieldEmpty(tf_password,type: enTextFieldType.signUp_Password)
        let errorStrConfirmPass = super.istextfieldEmpty(tf_confirmPass,type: enTextFieldType.confirm_Password)
        let errorStrEmail = super.istextfieldEmpty(tf_email,type: enTextFieldType.email)
       
        
        if !errorStrName.isEmpty {
            errorLabel.text = errorStrName
        }
       
        else if !errorStrPass.isEmpty {
            errorLabel.text = errorStrPass
        }
        else if !errorStrConfirmPass.isEmpty {
            errorLabel.text = errorStrPass
        }
        else if tf_confirmPass.text != tf_password.text {
            errorLabel.text = STRINGVALUES.PASSWORD_MISMATCH
        }
        else  if !errorStrEmail.isEmpty {
            errorLabel.text = errorStrEmail
        }
        else {
            valid = true
        }
        
        return valid
    }

    //MARK: UITextField Delegates
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool
    {
        errorLabel.text = ""
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        errorLabel.text = ""
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func backBtnClicked(_ sender: Any) {
        
      self.navigationController?.popViewController(animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
