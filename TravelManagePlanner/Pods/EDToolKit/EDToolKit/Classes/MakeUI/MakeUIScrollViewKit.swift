//
//  MakeUIScrollViewKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 28..
//
//

import Foundation
import UIKit

open class MakeUIScrollViewKit {
    
    public let shared = MakeUIScrollViewKit()
    
    open func makeScrollView(size: CGSize, addView: AnyObject) -> UIScrollView {
        let mainView = UIScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        mainView.backgroundColor = UIColor.clear
        mainView.translatesAutoresizingMaskIntoConstraints = false
        addView.addSubview(mainView)
        
        return mainView
    }
}
