//
//  APButton.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct APButton: View {
    let title:LocalizedStringKey
    var body: some View {
        Text(title)
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .font(.title3)
            .padding()
            .background(Color.BrandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    APButton(title: LocalizedStringKey(MockData.sampleAppetizer.name))
}
