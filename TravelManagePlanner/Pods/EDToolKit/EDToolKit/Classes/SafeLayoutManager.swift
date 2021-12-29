//
//  SafeAutoLayout.swift
//  EDToolKit
//
//  Created by 은아월 on 2018. 5. 25..
//

import Foundation
import UIKit

open class SafeLayoutManager {
    public static let shared = SafeLayoutManager()
    
    open func basicLayout(left: CGFloat, right: CGFloat, top: CGFloat, bottom: CGFloat, targetView: AnyObject, baseView: AnyObject) {
        if #available(iOS 11.0, *) {
            let safeGuide = baseView.safeAreaLayoutGuide!
            NSLayoutConstraint.activate([
                targetView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: left),
                targetView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -right),
                targetView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: top),
                targetView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -bottom)
                ])
        }
    }
    
    open func basicLayout(left: CGFloat, right: CGFloat, targetView: AnyObject, baseView: AnyObject) {
        if #available(iOS 11.0, *) {
            let safeGuide = baseView.safeAreaLayoutGuide!
            NSLayoutConstraint.activate([
                targetView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: left),
                targetView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -right)
                ])
        }
    }
    
    open func basicLayout(top: CGFloat, bottom: CGFloat, targetView: AnyObject, baseView: AnyObject) {
        if #available(iOS 11.0, *) {
            let safeGuide = baseView.safeAreaLayoutGuide!
            NSLayoutConstraint.activate([
                targetView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: top),
                targetView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -bottom)
                ])
        }
    }
    
    open func singleLayout(type: safeLayoutType ,value: CGFloat, targetView: AnyObject, baseView: AnyObject) {
        if #available(iOS 11.0, *) {
            let safeGuide = baseView.safeAreaLayoutGuide!
            switch type {
            case .top:
                NSLayoutConstraint.activate([
                    targetView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: value)
                    ])
                break
            case .bottom:
                NSLayoutConstraint.activate([
                    targetView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -value)
                    ])
                break
            case .left:
                NSLayoutConstraint.activate([
                    targetView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: value)
                    ])
                break
            case .right:
                NSLayoutConstraint.activate([
                    targetView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -value)
                    ])
                break
            }
        }
    }
    
    @available(iOS 11.0, *)
    open func returnSingleLayout(type: safeLayoutType ,value: CGFloat, targetView: AnyObject, baseView: AnyObject) -> NSLayoutConstraint {
        let safeGuide = baseView.safeAreaLayoutGuide!
        var returnLayout: NSLayoutConstraint!
        switch type {
        case .top:
            returnLayout = targetView.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: value)
            break
        case .bottom:
            returnLayout = targetView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -value)
            break
        case .left:
            returnLayout = targetView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: value)
            break
        case .right:
            returnLayout = targetView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -value)
            break
        }
        
        return returnLayout
    }
}

public enum safeLayoutType {
    case left
    case right
    case top
    case bottom
}
