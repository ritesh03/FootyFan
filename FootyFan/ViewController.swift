//
//  ViewController.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 22/12/16.
//  Copyright © 2016 Ritesh Chopra. All rights reserved.
//

import UIKit
import Accounts
import Social
import TwitterKit
import FacebookCore
import FacebookLogin


class ViewController: BaseViewController,UITextFieldDelegate {

    
    @IBOutlet weak var tf_username: CustomPlaceholderField!
    @IBOutlet weak var tf_password: CustomPlaceholderField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // For underline text
        let Attributes : [String: Any] = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 15),
            NSForegroundColorAttributeName : UIColor.white,
            NSUnderlineStyleAttributeName : NSUnderlineStyle.styleSingle.rawValue]
        
        let attributeString = NSMutableAttributedString(string: "SignUp",
                                                        attributes: Attributes)
        signUpBtn.setAttributedTitle(attributeString, for: .normal)
        
        
        tf_username.addPlaceholder(image: "user", placeholder: "Username")
        tf_password.addPlaceholder(image: "pass", placeholder: "Password")
        
        

        
    }
    
    override func viewDidLayoutSubviews()
    {
        
        tf_username.roundedTopCorners()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnAction(_ sender: Any) {
    
        errorLabel.text = ""
        
        let errorStrEmail = super.istextfieldEmpty(tf_username,type: enTextFieldType.name)
        let errorStrPass = super.istextfieldEmpty(tf_password,type: enTextFieldType.password)
        if !errorStrEmail.isEmpty {
            errorLabel.text = errorStrEmail
            
        }
        else if !errorStrPass.isEmpty {
            errorLabel.text = errorStrPass
            
        }
        else {
            if Reachability.isConnectedToNetwork() {
                //Show Loader
                
                kAppDelegate.activateView(self.view, loaderText: "Loading...")
                self.doLogin(tf_username.text!, password:tf_password.text!)
            }
            else  {
                errorLabel.text = STRINGVALUES.CHECK_INTERNET_CONNECTION
                
            }
        }

    
    }
    
    func doLogin(_ name:String,password:String) {
        let u:User=User()
        u.email = name
        u.password = password
        AppInstance.applicationInstance.user = u
        let bizObject:BusinessLayer=BusinessLayer()
        bizObject.loginNormal { (success) -> Void in
            //Hide Loader
            DispatchQueue.main.async(execute: { () -> Void in
                kAppDelegate.inActivateView(self.view)
                self.navigateToDashboardVC()
                
//                if(success) {
//                    self.navigateToDashboardVC()
//                }
//                else {
//                    self.errorLabel.text = STRINGVALUES.INVALID_CREDENTIALS
//                }
            })
            
        }
    }

    @IBAction func logInWithFacebookAction(_ sender: Any) {
        
        if Reachability.isConnectedToNetwork() {
            
            let loginManager = LoginManager()
            loginManager.logIn([ .publicProfile, .email ], viewController: self) { loginResult in
                print("LOGIN RESULT! \(loginResult)")
                switch loginResult {
                case .failed(let error):
                    print("FACEBOOK LOGIN FAILED: \(error)")
                case .cancelled:
                    print("User cancelled login.")
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    self.getUserInfoFromFacebook()
                    print("Logged in!")
                    print("GRANTED PERMISSIONS: \(grantedPermissions)")
                    print("DECLINED PERMISSIONS: \(declinedPermissions)")
                    print("ACCESS TOKEN \(accessToken)")
                }
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    
    func getUserInfoFromFacebook()
    {
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,name,first_name,last_name,email"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                let data:[String:AnyObject] = result as! [String : AnyObject]
                print(data)
                //self.navigateToDashboardVC()
                
            }
        })
    }

    @IBAction func logInWithTwitterAction(_ sender: Any) {
        
        if Reachability.isConnectedToNetwork() {
            Twitter.sharedInstance().logIn { session, error in
                
                if session != nil {
                    // Here you have a valid session you can use.
                    Helper.printLog("\(session!)" as AnyObject?)
                    let tempUser:User=User()
                    tempUser.name = session!.userName
                    tempUser.email = ""
                    tempUser.socialmedia_id = session!.userID
                    tempUser.socialmedia_type = "Twitter"
                }
                else {
                    //self.ErrroLabel.text = error!.localizedDescription
                    Helper.printLog("error: \(error!.localizedDescription)" as AnyObject?)
                }
            }
            
        }
    }
    


}

