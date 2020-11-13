//
//  UIButton+Rounded.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 13/11/2020.
//

import Foundation
import UIKit

extension UIButton {
    
    func roundedButton(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.masksToBounds = true
    }
}
