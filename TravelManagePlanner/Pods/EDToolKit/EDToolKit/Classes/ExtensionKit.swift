//
//  ExtensionKit.swift
//  Pods
//
//  Created by 김현지 on 2016. 11. 11..
//
//

import Foundation
import UIKit

//MARK: String
public extension String{
    var localized:String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    func localizedWithComment(_ comment:String) -> String{
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: comment)
    }
}
