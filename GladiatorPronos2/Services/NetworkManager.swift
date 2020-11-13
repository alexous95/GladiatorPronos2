//
//  NetworkManager.swift
//  GladiatorPronos2
//
//  Created by Alexandre Goncalves on 11/11/2020.
//

import Foundation

class NetworkManager {
    
    private var defaultSession = URLSession(configuration: .default)
    private var task: URLSessionDataTask?
    
    /// Launches a network request to retrieve data with custom parameters
    /// - Parameter request: An URLRequest object that is created in another class and is used to launch our task
    /// - Parameter completionHandler: A closure of type (Any?, Bool) -> Void that is used to pass the received data if the network call is successful
    func launchRequest(request: URLRequest, completionHandler: @escaping((Any?, Bool) -> Void)) {
        task?.cancel()
        task = defaultSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completionHandler(nil, false)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completionHandler(nil, false)
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(User.self, from: data)
                    completionHandler(decoded, true)
                } catch {
                    completionHandler(nil, false)
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
