//
//  Constants.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/22/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//
import UIKit

struct API {
    
    static var BASE_URL:String = ""
    static var BASE_URL_DEV:String=""
    static var BASE_URL_STAGING:String="http://192.155.246.146:3214"
    static var BASE_URL_LIVE:String=""
    static var API_SOCIAL_LOGIN:String="/users/api/sociallogin/:id/:type/:provider"
    static var API_USER_LOGIN:String="/users/api/login"
    static var API_SOCIAL_REGISTER:String="/users/api/register/socialmedia"
    static var API_USER_REGISTER:String="/users/api/register"
    static var UPLOAD_FOLDER:String=""
}

struct APPDETAILS {
    static var ITUNES_STORE_URL = ""
}

struct StringValues {
    
    //Twitter Login Key
    static let TWITTER_CONSUMER_KEY = "RwjMtcTx3cTYscgFHFqNA"
    static let TWITTER_CONSUMER_SECRET = "jCLvaH50UgSrT3cpNtBYfDIM3kIJ2vxP4CFJxaAWg"
}

struct DEVICES {
    enum enDeviceFamily:Int {
        case iPhone4S
        case iPhone5Family
        case iPhone6
        case iPhone6Plus
    }
    static var DEVICE : enDeviceFamily = enDeviceFamily.iPhone6Plus
}

struct CONNECTIONMODE {
    enum enBuildConnection:Int {
        case live
        case staging
        case dev
    }
}

struct SHARINGMODE {
    enum enShareUsing:Int {
        case Facebook
        case twitter
        case email
    }
}
struct SCREENS {
    static var SPLASH = "splash"
    static var LOG_IN = "log-in"
    static var REGISTER = "register"
    static var FORGOT_PASSWORD = "forgot-password"
    static var TERMS_CONDITIONS = "terms-and-conditions"
    static var PRIVACY_POLICY = "privacy-policy"
    static var DASHBOARD = "dashboard"
    static var WELCOME = "welcome"
    static var SETTINGS = "settings"
    static var ABOUT = "about"
}


