//
//  XDismissButton.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .frame(width: 44,height: 44)
                .foregroundStyle(.black)
                .imageScale(.small)
            
        }
    }
}

#Preview {
    XDismissButton()
}
