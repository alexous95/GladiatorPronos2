//
//  UIViewController+CustomTextFields.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 13/11/2020.
//

import Foundation
import UIKit

extension UITextField {
    
    func roundedTextFields(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat, placeholder: String, placeholderColor: UIColor) {
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : placeholderColor])
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
        
    }
}
