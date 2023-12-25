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
    
    //MARK: - Network Alerts
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
    //MARK: - Account Alerts
    static let invalidForm = AlertItem(
        title: Text("Invalid Form"),
        message: Text("Please fill in all the fileds!"),
        dismissButton: .default(Text("OK"))
    )
    static let invalidEmail = AlertItem(
        title: Text("Invalid Email"),
        message: Text("Please enter valid email!"),
        dismissButton: .default(Text("OK"))
    )
    //MARK: - Profile Alerts
    static let userSaveSuccess = AlertItem(
        title: Text("Profile Saved"),
        message: Text("Profile Info successfully saved!"),
        dismissButton: .default(Text("OK"))
    )
    static let invalidUserData = AlertItem(
        title: Text("Profile Error"),
        message: Text("Error saving or retrieving profile info!"),
        dismissButton: .default(Text("OK"))
    )
    
}
