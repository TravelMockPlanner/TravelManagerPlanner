//
//  MakeUITextViewKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 14..
//
//

import Foundation

public class MakeUITextViewKit {
    
    public static let shared = MakeUITextViewKit()
    public init() {
        
    }
    
    // MARK : 2017.04.26 Size(CGRect) -> Size(CGSize) 로 변경
    open func makeTextView(text: String, size: CGSize, addView: AnyObject) -> UITextView {
        let mainTextView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        mainTextView.text = text
        mainTextView.isEditable = false
        mainTextView.isScrollEnabled = false
        mainTextView.textContainerInset = UIEdgeInsets.zero
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.textColor = UIColor.black
        mainTextView.isEditable = false
        mainTextView.font = UIFont(name: "Helvetica", size: 14)
        addView.addSubview(mainTextView)
        
        return mainTextView
    }
    
    open func makeTextView(spacingText: String, spacingSize: CGFloat, size: CGSize, addView: AnyObject) -> UITextView {
        let mainTextView: UITextView = UITextView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacingSize
        mainTextView.attributedText = NSAttributedString(string: spacingText, attributes: [NSAttributedString.Key.paragraphStyle:style])
        
        mainTextView.isEditable = false
        mainTextView.isScrollEnabled = false
        mainTextView.textContainerInset = UIEdgeInsets.zero
        mainTextView.translatesAutoresizingMaskIntoConstraints = false
        mainTextView.textColor = UIColor.black
        mainTextView.font = UIFont(name: "Helvetica", size: 14)
        addView.addSubview(mainTextView)
        
        return mainTextView
    }
    // ------------------------
    
    open func textDecoration(textView: UITextView, fontSize: CGFloat?, fontName: String?, color: UIColor?, alignment: NSTextAlignment?) {
        if fontSize != nil && fontName != nil {
            textView.font = UIFont(name: fontName!, size: fontSize!)
        } else {
            if fontSize != nil {
                textView.font = UIFont(name: "Helvetica", size: fontSize!)
            } else if fontName != nil {
                textView.font = UIFont(name: fontName!, size: 14.0)
            }
        }
        
        if color != nil {
            textView.textColor = color!
        }
        
        if alignment != nil {
            textView.textAlignment = alignment!
        }
    }
    
    open func contentDecoration(textView: UITextView, layerColor: UIColor?, bgColor: UIColor?, layerWidth: CGFloat?, corner: CGFloat?) {
        if layerColor != nil && layerWidth != nil {
            textView.layer.borderColor = layerColor!.cgColor
            textView.layer.borderWidth = layerWidth!
        } else {
            if layerColor != nil {
                textView.layer.borderColor = layerColor!.cgColor
            } else if layerWidth != nil {
                textView.layer.borderWidth = layerWidth!
            }
        }
        
        if bgColor != nil {
            textView.backgroundColor = bgColor!
        }
        
        if corner != nil {
            textView.layer.cornerRadius = corner!
        }
    }
    
    open func setSpacingText(textView: UITextView, text: String, spacingSize: CGFloat) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacingSize
        style.minimumLineHeight = 20
        textView.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle:style])
    }
    
    open func setSpacingText(textView: UITextView, text: String, spacingSize: CGFloat, minSize: CGFloat) {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacingSize
        style.minimumLineHeight = minSize
        textView.attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle:style])
    }
}
