//
//  MakeUIButtonKit.swift
//  Pods
//
//  Created by 은아월 on 2017. 4. 13..
//
//

import Foundation
import UIKit

public class MakeUIButtonKit {
    
    public static let shared = MakeUIButtonKit()
    public init() {
        
    }
    
    // MARK : 2017.04.26 Size(CGRect) -> Size(CGSize) 로 변경
    open func makeButton(title: String, size: CGSize, addView: AnyObject) -> UIButton {
        let mainButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        buttonBasicWork(button: mainButton)
        mainButton.setTitle(title, for: .normal)
        addView.addSubview(mainButton)
    
        return mainButton
    }
    
    open func makeButton(titleImage: UIImage, size: CGSize, addView: AnyObject) -> UIButton {
        let mainButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        buttonBasicWork(button: mainButton)
        mainButton.setImage(titleImage, for: .normal)
        addView.addSubview(mainButton)
    
        return mainButton
    }
    
    //-----------------
    
    // MARK : 2017.04.26 Image 버튼의 추가
    open func makeButton(nImage: UIImage, pImage: UIImage, size: CGSize, addView: AnyObject) -> UIButton {
        let mainButton: UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        buttonBasicWork(button: mainButton)
        mainButton.setImage(nImage, for: .normal)
        mainButton.setImage(pImage, for: .highlighted)
        addView.addSubview(mainButton)
    
        return mainButton
    }
    // -----------
    
    open func textDecoration(button: UIButton, fontName: String?, fontSize: CGFloat?, color: UIColor?, pressColor: UIColor?) {
        if fontSize != nil && fontName != nil {
            button.titleLabel!.font = UIFont(name: fontName!, size: fontSize!)
        } else {
            if fontSize != nil {
                button.titleLabel!.font = UIFont(name: "Helvetica", size: fontSize!)
            } else if fontName != nil {
                button.titleLabel!.font = UIFont(name: fontName!, size: 14.0)
            }
        }
        
        if color != nil {
            button.setTitleColor(color!, for: .normal)
        }
        
        if pressColor != nil {
            button.setTitleColor(pressColor!, for: .highlighted)
        }
    }
    
    open func containerDecoration(button: UIButton, layerColor: UIColor?, layerWidth: CGFloat?, bgColor: UIColor?, corner: CGFloat?) {
        if layerColor != nil && layerWidth != nil {
            button.layer.borderColor = layerColor!.cgColor
            button.layer.borderWidth = layerWidth!
        } else {
            if layerColor != nil {
                button.layer.borderColor = layerColor!.cgColor
            } else if layerWidth != nil {
                button.layer.borderWidth = layerWidth!
            }
        }
        
        if bgColor != nil {
            button.backgroundColor = bgColor!
        }
        
        if corner != nil {
            button.layer.cornerRadius = corner!
        }
    }
    
    // MARK : CustomButton Decoration
    open func customButtonBasicSetting(customBtn: AnyObject, mainBg: UIColor?, pressBg: UIColor?, mainLayer: UIColor?, pressLayer: UIColor?, mainTxt: UIColor?, pressTxt: UIColor?) {
        if customBtn is ClickBgEffectButton {
            if mainBg != nil {
                (customBtn as! ClickBgEffectButton).mainColor = mainBg!
            }
            
            if pressBg != nil {
                (customBtn as! ClickBgEffectButton).pressColor = pressBg!
            }

            return
        }
        
        if customBtn is ClickLayerEffectButton {
            if mainLayer != nil {
                (customBtn as! ClickLayerEffectButton).mainBorderLayer = mainLayer!
            }
            
            if pressLayer != nil {
                (customBtn as! ClickLayerEffectButton).pressBorderLayer = pressLayer!
            }

            return
        }
        
        if customBtn is ClickBgAndTextEffectButton {
            if mainBg != nil {
                (customBtn as! ClickBgAndTextEffectButton).mainBgColor = mainBg!
            }
            
            if pressBg != nil {
                (customBtn as! ClickBgAndTextEffectButton).pressBgColor = pressBg!
            }
            
            if mainTxt != nil {
                (customBtn as! ClickBgAndTextEffectButton).mainTextColor = mainTxt!
            }
            
            if pressTxt != nil {
                (customBtn as! ClickBgAndTextEffectButton).pressTextColor = pressTxt!
            }

            return
        }
        
        if customBtn is ClickLayerAndTextEffectButton {
            if mainLayer != nil {
                (customBtn as! ClickLayerAndTextEffectButton).mainLayerColor = mainLayer!
            }

            if pressLayer != nil {
                (customBtn as! ClickLayerAndTextEffectButton).pressLayerColor = pressLayer!
            }

            if mainTxt != nil {
                (customBtn as! ClickLayerAndTextEffectButton).mainTextColor = mainTxt!
            }

            if pressTxt != nil {
                (customBtn as! ClickLayerAndTextEffectButton).pressTextColor = pressTxt!
            }

            return
        }
        
        //ClickMultiEffectButton
        // MARK : 2017.04.25 MultiEffectButton 으로 되어있지 않던것들에 대해 수정.
        if mainBg != nil {
            (customBtn as! ClickMultiEffectButton).mainBgColor = mainBg!
        }

        if pressBg != nil {
            (customBtn as! ClickMultiEffectButton).pressBgColor = pressBg!
        }

        if mainLayer != nil {
            (customBtn as! ClickMultiEffectButton).mainLayerColor = mainLayer!
        }

        if pressLayer != nil {
            (customBtn as! ClickMultiEffectButton).pressLayerColor = pressLayer!
        }

        if mainTxt != nil {
            (customBtn as! ClickMultiEffectButton).mainTextColor = mainTxt!
        }

        if pressTxt != nil {
            (customBtn as! ClickMultiEffectButton).pressTextColor = pressTxt!
        }
    }
    
    // MARK : Make Button basic
    func buttonBasicWork(button: UIButton) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica".localized, size: 14)
    }
}

extension UIButton {
    // 2017.06.14 - 버튼 함수의 익스텐션화, 텍스트 꾸미기
    func textDecoration(fontName: String?, fontSize: CGFloat?, color: UIColor?, pressColor: UIColor?) {
        if fontSize != nil && fontName != nil {
            self.titleLabel!.font = UIFont(name: fontName!, size: fontSize!)
        } else {
            if fontSize != nil {
                self.titleLabel!.font = UIFont(name: "Helvetica", size: fontSize!)
            } else if fontName != nil {
                self.titleLabel!.font = UIFont(name: fontName!, size: 14.0)
            }
        }
        
        if color != nil {
            self.setTitleColor(color!, for: .normal)
        }
        
        if pressColor != nil {
            self.setTitleColor(pressColor!, for: .highlighted)
        }
    }
    
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
