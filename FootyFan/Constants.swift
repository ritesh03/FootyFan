//
//  Constants.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/22/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//
import UIKit

let kAppDelegate  = AppDelegate().sharedInstance()

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


struct STRINGVALUES {
    //Twitter Login Key
    static let TWITTER_CONSUMER_KEY = "RwjMtcTx3cTYscgFHFqNA"
    static let TWITTER_CONSUMER_SECRET = "jCLvaH50UgSrT3cpNtBYfDIM3kIJ2vxP4CFJxaAWg"
    
    //Linked Login Key
    static let LinkedIn_CONSUMER_KEY = "75xn4wzkk0yiv3"
    static let LinkedIn_CONSUMER_SECRET = "oLfHFn566efBd3NB"
    //Crashlytics Key
    static let CRASHALYTICS_API_KEY = "2244dc4a61174595192f1b0aab8e8a84a819a6d5"
    
    //Login Signup Textfields Strings
    static let EMPTY_FIELDS = "Please enter a valid Email ID & Password"
    static let CHECK_INTERNET_CONNECTION = "Please check your internet connection"
    static let MISSING_NAME = "Please enter Username"
    static let MISSING_PASSWORD = "Please enter a Password"
    static let MISSING_EMAIL = "Please enter an email address"
    static let INVALID_EMAIL = "Please enter a valid Email Address"
    static let INVALID_CREDENTIALS = "The username or password you entered is incorrect"
    static let USER_DOES_NOT_EXISTS = "No user with this email exists"
    static let ACCESS_CODE_SENT = "Your access code has been sent to your email address"
    static let PASSWORD_RULE = "Password should contain aleast six characters"
    static let PASSWORD_MISMATCH = "Password and confirm password does not match"
    
    //Password Check Strings
    static let STRENGTH_GOOD = "Good"
    static let STRENGTH_WEAK = "Weak"
    static let STRENGTH_STRONG = "Strong"
    static let STRENGTH_SUPER_STRONG = "Super Strong"
    
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


