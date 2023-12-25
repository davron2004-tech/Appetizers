//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import Foundation
import Observation
import SwiftData

@Observable final class OrderViewModel{
    var isShowingAlert = false
    var alertItem: AlertItem? {
        didSet{
            isShowingAlert = true
        }
    }
    var selectedAppetizer: Appetizer?
    var isShowingDetail = false
}
