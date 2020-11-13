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
        contentView.setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor")

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = contentView.bounds
        contentView.setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor")
    }
    
    // MARK: - UI
    
    private func setupUI() {
        contentView.layer.cornerRadius = 25
        contentView.layer.masksToBounds = true
        
        modifyButton.roundedButton(cornerRadius: 20, borderWidth: 2, borderColor: .gray)
    }
    
    private func setupTextFields() {
        let placeholderColor = UIColor.lightGray
        
        nameTF.roundedTextFields(cornerRadius: 10, borderColor: .gray, borderWidth: 2, placeholder: "Prénom", placeholderColor: placeholderColor)
        
        lastNameTF.roundedTextFields(cornerRadius: 10, borderColor: .gray, borderWidth: 2, placeholder: "Nom", placeholderColor: placeholderColor)
        
        emailTF.roundedTextFields(cornerRadius: 10, borderColor: .gray, borderWidth: 2, placeholder: "Email", placeholderColor: placeholderColor)
        
        passwordTF.roundedTextFields(cornerRadius: 10, borderColor: .gray, borderWidth: 2, placeholder: "Mot de passe", placeholderColor: placeholderColor)
    }
    
    func configure(firstName: String, lastName: String, email: String) {
        nameTF.text = firstName
        lastNameTF.text = lastName
        emailTF.text = email
    }
    
    
}
