//
//  ToolKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 28..
//
//

import Foundation
import UIKit

open class ToolKit {
    
    public static let shared = ToolKit()
    
    open func setTestBorder(view: AnyObject) {
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
}
