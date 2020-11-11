//
//  PlansCollectionCell.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import UIKit

class PlansCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pricePerDayLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        contentView.layer.cornerRadius = 20
        contentView.layer.masksToBounds = true
    }
    
    // MARK: - Configuration
    
    func configure(title: String, price: String, pricePerDay: String, category: String) {
        titleLabel.text = title
        priceLabel.text = price
        pricePerDayLabel.text = pricePerDay
        categoryLabel.text = category
    }
    
}
