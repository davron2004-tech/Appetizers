//
//  User.swift
//  Appetizers
//
//  Created by Davron Abdukhakimov on 25/12/23.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDay = Date()
    var extraNapkins = false
    var frequentRefills = false
}
