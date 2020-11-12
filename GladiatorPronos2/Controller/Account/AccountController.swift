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
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Variables
    
    let gradient = CAGradientLayer()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedTopView()
        setupView()
        setupDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = topAccountView.bounds
        setupGradient(gradient: gradient)
    }
    
    // MARK: - Delegates
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    // MARK: - UI
    
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

// MARK: - Collection View Extension

extension AccountController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recapCell", for: indexPath) as? recapCollectionCell else {
                return UICollectionViewCell()
            }
            
            let user = User.array[0]
            cell.configure(memberDate: "10 Octobre 2020", isPremium: user.isPremium , isAdmin: user.admin, plan: user.currentPlan)
            
            return cell
        
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "modifCell", for: indexPath) as? ModifCollectionCell else {
                return UICollectionViewCell()
            }
            
            let user = User.array[0]
            cell.configure(firstName: user.firstName, lastName: user.lastName, email: user.email)
            
            return cell
            
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recapCell", for: indexPath) as? recapCollectionCell else {
                return UICollectionViewCell()
            }
            
            cell.configure(memberDate: "24 Octobre 2020", isPremium: false , isAdmin: false, plan: "1 mois")
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: (view.frame.width / 1.3), height: (view.frame.height / 2.65))
    }
}
