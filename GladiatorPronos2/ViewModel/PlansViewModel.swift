//
//  PlansViewModel.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import Foundation

class PlansViewModel {
    
    var plans: [Plans] = []
    
    func downloadPlans() {
        // This function will download all the plans from the database when we access to it
        
        let downloadedPlans = [Plans(name: "1 MOIS", duration: "1", favorite: false, isPublished: true, price: 19.99, createdAt: Date(), updatedAt: Date(), esportOnly: false),
                     Plans(name: "3 MOIS", duration: "3", favorite: false, isPublished: true, price: 39.99, createdAt: Date(), updatedAt: Date(), esportOnly: false),
                     Plans(name: "6 MOIS", duration: "6", favorite: false, isPublished: true, price: 69.99, createdAt: Date(), updatedAt: Date(), esportOnly: false)
        ]
        
        plans = downloadedPlans
    }
    
    func numberOfItem() -> Int {
        return 3
    }
    
    func price(item: Int) -> String {
        let price = plans[item].price
        return String(price) + "€"
    }
    
    func pricePerDay(item: Int) -> String {
        let price = plans[item].price
        let duration = Double(plans[item].duration) ?? 0.0
        let totalDuration = duration * 30
        let pricePerDay = price / totalDuration
        
        return "Soit " + String(format: "%.2f", pricePerDay) + "€ / jours"
    }
    
    func category(item: Int) -> String {
        let onlyEsport = plans[item].esportOnly
        
        if onlyEsport {
            return "Pronostics ESPORT"
        } else {
            return "Pronostics SPORT & ESPORT"
        }
    }
    
}
