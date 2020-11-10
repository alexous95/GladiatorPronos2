//
//  Plans.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 10/11/2020.
//

import Foundation

class Plans: Codable {
    var name: String
    var duration: String
    var favorite: Bool
    var isPublished: Bool
    var price: Double
    var createdAt: Date
    var updatedAt: Date
    var esportOnly: Bool
    
    init(name: String, duration: String, favorite: Bool, isPublished: Bool, price: Double, createdAt: Date, updatedAt: Date, esportOnly: Bool) {
        self.name = name
        self.duration = duration
        self.favorite = favorite
        self.isPublished = isPublished
        self.price = price
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.esportOnly = esportOnly
    }
}
