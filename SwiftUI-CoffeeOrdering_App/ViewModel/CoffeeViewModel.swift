//
//  CoffeeViewModel.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import Foundation

struct CoffeeViewModel {
    
    var id = UUID()
    var coffee: Coffee
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    var name: String {
        return coffee.name
    }
    
    var imageURL: String {
        return coffee.imageURL
    }
    
    var price: Double {
        return coffee.price
    }
}

