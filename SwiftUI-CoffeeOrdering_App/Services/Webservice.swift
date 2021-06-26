//
//  Webservice.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import Foundation

enum NetworkError: Error {
    
    case decodingError
    case urlError
    case domainError
    case somethingWrong
}

class Webservice {
    
    func placeOrder(order: Order, completion: @escaping (Result<OrderPlacedResponse, NetworkError>) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(.failure(.urlError))
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONEncoder().encode(order)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            }
            do {
                let orderPlacedResponse = try JSONDecoder().decode(OrderPlacedResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(orderPlacedResponse))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
    func getAllOrders(completion: @escaping (Result<[Order], NetworkError>) -> ()) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.domainError))
                }
                return
            }
            do {
                let orders = try JSONDecoder().decode([Order].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(orders))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
