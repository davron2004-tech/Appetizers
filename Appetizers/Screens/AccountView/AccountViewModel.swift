//
//  AccoundViewModel.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import SwiftUI
import Observation

@Observable final class AccountViewModel{
    
    @AppStorage("user") @ObservationIgnored private var userData: Data?
    
    var user = User()
    var isShowingAlert = false
    
    var alertItem:AlertItem?{
        didSet{
            isShowingAlert = true
        }
    }
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSaveSuccess
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    func retrieveUser(){
        guard let userData = userData else {
            return
        }
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }
        catch{
            alertItem = AlertContext.invalidUserData
        }
    }
}

