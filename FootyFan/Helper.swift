
//
//  Helper.swift
//  TestSwift
//
//  Created by Gurdev Singh on 12/30/14.
//  Copyright (c) 2014 Gurdev Singh. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class Helper: NSObject {

    
    class func SaveUserObjectToFile(_ user:User) {
        let fileSaved = NSKeyedArchiver.archiveRootObject(user, toFile: GetFilePath("User.plist"))
        Helper.printLog(fileSaved as AnyObject?)
    }
    
    class func ReadUserObjectFromFile() -> User? {
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: GetFilePath("User.plist")) as? User {
            return user
        }
        return nil
    }
    
    class func getDocumentsURL() -> URL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let dataPath = documentsURL.appendingPathComponent("MyFolder")
        do {
            try FileManager.default.createDirectory(at: dataPath, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            Helper.printLog(error.localizedDescription as AnyObject?)
        }
        return dataPath
    }
    
    
    class func GetFilePath(_ fileName:String) -> String {
        let fileURL = getDocumentsURL().appendingPathComponent(fileName)
        return fileURL.path
    }
    
    class func contentsOfDirectoryAtPath(_ path: URL) -> [URL]? {
        
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions())
            Helper.printLog(directoryContents as AnyObject?)
            
            return directoryContents
            
        } catch let error as NSError {
            Helper.printLog(error.localizedDescription as AnyObject?)
        }
        
        return nil
        
    }
    
    class func FileExists(_ fileName:String) -> Bool {
        return FileManager.default.fileExists(atPath: GetFilePath(fileName))
    }
    
    class func DeleteUserObject() {
        DeleteAllFiles()
    }
    
    class func DeleteAllFiles() {
        let fileManager:FileManager=FileManager()
        do {
            
            let folderPathURL = fileManager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)[0]
            if let directoryURLs = try? fileManager.contentsOfDirectory(at: folderPathURL, includingPropertiesForKeys: nil, options: FileManager.DirectoryEnumerationOptions.skipsHiddenFiles) {
                let listOfFiles = try? directoryURLs.filter { $0.pathExtension == "plist" }.map { $0.lastPathComponent }
                if let files = listOfFiles {
                    for file in files {
                        try fileManager.removeItem(atPath: GetFilePath(file))
                    }
                }
            }
        }catch let error as NSError{
            Helper.printLog(error.localizedDescription as AnyObject?)
        }
    }
    
    class func SaveImageToFile(_ imageData:UIImage,filename:String) {
        let saved = (try? UIImagePNGRepresentation(imageData)!.write(to: URL(fileURLWithPath: GetFilePath(filename)), options: [.atomic])) != nil
        if saved==true {
                Helper.printLog("image data saved." as AnyObject?)
        }
    }
    
    class func GetPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true) 
        return paths.first!
    }
    
    
    class func convertText(_ inputText: String) -> NSAttributedString {
        var html = inputText
        while let range = html.range(of: "\n") {
            html.replaceSubrange(range, with: "<br />")
        }
        
        html = "<span style=\"font-family: Helvetica; font-size:12pt;\">" + html + "</span>"
        
        let data = html.data(using: String.Encoding.unicode, allowLossyConversion: true)!
        do {
            let attrStr = try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
            return attrStr
        } catch let error as NSError {
            Helper.printLog(error.localizedDescription as AnyObject?)
        }
        
        return NSAttributedString(string: "")
    }
    
    class func getTintedImage(_ backgroundImage:UIImage,transparentImage:UIImage,tintColor:UIColor,rect:CGRect) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context:CGContext  = UIGraphicsGetCurrentContext()!
        let ivTemp:UIImageView=UIImageView(image: transparentImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate))
        ivTemp.tintColor=tintColor
        ivTemp.frame.size.height=rect.size.height
        ivTemp.frame.size.width=rect.size.width
        let bInfo:UIButton=UIButton(type: UIButtonType.custom)
        bInfo.setImage(backgroundImage, for: UIControlState())
        bInfo.frame.size.height=rect.size.height
        bInfo.frame.size.width=rect.size.width
        ivTemp.addSubview(bInfo)
        
        ivTemp.layer.render(in: context)
        let tintedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        return tintedImage
    }
    
    class func getDeviceModel() -> DEVICES.enDeviceFamily
    {
        var screenHeight: CGFloat!
        screenHeight = UIScreen.main.bounds.size.height
        if screenHeight > 480 && screenHeight < 667 { //iphone5 family
            return DEVICES.enDeviceFamily.iPhone5Family
        }
        else if  screenHeight > 480 && screenHeight < 736 { //iPhone6
            return DEVICES.enDeviceFamily.iPhone6
        }
        else if ( screenHeight > 480 ) { // iPhone6Plus
            return DEVICES.enDeviceFamily.iPhone6Plus
        }
        return DEVICES.enDeviceFamily.iPhone5Family
    }
    

    class func convertObjectToJson(_ object:NSObject) -> String {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let result = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) {
                return result as String
            }
        } catch let error as NSError {
            Helper.printLog(error.localizedDescription as AnyObject?)
        
        }
        
        return ""
    }
    
    class func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func printLog(_ logValue:AnyObject?) {
        print(logValue)
    }
}
