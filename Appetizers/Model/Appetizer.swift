//
//  Appetizer.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 24/12/23.
//

import Foundation
import SwiftData

struct Appetizer: Decodable,Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse:Decodable{
    let request: [Appetizer]
}

struct MockData{
    static let sampleAppetizer = Appetizer(id: 001,
                                           name: "Test Appetizer",
                                           description: "This the description for my appetizer",
                                           price: 23.45,
                                           imageURL: "",
                                           calories: 10,
                                           protein: 15,
                                           carbs: 20
    )
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    static let sampleOrder = Order(id: 001,
                                           name: "Test Appetizer",
                                           description: "This the description for my appetizer",
                                           price: 23.45,
                                           imageURL: "",
                                           calories: 10,
                                           protein: 15,
                                           carbs: 20
    )
    static let orders = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
