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
    let notificationCenter = NotificationCenter.default
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.roundedCorner(cornerRadius: 35, view: topAccountView)
        setupView()
        setupDelegates()
        addNotification()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradient.frame = topAccountView.bounds
        topAccountView.setupGradient(gradient: gradient, startColor: "SafeBetStartColor", endColor: "SafeBetEndColor")
    }
    
    // MARK: - Delegates
    
    private func setupDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Notification
    
    private func addNotification() {
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name:UIResponder.keyboardWillHideNotification, object: nil)

        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        if let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardScreenEndFrame = keyboardValue.cgRectValue
            let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
            
            if notification.name == UIResponder.keyboardWillHideNotification {
                collectionView.contentInset = .zero
            } else {
                collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom - 30 , right: 0)
            }
        }
    }
    
    // MARK: - UI
    
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
        return 2
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
            
            cell.nameTF.delegate = self
            cell.lastNameTF.delegate = self
            cell.emailTF.delegate = self
            cell.passwordTF.delegate = self
            
            let user = User.array[0]
            cell.configure(firstName: user.firstName, lastName: user.lastName, email: user.email)
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width / 1.3), height: (view.frame.height / 2.65))
    }
}

extension AccountController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("returned")
        textField.resignFirstResponder()
        return true
    }
}
