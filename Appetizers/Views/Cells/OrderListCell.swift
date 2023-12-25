//
//  OrderListCell.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct OrderListCell: View {
    let order:Order
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: order.imageURL)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .padding(.trailing)
            VStack(alignment: .leading,spacing: 5){
                Text(order.name)
                    .fontWeight(.medium)
                    .font(.title2)
                Text("$\(order.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
            }
            
        }
    }
}
#Preview {
    OrderListCell(order: MockData.sampleOrder)
}
