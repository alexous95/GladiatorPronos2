//
//  AccountController.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 11/11/2020.
//

import UIKit

class AccountController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var topAccountView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var gladiatorImage: UIImageView!
    
    // MARK: - Variables
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedTopView()
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = topAccountView.bounds
        setupGradient(gradient: gradient)
    }
    
    private func setupGradient(gradient: CAGradientLayer) {
        guard let startColor = UIColor(named: "SafeBetStartColor") else {
            return
        }
        guard let endColor = UIColor(named: "SafeBetEndColor") else {
            return
        }
        
        gradient.frame = topAccountView.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        topAccountView.layer.insertSublayer(gradient, at: 0)
    }

    private func roundedTopView() {
        topAccountView.layer.cornerRadius = 35
        topAccountView.layer.masksToBounds = true
    }
    
    private func setupView() {
        let user = User.array[0]
        nameLabel.text = user.firstName + " " + user.lastName
        emailLabel.text = user.email
        
        gladiatorImage.layer.cornerRadius = gladiatorImage.frame.width/2
        gladiatorImage.layer.borderWidth = 3
        gladiatorImage.layer.borderColor = UIColor.white.cgColor
        gladiatorImage.layer.masksToBounds = true
    }
}
