//
//  AccountView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AccountView: View {
    
    @Bindable var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                    DatePicker("Birthday", selection: $viewModel.user.birthDay, displayedComponents: .date)
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                }
                Section("Requests"){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(Color.BrandPrimary)
                
            }
            .navigationTitle("Account")
        }
        .onAppear{
            viewModel.retrieveUser()
        }
        .alert(isPresented: $viewModel.isShowingAlert){
            Alert(title: viewModel.alertItem!.title,
                  message: viewModel.alertItem?.message,
                  dismissButton: viewModel.alertItem?.dismissButton
            )
        }
        
        
    }
}

#Preview {
    AccountView()
}
