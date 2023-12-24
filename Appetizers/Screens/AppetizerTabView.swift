//
//  ContentView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {
                    Label("Home",
                          systemImage: "house")
                }
            AccountView()
                .tabItem {
                    Label("Account",
                          systemImage: "person")
                }
            OrderView()
                .tabItem {
                    Label("Order",
                          systemImage: "bag")
                }
        }
        .tint(.BrandPrimary)
    }
}

#Preview {
    AppetizerTabView()
}
