 //
//  CommunicationManager.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/15/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//

 
import Foundation


class CommunicationManager: NSObject {
    
    func POST(api:NSString,jsonString:NSString,completionHandler:(_ success:Bool,_ response:String) -> Void) {
        let url: URL = URL(string: api as String)!
        let jsonData:Data = jsonString.data(using: String.Encoding.ascii.rawValue)!
        let postLength:NSString = String( jsonData.count ) as NSString
        let request: NSMutableURLRequest = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 60
        request.httpBody=jsonData
        request.httpShouldHandleCookies=false
        request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        if let user = AppInstance.applicationInstance.user {
            if let token = user.accessToken {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            }
        }
        
        
        let response: AutoreleasingUnsafeMutablePointer<URLResponse?>?=nil
        do {
            let data: Data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: response)
            if let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                completionHandler(true, responseString as String)
            }
        }catch let error as NSError{
            print(error)
            completionHandler(false, "Error in post")
        }

    }
    
    func GET(api:NSString,queryString:NSString,sync:Bool, completionHandler:@escaping (_ success:Bool,_ response:String) -> Void) {
        
        var api = api
        
        api = (api as String) + (queryString.addingPercentEscapes(using: String.Encoding.utf8.rawValue))!  as NSString
        
        let url: URL? = URL(string: api as String)
        
        if((url) != nil) {
            
            let request: NSMutableURLRequest = NSMutableURLRequest(url: url!)
            request.httpMethod = "GET"
            request.timeoutInterval = 30
            request.httpShouldHandleCookies=false
            if let user = AppInstance.applicationInstance.user {
                if let token = user.accessToken {
                    request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                }
            }
            if(sync==false) {
                let queue:OperationQueue = OperationQueue()
                
                NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: queue, completionHandler:{ (response, responseData, error) -> Void in
                    
                    if let data = responseData {
                        if let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                            completionHandler(true,responseString as String)
                        }
                        else {
                            Helper.printLog("Error: CommMgr:GET=\(error)" as AnyObject?)
                            completionHandler(false,"")
                        }
                    }
                    else {
                        Helper.printLog("Error in GET \(error)" as AnyObject?)
                        completionHandler(false,"")
                    }
                })
            }
            else {

                let response: AutoreleasingUnsafeMutablePointer<URLResponse?>?=nil

                do {
                    let data: Data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: response)
                    if let responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                        
                        completionHandler(true,responseString as String)
                    }
                    else {
                        completionHandler(false,"")
                    }
                }catch let error as NSError{
                    // Handling error
                    print(error)
                    completionHandler(false,"")
                }
                
            }
        }
    }
    
    
}
