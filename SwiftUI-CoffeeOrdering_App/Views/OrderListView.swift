//
//  OrderListView.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import SwiftUI

struct OrderListView: View {
    
    var orders: [OrderViewModel]
    
    init(orders: [OrderViewModel]) {
        self.orders = orders
    }
    
    var body: some View {
        
        List(self.orders, id: \.id) { order in
            
            HStack {
                
                Image(order.coffeeName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    
                    Text(order.name)
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    HStack {
                        
                        Text(order.coffeeName)
                            .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
                            .font(.headline)
                            .background(Color(red: 68/255, green: 68/255, blue: 68/255))
                            .foregroundColor(.white)
                        
                        Text(order.size)
                            .padding(EdgeInsets(top: 7, leading: 10, bottom: 7, trailing: 10))
                            .font(.headline)
                            .background(Color(red: 218/255, green: 0/255, blue: 55/255))
                            .foregroundColor(.white)
                    }
                    .padding([.top], 2)
                })
            }
        }
        .padding(0)
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [OrderViewModel(order: Order(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3.0))])
    }
}
