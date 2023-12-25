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
    var selectedOrder: Order?
    var isShowingDetail = false
    
    func calculateTotalCost(orders: [Order]) -> Double{
        var sum = 0.0
        for order in orders {
            sum += order.price
        }
        return sum
    }
}
