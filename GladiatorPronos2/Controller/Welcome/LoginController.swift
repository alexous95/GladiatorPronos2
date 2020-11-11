//
//  ViewController.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 09/11/2020.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Outlet
    
    @IBOutlet weak var gladiatorImage: UIImageView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Variable
    
    var viewModel = LoginViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradient()
        setupImage()
        setupTextFields()
        setupDelegateTF()
        setupButton()
        gladiatorAnimation()
    }
    
    // MARK: - UI
    
    /// Sets up the gradient for the background
    ///
    /// Add a gradient as our background
    private func setupGradient() {
        let startColor = UIColor.black
        let endColor = UIColor.systemRed
        let gradient = CAGradientLayer()
        
        gradient.frame = view.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeScreenSegue" {
            let barViewControllers = segue.destination as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destination = nav.topViewController as! HomeScreenController
            destination.viewModel.user = viewModel.user
        }
    }
    
    /// Sets up the image for the login screen
    ///
    /// Draw a white circle around the image and prepare the image view for animation
    private func setupImage() {
        guard let image = UIImage(named: "GladiatorWhite") else {
            return
        }
        
        gladiatorImage.image = image
        gladiatorImage.layer.cornerRadius = gladiatorImage.frame.width/2
        gladiatorImage.layer.borderColor = UIColor.white.cgColor
        gladiatorImage.layer.borderWidth = 3
        gladiatorImage.layer.masksToBounds = true
        gladiatorImage.layer.opacity = 0
    }
    
    /// Sets up the textfields for the login screen
    ///
    /// This function draws a white border around the textfields and change the placeholder's color
    private func setupTextFields() {
        let color = UIColor.lightText
        let placeholderEmail = emailTF.placeholder ?? "Email"
        let placeholderPassword = passwordTF.placeholder ?? "Mot de passe"
        
        emailTF.attributedPlaceholder = NSAttributedString(string: placeholderEmail, attributes: [NSAttributedString.Key.foregroundColor : color])
        emailTF.layer.cornerRadius = 10
        emailTF.layer.borderWidth = 3
        emailTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.masksToBounds = true
        
        passwordTF.attributedPlaceholder = NSAttributedString(string: placeholderPassword, attributes: [NSAttributedString.Key.foregroundColor : color])
        passwordTF.layer.cornerRadius = 10
        passwordTF.layer.borderWidth = 3
        passwordTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.masksToBounds = true
    }
    
    /// Sets up the delegates for the textfields
    private func setupDelegateTF() {
        emailTF.delegate = self
        passwordTF.delegate = self
    }
    
    /// Sets up the button
    ///
    /// Draw a white border around the button and add rounded corner
    private func setupButton() {
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 3
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.masksToBounds = true
    }
    
    // MARK: - Action
    @IBAction func login(_ sender: Any) {
        viewModel.login()
    }
    
    
    // MARK: - Animations
    
    /// Animates the images
    ///
    /// Change the opacity of the image to create an animation
    private func gladiatorAnimation() {
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.autoreverse], animations: {
            self.gladiatorImage.layer.opacity = 1
        }, completion: { (finished) in
            if finished {
                UIView.animate(withDuration: 0.4) {
                    self.gladiatorImage.layer.opacity = 1
                }
            }
        })
    }
}


// MARK: - Extension

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
    }
}

