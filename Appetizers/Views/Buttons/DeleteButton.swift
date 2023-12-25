//
//  DeleteButton.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct DeleteButton: View {
    let title:LocalizedStringKey
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .font(.title3)
            .padding()
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    DeleteButton(title: LocalizedStringKey(MockData.sampleOrder.name))
}
