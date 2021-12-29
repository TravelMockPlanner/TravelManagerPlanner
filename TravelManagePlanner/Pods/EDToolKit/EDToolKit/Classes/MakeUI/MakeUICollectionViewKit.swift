//
//  MakeUICollectionViewKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 28..
//
//

import Foundation
import UIKit

open class MakeUICollectionViewKit {
    
    public static let shared = MakeUICollectionViewKit()
    
    open func makeCollectionView(size: CGSize, flow: viewFlow, addView: AnyObject) -> UICollectionView {
        let flowLayout = UICollectionViewFlowLayout()
        
        if flow == .Horizontal {
            flowLayout.scrollDirection = .horizontal
        } else {
            flowLayout.scrollDirection = .vertical
        }
        
        let mainCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), collectionViewLayout: flowLayout)
        mainCollectionView.backgroundColor = UIColor.clear
        mainCollectionView.translatesAutoresizingMaskIntoConstraints = false
        addView.addSubview(mainCollectionView)
        
        return mainCollectionView
    }
}

extension UICollectionView {
    public func registCells(cellData: [AnyClass]) {
        for i in 0...cellData.count - 1 {
            self.register(cellData[i].self, forCellWithReuseIdentifier: String(describing: cellData[i].self))
        }
    }
    
    public func contentDecoration(layerColor: UIColor?, bgColor: UIColor?, layerWidth: CGFloat?) {
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
    }
}

public enum viewFlow {
    case Horizontal
    case Vertical
}
