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
    let gradient = CAGradientLayer()
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient(gradient: gradient, startColor: UIColor.black.cgColor, endColor: UIColor.red.cgColor)
        setupImage()
        setupTextFields()
        setupDelegateTF()
        loginButton.roundedButton(cornerRadius: 20, borderWidth: 3, borderColor: UIColor.white)
        gladiatorAnimation()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeScreenSegue" {
            let barViewControllers = segue.destination as! UITabBarController
            let nav = barViewControllers.viewControllers![0] as! UINavigationController
            let destination = nav.topViewController as! HomeScreenController
            destination.viewModel.user = viewModel.user
            guard let user = viewModel.user else {
                return
            }
            User.array.append(user)
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
        
        emailTF.roundedTextFields(cornerRadius: 10, borderColor: .white, borderWidth: 3, placeholder: placeholderEmail, placeholderColor: color)
        passwordTF.roundedTextFields(cornerRadius: 10, borderColor: .white, borderWidth: 3, placeholder: placeholderPassword, placeholderColor: color)
    }
    
    /// Sets up the delegates for the textfields
    private func setupDelegateTF() {
        emailTF.delegate = self
        passwordTF.delegate = self
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

