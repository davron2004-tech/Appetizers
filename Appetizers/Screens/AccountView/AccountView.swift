//
//  AccountView.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI

struct AccountView: View {
    
    @Bindable var viewModel = AccountViewModel()
    @FocusState var focusTextField:FormTextField?
    enum FormTextField{
        case firstName
        case lastName
        case email
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusTextField,equals: .firstName)
                        .onSubmit {
                            focusTextField = .lastName
                        }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusTextField,equals: .lastName)
                        .onSubmit {
                            focusTextField = .email
                        }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusTextField,equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled(true)
                        .onSubmit {
                            focusTextField = nil
                        }
                        .submitLabel(.continue)
                    
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
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Button{
                        focusTextField = nil
                    }label: {
                        Text("Dismiss")
                    }
                }
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
