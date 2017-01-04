//
//  BusinessLayer.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/15/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//

 import Foundation
import TwitterKit


enum enLoginType:Int {
    case enLoginNormal
    case enLoginFacebook
    case enLoginTwitter
}

class BusinessLayer: NSObject {
    
    var commMgr:CommunicationManager
    
    override init() {
        commMgr = CommunicationManager()
    }
    func socialLogin(_ socialmedia_id:String,type:String,completionHandler:@escaping (_ success:Bool) -> Void) {
        let queryString = "/" + socialmedia_id + "/" + type + "?device_id=" + AppInstance.applicationInstance.device_id + "&device_type=1"
        commMgr.GET(api: "\(API.BASE_URL_STAGING)\(API.API_SOCIAL_LOGIN)" as NSString, queryString: queryString as NSString, sync: true, completionHandler: { (success, response) -> Void in
            if( success == true ) {
                var userObject:User?
                userObject <-- response
                
                if(userObject?.email != nil) {

                    AppInstance.applicationInstance.user = userObject!
                    AppInstance.applicationInstance.userLoggedIn = true

                    Helper.SaveUserObjectToFile(userObject!)
                    
                    completionHandler(true)
                }
                else {
                    completionHandler(false)
                }
            }
        })
    }
    
    func loginNormal(_ completionHandler:@escaping (_ success:Bool) -> Void) {

        if let tempUser = AppInstance.applicationInstance.user
        {
            var queryString = "?email=" + tempUser.email!
            queryString = queryString + "&password=" + tempUser.password!
            queryString = queryString + "&age=" + "26"
            queryString = queryString + "&device_id=" + "53eb36f79b982320b4009f7e"
            queryString = queryString + "&device_type=" + "2"
            queryString = queryString + "&discloseData=" + "True"
            queryString = queryString + "&ethnicity=" + "0"
            
            commMgr.GET(api: "\(API.BASE_URL_STAGING)\(API.API_SOCIAL_LOGIN)" as NSString, queryString: queryString as NSString, sync: false, completionHandler: { (success, response) -> Void in
                if(success) {
                    var tempUser : User?
                      tempUser <-- response
                    AppInstance.applicationInstance.user = tempUser!
                                        if tempUser?.message == nil {
                                            AppInstance.applicationInstance.userLoggedIn = true
                                            Helper.SaveUserObjectToFile(tempUser!)
                                            completionHandler(true)
                                        }
                                        else {
                                            completionHandler(false)
                                        }
                }
                else
                {
                   completionHandler(false)
                }
            })
        }
    }
    
    func signUpNormal(_ completionHandler:@escaping (_ success:Bool,_ errorMessage:String?) -> Void) {
        
        if let tempUser = AppInstance.applicationInstance.user
        {
            var queryString = "?email=" + tempUser.email!
            queryString = queryString + "&password=" + tempUser.password!
            queryString = queryString + "&name=" + tempUser.name!
            queryString = queryString + "&age=" + "26"
            queryString = queryString + "&confirm=" + "123456"
            queryString = queryString + "&country=" + ""
            queryString = queryString + "&device_id=" + "53eb36f79b982320b4009f7e"
            queryString = queryString + "&device_type=" + "2"
            queryString = queryString + "&discloseData=" + "True"
            queryString = queryString + "&dob=" + "1996-06-01"
            queryString = queryString + "&ethnicity=" + "0"
            queryString = queryString + "&gender=" + "1"
            queryString = queryString + "&language=" + "en"
            queryString = queryString + "&provider=" + "1"
            commMgr.GET(api: "\(API.BASE_URL_STAGING)\(API.API_SOCIAL_LOGIN)" as NSString, queryString: queryString as NSString, sync: false, completionHandler: { (success, response) -> Void in
                if(success) {
                    var tempUser : User?
                    tempUser <-- response
                    if tempUser != nil
                    {
                    AppInstance.applicationInstance.user = tempUser!
                    }
                    if tempUser?.message == nil {
                        AppInstance.applicationInstance.userLoggedIn = true
                        Helper.SaveUserObjectToFile(tempUser!)
                        completionHandler(true,nil)
                    }
                    else {
                        completionHandler(false,response)
                    }
                }
                else
                {
                    completionHandler(false,response)
                }
            })
        }
    }

 
    func socialSignUp(_ completionHandler:@escaping (_ success:Bool,_ errorMessage:String) -> Void) {

        if let tempUser = AppInstance.applicationInstance.user
        {
            var queryString = "?email=" + tempUser.email!
            queryString = queryString + "&type=" + tempUser.socialmedia_type!
            queryString = queryString + "&name=" + tempUser.name!
            queryString = queryString + "&username=" + tempUser.name!
            queryString = queryString + "&socialmedia_id=" + tempUser.socialmedia_id!
            queryString = queryString + "&device_id=" + AppInstance.applicationInstance.device_id
            queryString = queryString + "&device_type=1"
            commMgr.GET(api: "\(API.BASE_URL_STAGING)\(API.API_SOCIAL_LOGIN)" as NSString, queryString: queryString as NSString, sync: true, completionHandler: { (success, response) -> Void in
                if(success == true) {
                    
                    var tempUser : User?
                    tempUser <-- response
                    Helper.printLog(tempUser?.message as AnyObject?)
                    AppInstance.applicationInstance.user = tempUser!
                    
                    if tempUser!.message == nil {
                        Helper.printLog("Data Saved" as AnyObject?)
                        AppInstance.applicationInstance.userLoggedIn = true
                        AppInstance.applicationInstance.user = tempUser!
                        Helper.SaveUserObjectToFile(tempUser!)
                        completionHandler(true, "")
                        return
                    }
                    else {
                        Helper.printLog("Data not Saved" as AnyObject?)
                        if let msg = tempUser!.message {
                            completionHandler(false, msg)
                            return
                        }
                        else {
                            completionHandler(false, "")
                            return
                        }
                    }
                }
                
                else {
                    
                    completionHandler(false, "Network Error")
                    return
                }
            })
        }
    }
    func getResponseDictionary(_ responseData:Data) -> NSDictionary? {
        do {
            if let responseDictionary: NSDictionary = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.mutableLeaves) as? NSDictionary
            {
                return responseDictionary
            }
        } catch let error as NSError {
            Helper.printLog(error.localizedDescription as AnyObject?)
        }
        
        return nil
    }

    func downloadImage(_ filename:String)
    {
        let imageURL: URL = URL(string: API.BASE_URL + API.UPLOAD_FOLDER + filename)!
        if let imageData = try? Data(contentsOf: imageURL) {
            let image:UIImage = UIImage(data: imageData)!
            Helper.SaveImageToFile(image, filename: filename)
        }
    }
    
    //LoggedOut from Application
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "login")
        UserDefaults.standard.synchronize()
        AppInstance.applicationInstance.userLoggedIn = false
        Helper.DeleteUserObject()
        AppInstance.applicationInstance.user = nil


    }

    
}
