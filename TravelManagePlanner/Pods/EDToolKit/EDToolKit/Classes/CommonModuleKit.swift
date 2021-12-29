//
//  CommonModuleKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 10..
//
//

import Foundation
import UIKit

open class CommonModuleKit {
    
    public static let shared = CommonModuleKit()
    init () {
        
    }
    
    open func checkBlank(checkString: String?) -> Bool {
        if checkString == nil || checkString! == "" || (checkString! as NSString).length == 0 {
            return true
        }
        
        return false
    }
    
    open func requiredHeight(width: CGFloat, font: UIFont, text: String) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        return label.frame.height
    }
    
    open func requiredWidth(width: CGFloat, font: UIFont, text: String) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        return label.frame.width
    }
    
    open func requiredFrame(width: CGFloat, font: UIFont, text: String) -> CGSize{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        return CGSize(width: label.frame.width, height: label.frame.height)
    }
    
}
