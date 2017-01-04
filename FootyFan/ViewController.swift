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


class ViewController: UIViewController {

    
    @IBOutlet weak var tf_username: UITextField!
    
    
    @IBOutlet weak var tf_password: UITextField!
    
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    
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
        
        //Adding placeholder image in uitextfield
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: "user")
        
        let leftView = UIView()
        leftView.addSubview(leftImageView)
        
        leftView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        leftImageView.frame = CGRect(x: 80, y: 10, width: 20, height: 20)
        tf_username.leftViewMode = .always
        tf_username.leftView = leftView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnAction(_ sender: Any) {
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

