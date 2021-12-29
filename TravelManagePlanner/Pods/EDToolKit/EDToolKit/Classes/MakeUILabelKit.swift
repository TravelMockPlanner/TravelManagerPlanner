//
//  MakeLabelKit.swift
//  Pods
//
//  Created by 김현지 on 2016. 11. 23..
//
//

import Foundation
import UIKit

public class MakeUILabelKit {

    public typealias CompletionHandler = () -> Void
    public static let COLOR_BASIC = UIColor.black
    fileprivate var isAction: Void = Void()
    
    private var isActionTest: CompletionHandler!
    public static let shared = MakeUILabelKit()
    
    public init() {
    
    }
    
    // MARK: make UILabel
    // MARK : 2017.04.26 Size(CGRect) -> Size(CGSize) 로 변경, 상단함수 곧 Deprecated 에정.
    open func makeLabel(_ text: String, size: CGSize, addView: AnyObject) -> UILabel {
        let mainLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        labelBasicWork(mainLabel)
        mainLabel.text = text
        mainLabel.textColor = UIColor.black
        mainLabel.font = UIFont(name: "Helvetica", size: 14.0)
        
        addView.addSubview(mainLabel)
        return mainLabel
    }
    
    open func makeLabel(_ spacingText: String, spacingSize: CGFloat, size: CGSize, addView: AnyObject) -> UILabel {
        let mainLabel = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        labelBasicWork(mainLabel)
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacingSize
        mainLabel.attributedText = NSAttributedString(string: spacingText, attributes: [NSAttributedString.Key.paragraphStyle:style])
        
        mainLabel.textColor = UIColor.black
        mainLabel.font = UIFont(name: "Helvetica", size: 14.0)
        
        addView.addSubview(mainLabel)
        return mainLabel
    }
    
    // -----------------------
    
    open func textDecoration(_ label: UILabel, fontSize: CGFloat?, fontName: String?, color: UIColor?, alignment: NSTextAlignment?) {
        if fontSize != nil && fontName != nil {
            label.font = UIFont(name: fontName!, size: fontSize!)
        } else {
            if fontSize != nil {
                label.font = UIFont(name: "Helvetica", size: fontSize!)
            } else if fontName != nil {
                label.font = UIFont(name: fontName!, size: 14.0)
            }
        }
        
        if color != nil {
            label.textColor = color!
        }
        
        if alignment != nil {
            label.textAlignment = alignment!
        }
    }
    
    // MARK : 2017.04.26 lineDecoration 추가
    open func textLineDecoration(label: UILabel, maxLine: Int, breakMode: NSLineBreakMode?) {
        label.numberOfLines = maxLine
        
        if breakMode != nil {
            label.lineBreakMode = breakMode!
        } else {
            label.lineBreakMode = .byWordWrapping
        }
    }
    // -------------------------
    
    open func contentDecoration(label: UILabel, layerColor: UIColor?, bgColor: UIColor?, layerWidth: CGFloat?, corner: CGFloat?) {
        if layerColor != nil && layerWidth != nil {
            label.layer.borderColor = layerColor!.cgColor
            label.layer.borderWidth = layerWidth!
        } else {
            if layerColor != nil {
                label.layer.borderColor = layerColor!.cgColor
            } else if layerWidth != nil {
                label.layer.borderWidth = layerWidth!
            }
        }
        
        if bgColor != nil {
            label.backgroundColor = bgColor!
        }
        
        if corner != nil {
            label.layer.cornerRadius = corner!
        }
    }
    
    open func setSpacingText(label: UILabel, text: String, spacingSize: CGFloat) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacingSize
        label.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle:style])
    }
    
    open func addTouchAction(_ label: UILabel, isVoid: @escaping CompletionHandler, isAction: Selector) {
        let isGesture = UITapGestureRecognizer(target: label, action: isAction)
        label.addGestureRecognizer(isGesture)
    }
    
    // MARK: Make tool
    func labelBasicWork(_ label: UILabel) {
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
    }

}
