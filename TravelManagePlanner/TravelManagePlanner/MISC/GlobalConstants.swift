//
//  GlobalConstants.swift
//  TravelManagePlanner
//
//  Created by UY on 2022/01/03.
//

import Foundation
import UIKit

enum GlobalConstants {
    
    enum Font {
        enum Size {
            static var mainFontSize: CGFloat = 15
            static var descFontSize: CGFloat = 10
        }
    }
    
    enum Color {
        enum Text {
            static var buttonTextColor: UIColor = .white
            static var invalidateTextColor: UIColor = .red
        }
        enum Background {
            static var themeColor: UIColor = UIColor(red: 243/255, green: 255/255, blue: 251/255, alpha: 1)
            static var loginButtonbackgroundColor: UIColor = .blue
        }
        
    }
    
}
