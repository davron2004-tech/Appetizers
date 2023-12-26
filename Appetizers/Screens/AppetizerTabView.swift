//
//  ContentView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import SwiftData

struct AppetizerTabView: View {
    @Query var orders:[Order]
    var body: some View {
        TabView{
            AppetizerListView()
                .tabItem {Label("Home",systemImage: "house")}
            AccountView()
                .tabItem {Label("Account",systemImage: "person")}
            OrderView()
                .tabItem {Label("Order",systemImage: "bag")}
                .badge(orders.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
