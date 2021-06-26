//
//  ContentView.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 24/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            OrderListView(orders: orderListVM.orders)
                .navigationTitle("Coffee Orders")
                .navigationBarColor(UIColor(displayP3Red: 23/255, green: 23/255, blue: 23/255, alpha: 1.0))
                .navigationBarItems(leading: Button(action: reloadOrders) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(Color.white)
                    }, trailing: Button(action: showAddCoffeeOrderView){
                        Image(systemName: "plus")
                            .foregroundColor(Color.white)
                })
                .sheet(isPresented: self.$showModal) {
                    AddOrderView(isPresented: self.$showModal)
                }
        }
    }
    
    private func reloadOrders() {
        orderListVM.fetchAllOrders()
    }
    
    private func showAddCoffeeOrderView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
