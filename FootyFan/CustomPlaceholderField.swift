//
//  CustomTextfieldView.swift
//  FootyFan
//
//  Created by Loveneet Sharma on 03/01/17.
//  Copyright © 2017 Ritesh Chopra. All rights reserved.
//

import UIKit

class CustomPlaceholderField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addPlaceholder(image:String,placeholder:String) {
    
        // Create a NSTextAttachment with your image
        let placeholderImageTextAttachment = NSTextAttachment()
        placeholderImageTextAttachment.image = UIImage(named: image)!
        // Use 'bound' to adjust position and size
        placeholderImageTextAttachment.bounds = CGRect(x: CGFloat(0), y: CGFloat(-2), width: CGFloat(16), height: CGFloat(16))
        let placeholderImageString = NSAttributedString(attachment: placeholderImageTextAttachment)
        // Append the placeholder text
        let placeholderString = NSMutableAttributedString(string:"")
        placeholderString.append(placeholderImageString)
        placeholderString.append(NSMutableAttributedString(string:" "))
        placeholderString.append(NSMutableAttributedString(string:placeholder))
        // set as (attributed) placeholder
        self.attributedPlaceholder! = placeholderString

    }
    
    func addDropDown() {
        
        let arrow = UIImageView(image: UIImage(named: "down"))
        arrow.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat((arrow.image?.size.width)!+30), height: CGFloat((arrow.image?.size.height)!))
        arrow.contentMode = UIViewContentMode.center
        self.rightView = arrow
        self.rightViewMode = UITextFieldViewMode.always
    }

}
