//
//  SafeBetCell.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 09/11/2020.
//

import UIKit

class SafeBetCell: UITableViewCell {

    // MARK: - Outlet
    
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var title2: UILabel!
    @IBOutlet weak var pronostic1: UILabel!
    @IBOutlet weak var pronostic2: UILabel!
    @IBOutlet weak var typeAndDate: UILabel!
    @IBOutlet weak var totalOdd: UILabel!
    @IBOutlet weak var backView: UIView!
    
    // MARK: - Variable
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = backView.bounds
        setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor", view: backView)
    }

    // MARK: - Configuration
    
    /// Configures the cell forthe controller
    func configure(title1: String, title2: String, pronostic1: String, pronostic2: String, date: String, totalOdd: String = "1,7") {
        self.title1.text = title1
        self.title2.text = title2
        self.pronostic1.text = pronostic1
        self.pronostic2.text = pronostic2
        self.typeAndDate.text = date
        self.totalOdd.text = totalOdd
    }
    
    // MARK: - UI
    
    /// Sets up the labels
    ///
    /// Add rounded corner for the labels
    private func setupUI() {
        typeAndDate.layer.cornerRadius = 10
        typeAndDate.layer.masksToBounds = true
        
        totalOdd.layer.cornerRadius = 10
        totalOdd.layer.masksToBounds = true
        
        backView.layer.cornerRadius = 20
        backView.layer.masksToBounds = true
    }
}
