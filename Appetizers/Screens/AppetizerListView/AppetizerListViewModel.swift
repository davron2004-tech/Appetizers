//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import SwiftUI
import Observation

@Observable final class AppetizerListViewModel{
    var appetizers: [Appetizer] = []
    var isShowingAlert = false
    var isLoading = false
    var alertItem: AlertItem? {
        didSet{
            isShowingAlert = true
        }
    }
    func getAppetizers(){
        isLoading = true
        NetworkManager.shared.getAppetizers {result in
            DispatchQueue.main.async { [self] in
                isLoading = false
                switch result{
                    
                    case .success(let appetizers):
                        self.appetizers = appetizers
                    
                    case .failure(let error):
                    
                        switch error{
                            
                            case .invalidData:
                                alertItem = AlertContext.invalidData
                            case .invalidResponse:
                                alertItem = AlertContext.invalidResponse
                            case .invalidURL:
                                alertItem = AlertContext.invalidURL
                            case .unableToComplete:
                                alertItem = AlertContext.unableToComplete
                            
                    }
                }
            }
        }
    }
}
