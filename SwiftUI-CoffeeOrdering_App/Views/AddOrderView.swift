//
//  AddOrderView.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import SwiftUI

struct AddOrderView: View {
    
    @Binding var isPresented: Bool
    @ObservedObject var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Form {
                    
                    Section(header: Text("INFORMATION")) {
                        TextField("Enter name", text: $addOrderVM.name)
                    }
                    
                    Section(header: Text("SELECT COFFEE")) {
                        List(addOrderVM.coffeeList, id: \.id) { coffee in
                            CoffeeListCellView(coffee: coffee, selection: $addOrderVM.coffeeName)
                        }
                    }
                    
                    Section(header: Text("SELECT SIZE"), footer: OrderTotalView(total: addOrderVM.total)) {
                        Picker("Select Size", selection: $addOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                HStack {
                    Button("Place Order") {
                        addOrderVM.placeOrder()
                        self.isPresented = false
                    }
                    
                }.padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                .foregroundColor(Color.white)
                .background(Color(red: 46/255, green: 204/255, blue: 113/255))
                .cornerRadius(10)
            }
            
            .navigationTitle("Add Order")
            .navigationBarColor(UIColor(displayP3Red: 23/255, green: 23/255, blue: 23/255, alpha: 1.0))
            
        }
    }
}

struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}

struct CoffeeListCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    
    var body: some View {
        
        HStack {
            
            Image(coffee.imageURL)
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            
            Text(coffee.name)
                .font(.title)
                .padding([.leading], 10)
            
            Spacer()
            Image(systemName: self.selection == self.coffee.name ? "checkmark": "").padding()
        }
        .onTapGesture {
            selection = coffee.name
        }
    }
}
