//
//  recapCollectionCell.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 11/11/2020.
//

import UIKit

class recapCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var memberDate: UILabel!
    @IBOutlet weak var premiumLabel: UILabel!
    @IBOutlet weak var adminLabel: UILabel!
    @IBOutlet weak var planLabel: UILabel!
    
    // MARK: - Variables
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
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
    }
    
    // MARK: - Configuration
    
    func configure(memberDate: String, isPremium: Bool, isAdmin: Bool, plan: String) {
        self.memberDate.text = "Membre depuis le " + memberDate
        self.planLabel.text = "Abonnement de " + plan
        
        if isPremium {
            premiumLabel.text = "Membre premium"
        } else {
            premiumLabel.text = "Membre normale"
        }
        
        if isAdmin {
            adminLabel.text = "Administrateur"
        } else {
            adminLabel.text = "Utilisateur"
        }
    }
    
}
