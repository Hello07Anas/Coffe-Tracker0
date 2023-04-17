//
//  OneDrink.swift
//  CoffeTracker
//
//  Created by Anas Salah on 24/03/2023.
//

import Foundation
//Codable  save  and load from json file
//Identifiable to identifi every elment in struct
struct Drink: Identifiable, Codable {
    let id: UUID
    let name: String
    let caffeine: [Int]
    let coffeeBased: Bool
    let servedWithMilk: Bool
    let baseCalories: Int
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "-")
    }
    
    
    static let exmaple = Drink(id: UUID(), name: "Example Drink", caffeine: [60, 120, 180], coffeeBased: true, servedWithMilk: true, baseCalories: 100)
}
