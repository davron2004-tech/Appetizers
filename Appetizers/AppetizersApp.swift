//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import SwiftData

@main
struct AppetizersApp: App {
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
        }
        .modelContainer(for: AppetizerDataModel.self)
    }
}
