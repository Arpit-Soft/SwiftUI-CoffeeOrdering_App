//
//  OrderListViewModel.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
    @Published var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        Webservice().getAllOrders { (result) in
            switch result {
            case .success(let order):
                self.orders = order.map(OrderViewModel.init)
            case .failure(let error):
                print("Error - \(error.localizedDescription)")
            }
        }
    }
}

struct OrderViewModel {
    
    var id = UUID()
    var order: Order
    
    init(order: Order) {
        self.order = order
    }
    
    var name: String {
        return order.name
    }
    
    var size: String {
        return order.size
    }
    
    var coffeeName: String {
        return order.coffeeName
    }
    
    var total: Double {
        return order.total
    }
}
