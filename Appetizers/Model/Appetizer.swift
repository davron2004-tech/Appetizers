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

@Model
class AppetizerDataModel{
    var id: Int
    var name: String
    var mealDescription: String
    var price: Double
    var imageURL: String
    var calories: Int
    var protein: Int
    var carbs: Int
    init(id: Int, name: String, description: String, price: Double, imageURL: String, calories: Int, protein: Int, carbs: Int) {
        self.id = id
        self.name = name
        self.mealDescription = description
        self.price = price
        self.imageURL = imageURL
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
    }
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
}
