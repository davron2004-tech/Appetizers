//
//  OrderListCell.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct OrderListCell: View {
    let appetizer:AppetizerDataModel
    var body: some View {
        HStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 90)
                .padding(.trailing)
            VStack(alignment: .leading,spacing: 5){
                Text(appetizer.name)
                    .fontWeight(.medium)
                    .font(.title2)
                Text("$\(appetizer.price,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
            }
            
        }
    }
}
#Preview {
    OrderListCell(appetizer: MockData.sampleOrder)
}
