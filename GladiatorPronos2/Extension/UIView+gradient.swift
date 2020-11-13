//
//  UIView+gradient.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 12/11/2020.
//

import Foundation
import UIKit

extension UIView {
    
    /// Sets up a gradient for the selected view
    /// - Parameter gradient: The gradient object that will be used
    /// - Parameter startColor: A CGColor object that will be used as the first color of our gradient
    /// - Parameter endColor: A CGColor object that will be used as the second colors of our gradient
    /// - Parameter view: The view in which we will insert our gradient
    ///
    /// Add a gradient to selected view
    func setupGradient(gradient: CAGradientLayer, startColor: CGColor, endColor: CGColor) {
        
        gradient.frame = self.bounds
        gradient.colors = [startColor, endColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    /// Sets up a gradient for the selected view
    /// - Parameter gradient: The gradient object that will be used
    /// - Parameter startColor: A String object that will be used to create the first color of our gradient
    /// - Parameter endColor: A CGColor object that will be used to create the second colors of our gradient
    /// - Parameter view: The view in which we will insert our gradient
    ///
    /// Add a gradient to selected view
    func setupGradient(gradient: CAGradientLayer, startColor: String, endColor: String) {
        
        guard let startColor = UIColor(named: startColor) else {
            return
        }
        
        guard let endColor = UIColor(named: endColor) else {
            return
        }
        
        gradient.frame = self.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
