//
//  NetworkManager.swift
//  ExchangeRateProsvetova
//
//  Created by Prosvetova Lina on 01.04.2022.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL =  "https://alpha.as50464.net:29870/moby-pre-44/core?r=BEYkZbmV&d=563B4852-6D4B-49D6-A86E-B273DD520FD2&t=ExchangeRates&v=44"
    
    private init() {
        
    }
    
    
   // func getRates(completed: @escaping (Result<[Currency], ERError>) -> Void) {
        func getRates(completed: @escaping (Result<Initial, ERError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let parameters = ["uid": "563B4852-6D4B-49D6-A86E-B273DD520FD2", "type": "ExchangeRates", "rid": "BEYkZbmV"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)", forHTTPHeaderField: "User-Agent")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
       
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodeInitial = try decoder.decode(Initial.self, from: data)
                //completed(.success(decodeInitial.rates))
                completed(.success(decodeInitial))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
        }
    }
    
   

