//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 26/12/23.
//

import Foundation
import SwiftUI

struct StandardButtonStyle:ViewModifier{
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(.BrandPrimary)
            .controlSize(.large)
    }
}

extension View{
    func standardButtonStyle(){
        self.modifier(StandardButtonStyle())
    }
}
