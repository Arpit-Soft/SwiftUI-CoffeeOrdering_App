//
//  Order.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import Foundation

struct Order: Codable {
    
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
