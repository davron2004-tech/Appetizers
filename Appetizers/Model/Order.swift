//
//  Order.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 26/12/23.
//

import Foundation
import SwiftData

@Model
class Order{
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
