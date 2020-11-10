//
//  PlansController.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import UIKit

class PlansController: UIViewController {

    // MARK: - Variables
    
    var viewModel = PlansViewModel()
    
    // MARK: - Outlet
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        viewModel.downloadPlans()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    // MARK: - Delegates
    
    private func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

// MARK: - Collection View Extensions

extension PlansController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "plansCell", for: indexPath) as? PlansCollectionCell else {
            return UICollectionViewCell()
        }
        
        let plan = viewModel.plans[indexPath.item]
        let price = viewModel.price(item: indexPath.item)
        let pricePerDay = viewModel.pricePerDay(item: indexPath.item)
        let category = viewModel.category(item: indexPath.item)
        
        cell.configure(title: plan.name, price: price, pricePerDay: pricePerDay, category: category)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (view.frame.width / 1.2), height: (view.frame.height / 2.5))
    }

}
