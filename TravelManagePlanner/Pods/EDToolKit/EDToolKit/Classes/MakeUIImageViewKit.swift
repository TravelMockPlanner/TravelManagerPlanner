//
//  MakeUIImageViewKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 13..
//
//

import Foundation
import UIKit
import SDWebImage

public class MakeUIImageViewKit {
    
    public static let shared = MakeUIImageViewKit()
    
    public init() {
        
    }
    
    // MARK : 2017.04.26 Size(CGRect) -> Size(CGSize) 로 변경
    open func makeImageView(image: UIImage, size: CGSize, addView: AnyObject) -> UIImageView {
        let mainImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        mainImageView.image = image
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        addView.addSubview(mainImageView)
        
        return mainImageView
    }
    // ------------------------
    
    
    // MARK : 2017.04.26 url 이미지 불러오면서 만드는 이미지 뷰의 추가.
    open func makeImageView(imageURL: String, size: CGSize, addView: AnyObject) -> UIImageView {
        let mainImageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        mainImageView.sd_setImage(with: URL(string: imageURL)!)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        addView.addSubview(mainImageView)
        
        return mainImageView
    }
    // -------------------------------
    
    open func containerDecoration(imgView: UIImageView, layerColor: UIColor?, layerWidth: CGFloat?, bgColor: UIColor?, corner: CGFloat?) {
        if layerColor != nil && layerWidth != nil {
            imgView.layer.borderColor = layerColor!.cgColor
            imgView.layer.borderWidth = layerWidth!
        } else {
            if layerColor != nil {
                imgView.layer.borderColor = layerColor!.cgColor
            } else if layerWidth != nil {
                imgView.layer.borderWidth = layerWidth!
            }
        }
        
        if bgColor != nil {
            imgView.backgroundColor = bgColor!
        }
        
        if corner != nil {
            imgView.layer.cornerRadius = corner!
        }
    }
}

extension UIImageView {
    func containerDecoration(layerColor: UIColor?, layerWidth: CGFloat?, bgColor: UIColor?, corner: CGFloat?) {
        if layerColor != nil && layerWidth != nil {
            self.layer.borderColor = layerColor!.cgColor
            self.layer.borderWidth = layerWidth!
        } else {
            if layerColor != nil {
                self.layer.borderColor = layerColor!.cgColor
            } else if layerWidth != nil {
                self.layer.borderWidth = layerWidth!
            }
        }
        
        if bgColor != nil {
            self.backgroundColor = bgColor!
        }
        
        if corner != nil {
            self.layer.cornerRadius = corner!
        }
    }
}
