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
    
    // MARK: - Variables
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupGradient(gradient: gradient)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = contentView.bounds
        setupGradient(gradient: gradient)
    }
    
    // MARK: - UI
    
    private func setupUI() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }
    
    private func setupGradient(gradient: CAGradientLayer) {
        guard let startColor = UIColor(named: "SafeBetStartColor") else {
            return
        }
        guard let endColor = UIColor(named: "SafeBetEndColor") else {
            return
        }
        
        gradient.frame = contentView.bounds
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        contentView.layer.insertSublayer(gradient, at: 0)
    }
    
    // MARK: - Configuration
    
    func configure(memberDate: String, isPremium: Bool, isAdmin: Bool) {
        self.memberDate.text = "Membre depuis le " + memberDate
        
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
