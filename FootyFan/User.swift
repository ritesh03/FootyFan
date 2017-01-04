//
//  User.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/23/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//

import UIKit



open class User : NSObject,NSCoding,Deserializable {
    
    var email:String?
    var name:String?
    var username:String?
    var _id:String?
    var age:Int?
    var password:String?
    var accessToken:String?
    var message:String?
    var socialmedia_id:String?
    var socialmedia_type:String?
    
    override init()
    {
        email=nil
        name=nil
        username=nil
        _id=nil
        password=nil
        accessToken = nil
    }
    
    required public init(coder aDecoder: NSCoder) {
        self.email = aDecoder.decodeObject(forKey: "email")  as? String
        self._id = aDecoder.decodeObject(forKey: "_id") as? String
        self.username = aDecoder.decodeObject(forKey: "username") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.accessToken=aDecoder.decodeObject(forKey: "accessToken") as? String
        self.password = aDecoder.decodeObject(forKey: "password") as? String
    }
    
    open func encode(with _aCoder: NSCoder) {
        _aCoder.encode(self.email, forKey: "email")
        _aCoder.encode(self._id, forKey: "_id")
        _aCoder.encode(self.username, forKey: "username")
        _aCoder.encode(self.name, forKey: "name")
        _aCoder.encode(self.password, forKey: "password")
    }
    
    func toDictionary() -> NSMutableDictionary {
        let dict:NSMutableDictionary = NSMutableDictionary()
        dict.setValue(self.email!, forKey: "email")
        dict.setValue(self._id!, forKey: "_id")
        dict.setValue(self.username!, forKey: "username")
        dict.setValue(self.name!, forKey: "name")
        dict.setValue(self.password!, forKey: "password")

        return dict
    }
    
    
    required public init(data: [String: AnyObject]) {
        email = data["email"] as? String
        email <-- data["email"]
        username <-- data["username"]
        name <-- data["name"]
        _id <-- data["_id"]
    }
}
