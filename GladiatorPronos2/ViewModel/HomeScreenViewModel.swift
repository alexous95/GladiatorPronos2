//
//  HomeScreenViewModel.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 09/11/2020.
//

import Foundation
import Combine

class HomeScreenViewModel {
    
    // MARK: - Variables
    
    var winningBets: [WinningBet] = []
    
    // MARK: - Networking
    
    func downloadBets() {
        
        // Cette fonction sera remplacé par un appel réseaux quand l'API sera prete
        let bets = [WinningBet(bets: [Bet(category: "SAFE", date: Date(), title: "FC PORTO - OLYMPIQUE DE MARSEILLE", pronostic: "FC PORTO OU MATCH NUL", rating: 1.54),
                                      Bet(category: "SAFE", date: Date(), title: "MANCHESTER CITY - OLYMPIAKOS", pronostic: "MANCHESTER CITY GAGNANT", rating: 0.01)]),
                    WinningBet(bets: [Bet(category: "SAFE", date: Date(), title: "FC SEVILLE - KRASNODAR", pronostic: "FC SEVILLE GAGNANT", rating: 1.69),
                                      Bet(category: "SAFE", date: Date(), title: "CHELSEA - RENNES", pronostic: "CHELSEA GAGNANT", rating: 0.01)]),
                    WinningBet(bets: [Bet(category: "SAFE", date: Date(), title: "FC PORTO - OLYMPIQUE DE MARSEILLE", pronostic: "FC PORTO OU MATCH NUL", rating: 1.54),
                                                  Bet(category: "Safe", date: Date(), title: "MANCHESTER CITY - OLYMPIAKOS", pronostic: "MANCHESTER CITY GAGNANT", rating: 0.01)]),
                                WinningBet(bets: [Bet(category: "SAFE", date: Date(), title: "FC SEVILLE - KRASNODAR", pronostic: "FC SEVILLE GAGNANT", rating: 1.69),
                                                  Bet(category: "SAFE", date: Date(), title: "CHELSEA - RENNES", pronostic: "CHELSEA GAGNANT", rating: 0.01)])
                    ]
        
        winningBets = bets
    }
    
    // MARK: - Table View Configuration
    
    func numberOfSection() -> Int {
        return 3
    }
    
    func numberOfRowInSection(section: Int) -> Int {
        return winningBets.count
    }
    
    func titleForLabel(section: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        let category = winningBets[section].bets[1].category
        let date = winningBets[section].bets[1].date
        let dateString = formatter.string(from: date)
        
        return category + " " + dateString
    }
    
    func getWelcomeText() -> String {
        let text = """
TOUS LES OUTILS POUR RÉUSSIR
PROFITEZ DE NOUVEAUX PRONOSTICS SAFES ET FUNS PRATIQUEMENT TOUT LES JOURS !
NOS EXPERTS ANALYSENT LES PRONOSTICS AVANT DE LES POSTER.
"""
        
        return text
    }
}
