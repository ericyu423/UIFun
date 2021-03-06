//
//  HelperExtensions.swift
//  UIFun
//
//  Created by eric yu on 6/5/18.
//  Copyright © 2018 eric yu. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    
    
    func anchorToCenter(x: NSLayoutXAxisAnchor?, y: NSLayoutYAxisAnchor?,offsetX: CGFloat, offsetY: CGFloat,width: CGFloat, height: CGFloat){
        translatesAutoresizingMaskIntoConstraints = false
        if let x = x {
            self.centerXAnchor.constraint(equalTo: x, constant: offsetX).isActive = true
        }
        if let y = y {
            self.centerYAnchor.constraint(equalTo: y, constant: offsetY).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
}


//delete this if not needed
class InsetLabel: UILabel {
    let topInset = CGFloat(20)
    let bottomInset = CGFloat(20)
    let leftInset = CGFloat(0)
    let rightInset = CGFloat(0)
    
    override func layoutSubviews() {
        
        //self.preferredMaxLayoutWidth = automatic
        super.layoutSubviews()
    }
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
    override public var intrinsicContentSize: CGSize {
        var intrinsicSuperViewContentSize = super.intrinsicContentSize
        intrinsicSuperViewContentSize.height += topInset + bottomInset
        intrinsicSuperViewContentSize.width += leftInset + rightInset
        return intrinsicSuperViewContentSize
    }
}
