//
//  ModifCollectionCell.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 12/11/2020.
//

import UIKit

class ModifCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var modifyButton: UIButton!
    
    // MARK: - Variables
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupTextFields()
        setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor", view: contentView)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = contentView.bounds
        setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor", view: contentView)
    }
    
    // MARK: - UI
    
    private func setupUI() {
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        
        modifyButton.layer.cornerRadius = 20
        modifyButton.layer.borderWidth = 2
        modifyButton.layer.borderColor = UIColor.gray.cgColor
        modifyButton.layer.masksToBounds = true
    }
    
    private func setupTextFields() {
        nameTF.layer.borderColor = UIColor.gray.cgColor
        nameTF.layer.borderWidth = 2
        nameTF.layer.cornerRadius = 10
        
        lastNameTF.layer.borderColor = UIColor.gray.cgColor
        lastNameTF.layer.borderWidth = 2
        lastNameTF.layer.cornerRadius = 10
        
        emailTF.layer.borderColor = UIColor.gray.cgColor
        emailTF.layer.borderWidth = 2
        emailTF.layer.cornerRadius = 10
        
        passwordTF.layer.borderColor = UIColor.gray.cgColor
        passwordTF.layer.borderWidth = 2
        passwordTF.layer.cornerRadius = 10
    }
    
    func configure(firstName: String, lastName: String, email: String) {
        nameTF.text = firstName
        lastNameTF.text = lastName
        emailTF.text = email
    }
    
    
}
