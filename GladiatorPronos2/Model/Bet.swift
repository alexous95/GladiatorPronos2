//
//  Bet.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 09/11/2020.
//

import Foundation

class Bet: Codable {
    var category: String
    var date: Date
    var title: String
    var pronostic: String
    var rating: Double
    
    init(category: String, date: Date, title: String, pronostic: String, rating: Double) {
        self.category = category
        self.date = date
        self.title = title
        self.pronostic = pronostic
        self.rating = rating
    }
}
