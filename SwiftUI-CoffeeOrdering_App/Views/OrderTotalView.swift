//
//  OrderTotalView.swift
//  SwiftUI-CoffeeOrdering_App
//
//  Created by Arpit Dixit on 26/06/21.
//

import SwiftUI

struct OrderTotalView: View {
    let total: Double
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(String(format: "$%.2f",self.total)).font(.title)
                .foregroundColor(Color.green)
            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 4.0)
    }
}
