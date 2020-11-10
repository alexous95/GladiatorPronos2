//
//  WelcomeCell.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import UIKit

class WelcomeCell: UITableViewCell {

    // MARK: - Outlet
    
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var welcomeText: UITextView!
    @IBOutlet weak var subscriptionButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
        addOverlay()
    }

    // MARK: - Configuration
    
    /// Configures the cell
    func configure(welcomeText: String) {
        // We will use the downloaded image later
        
        self.welcomeText.text = welcomeText
    }

    // MARK: - UI
    
    /// Adds shadow behind the letters
    ///
    /// It makes the text more readable with the UIImage behind
    private func addShadow() {
        welcomeText.layer.shadowColor = UIColor.darkGray.cgColor
        welcomeText.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        welcomeText.layer.shadowOpacity = 1.0
        welcomeText.layer.shadowRadius = 3.0
    }
    
    /// Adds an overlay on to the UIImage
    ///
    /// It darken the image to make a nice contrast
    private func addOverlay() {
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: backImage.frame.size.width, height: backImage.frame.size.height))
        overlay.backgroundColor = UIColor.black
        overlay.layer.opacity = 0.5
        backImage.addSubview(overlay)
    }
}
