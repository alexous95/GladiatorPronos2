//
//  LoginViewModel.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 11/11/2020.
//

import Foundation

class LoginViewModel {
    
    var user: User?
    //var request = URLRequest(url: URL(string: "On verra plus tard")!)
    
    func login() {
        
        // Partie 2 pour plus tard
//        NetworkManager().launchRequest(request: request) { (data, success) in
//            if success {
//                guard let user = data as? User else {
//                    return
//                }
//                self.user = user
//            } else {
//                print("show alert to user")
//            }
//        }
        
        // Partie 1 qu'on utilise en attndant la base de données
        let decoder = JSONDecoder()
        let bundle = Bundle(for: LoginViewModel.self)
        guard let url = bundle.url(forResource: "user", withExtension: "json") else {
            return
        }
        
        do {
            let userData = try Data(contentsOf: url)
            if let user = try? decoder.decode(User.self, from: userData) {
                self.user = user
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
