//
//  AddOrderViewModel.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import Foundation

class AddOrderViewModel: ObservableObject {
    
    var name: String = ""
    @Published var coffeeName: String = ""
    @Published var size: String = "Medium"
    
    private var webservice: Webservice
    
    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }
    
    var total: Double {
       return calculateTotalPrice()
    }
    
    init() {
        self.webservice = Webservice()
    }
    
    func placeOrder() {
        let order = Order(name: name, size: size, coffeeName: coffeeName, total: total)
        webservice.placeOrder(order: order) { (result) in
            switch result {
            case .success(let response):
                print("Order Placed \(response.success)")
            case .failure(let error):
                print("Error - \(error.localizedDescription)")
            }
        }
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priceForSize()
        } else {
            return 0.0
        }
    }
    
    private func priceForSize() -> Double {
        let prices = ["Small":2.0, "Medium":3.0, "Large":4.0]
        return prices[self.size]!
    }
}
