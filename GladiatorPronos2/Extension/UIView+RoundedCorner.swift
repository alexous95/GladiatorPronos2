//
//  UIView+RoundedCorner.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 13/11/2020.
//

import Foundation
import UIKit

extension UIView{
    
    /// Makes the corner of the view rounded
    /// - Parameter cornerRadius: The value for our rounded corner
    /// - Parameter view: The view that is going to receive the modification
    class func roundedCorner(cornerRadius: CGFloat, view: UIView) {
        view.layer.cornerRadius = cornerRadius
        view.layer.masksToBounds = true
    }
}
