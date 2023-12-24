//
//  Alert.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AlertItem:Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}
 
struct AlertContext{
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("Data received from the server is invalid!"),
        dismissButton: .default(Text("OK"))
    )
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid response from the server!"),
        dismissButton: .default(Text("OK"))
    )
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the server!"),
        dismissButton: .default(Text("OK"))
    )
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request!"),
        dismissButton: .default(Text("OK"))
    )
}
